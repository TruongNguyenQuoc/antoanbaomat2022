package com.example.shoesproject.controller;

import com.example.shoesproject.model.*;
import com.example.shoesproject.service.OrderDetailService;
import com.example.shoesproject.service.OrderService;
import com.example.shoesproject.service.impl.OrderDetailServiceImpl;
import com.example.shoesproject.service.impl.OrderServiceImpl;
import com.example.shoesproject.util.SignatureUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import java.util.TreeMap;
@MultipartConfig(maxFileSize = 1024 * 10)
@WebServlet(name = "checkout", value = "/checkout")
public class CheckoutController extends HttpServlet {

    private OrderService orderService = new OrderServiceImpl();
    private OrderDetailService orderDetailService = new OrderDetailServiceImpl();
    private SignatureUser signatureUser = new SignatureUser();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        Cart cart = (Cart) session.getAttribute("cart");

        if (account == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        if (cart.getList().size() == 0) {
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String address = request.getParameter("address");
        String shipping = request.getParameter("shipping");

        String uploadFolder = request.getServletContext().getRealPath("/uploads");
        Path pathUpload = Paths.get(uploadFolder);
        Part partUpload = request.getPart("fileKey");

        if (account == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if(account.getAddress() == null || account.getPhone() == null || account.getPublicKey().equals("")) {
                session.setAttribute("address_err", "Please check your detail account or create public / private key");
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } else if (signatureUser.checkPrivateKey(partUpload, pathUpload, account.getPublicKey())) {
                try {
                    Cart cart = (Cart) session.getAttribute("cart");
                    Date date = new Date();

                    Order order = new Order();
                    order.setAccountId(account.getId());
                    order.setAddress(address);
                    order.setProgress("PENDING");
                    order.setShipping(shipping);
                    order.setCreateAt(new Timestamp(date.getTime()));
                    order.setTotalCost(cart.totalCost());
                    order.setStatus(true);
                    orderService.save(order);

                    TreeMap<Product, Integer> list = cart.getList();
                    for (Map.Entry<Product, Integer> item: list.entrySet()) {
                        OrderDetail orderDetail = new OrderDetail();
                        orderDetail.setOrderId(order.getId());
                        orderDetail.setProductId(item.getKey().getId());
                        orderDetail.setPrice(item.getKey().getPrice());
                        orderDetail.setDiscount(item.getKey().getDiscount());
                        orderDetail.setAmount(item.getValue());

                        orderDetailService.save(orderDetail);
                    }

                    session.removeAttribute("cart");
                    session.removeAttribute("totalCost");
                    session.removeAttribute("totalProduct");
                    response.sendRedirect("/profile");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                session.setAttribute("key_err", "Please check your private key");
                request.getRequestDispatcher("checkout.jsp").include(request, response);
            }
        }
    }
}
