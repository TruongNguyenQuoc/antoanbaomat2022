package com.example.shoesproject.controller;

import com.example.shoesproject.model.Account;
import com.example.shoesproject.service.AccountService;
import com.example.shoesproject.service.impl.AccountServiceImpl;
import com.example.shoesproject.util.SecurityUtil;
import com.example.shoesproject.util.SessionUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    private AccountService accountService = new AccountServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        if (command == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (command.equals("logout")) {
                HttpSession session = request.getSession();
                session.invalidate();
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = SecurityUtil.encoderStringToMD5(request.getParameter("password"));
        Account account = accountService.findByUserName(username, password);
        if (account != null) {
            HttpSession session = request.getSession();
            session.setAttribute("account", account);
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
