package com.example.shoesproject.controller.admin;

import com.example.shoesproject.model.Account;
import com.example.shoesproject.model.OrderDTO;
import com.example.shoesproject.model.Orders;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "orders-admin", value = "/orders-admin")
public class OrdersAdminController extends HttpServlet {

    private OrderService orderService = new OrderServiceImpl();

    private AccountService accountService = new AccountServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Account account = (Account) session.getAttribute("account");

        if (account == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (account.getRoleId() != 1) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                List<OrderDTO> orders = new ArrayList<>();

                for (Orders item: orderService.findAll()) {
                    Account accountTemp = accountService.findByIds(item.getAccountId());
                    OrderDTO orderDTO = new OrderDTO(item.getId(), item.getAccountId(), item.getPhone(), item.getAddress(), item.getProgress(), item.getShipping(), item.getCreateAt(), item.getTotalCost(), item.isStatus(), accountTemp.getFullName());
                    orders.add(orderDTO);
                }
                request.setAttribute("orders", orders);
                request.getRequestDispatcher("/admin/order-admin.jsp").forward(request, response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
