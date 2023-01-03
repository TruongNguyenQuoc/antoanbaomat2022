package com.example.shoesproject.controller.admin;

import com.example.shoesproject.model.*;
import com.example.shoesproject.service.AccountService;
import com.example.shoesproject.service.OrderDetailService;
import com.example.shoesproject.service.OrderService;
import com.example.shoesproject.service.ProductService;
import com.example.shoesproject.service.impl.AccountServiceImpl;
import com.example.shoesproject.service.impl.OrderDetailServiceImpl;
import com.example.shoesproject.service.impl.OrderServiceImpl;
import com.example.shoesproject.service.impl.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.TreeMap;

@MultipartConfig()
@WebServlet(name = "orderDetails-admin", value = "/orderDetails-admin")
public class OrderDetailsAdminController extends HttpServlet {

    private OrderService orderService = new OrderServiceImpl();
    private OrderDetailService orderDetailService = new OrderDetailServiceImpl();
    private AccountService accountService = new AccountServiceImpl();
    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        HttpSession session = request.getSession();

        List<OrderDetail> list = orderDetailService.findByOrderId(Long.parseLong(orderId));
        Orders orders = orderService.findById(Long.parseLong(orderId));
        Account account = accountService.findByIds(orders.getAccountId());
        OrderDTO orderDTO = new OrderDTO(orders.getId(), orders.getAccountId(), orders.getPhone(), orders.getAddress(), orders.getProgress(), orders.getShipping(), orders.getCreateAt(), orders.getTotalCost(), orders.isStatus(), account.getFullName());
        TreeMap<Product, Integer> tree = new TreeMap<>();

        for (OrderDetail orderDetail : list) {
            Product product = productService.findById(orderDetail.getProductId());
            tree.put(product, orderDetail.getAmount());
        }
        request.setAttribute("order", orderDTO);
        request.setAttribute("tree", tree);
        request.getRequestDispatcher("/admin/orderDetail-admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
