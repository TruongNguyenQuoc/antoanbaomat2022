package com.example.shoesproject.controller;

import com.example.shoesproject.model.Account;
import com.example.shoesproject.model.OrderDetail;
import com.example.shoesproject.model.Orders;
import com.example.shoesproject.model.Product;
import com.example.shoesproject.service.OrderDetailService;
import com.example.shoesproject.service.OrderService;
import com.example.shoesproject.service.ProductService;
import com.example.shoesproject.service.impl.OrderDetailServiceImpl;
import com.example.shoesproject.service.impl.OrderServiceImpl;
import com.example.shoesproject.service.impl.ProductServiceImpl;
import com.example.shoesproject.util.NumberUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.TreeMap;

@WebServlet(name = "order-detail", value = "/order-detail")
public class OrderDetailController extends HttpServlet {

    private OrderService orderService = new OrderServiceImpl();

    private OrderDetailService orderDetailService = new OrderDetailServiceImpl();

    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String orderId = request.getParameter("orderId");
        if (account == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            Orders orders = orderService.findById(Long.parseLong(orderId));
            List<OrderDetail> orderDetailList = orderDetailService.findByOrderId(orders.getId());

            TreeMap<Product, Integer> list = new TreeMap<>();

            for (OrderDetail orderDetail : orderDetailList) {
                Product product = productService.findById(orderDetail.getProductId());
                list.put(product, orderDetail.getAmount());
            }
            request.setAttribute("progress", orders.getProgress());
            request.setAttribute("orders", orders);
            request.setAttribute("list", list);
            request.setAttribute("totalCost", NumberUtil.formatNumber(orders.getTotalCost()));
            request.getRequestDispatcher("order-detail.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
