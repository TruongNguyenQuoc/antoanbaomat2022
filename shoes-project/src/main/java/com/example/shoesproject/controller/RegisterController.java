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

@WebServlet(name = "RegisterController", value = "/register")
public class RegisterController extends HttpServlet {

    private AccountService accountService = new AccountServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = null;
        String url = "";

        String fullName = request.getParameter("fullName");
        String username = request.getParameter("username");
        String password = SecurityUtil.encoderStringToMD5(request.getParameter("password"));
        String confirmPassword = SecurityUtil.encoderStringToMD5(request.getParameter("password"));
        String email = request.getParameter("email");

        Account account = accountService.findByUserName(username);
        if (account == null) {
            if (confirmPassword.equals(password)) {
                account = new Account();

                account.setFullName(fullName);
                account.setUsername(username);
                account.setPassword(password);
                account.setEmail(email);
                account.setPublicKey("");
                account.setStatus(true);
                account.setRoleId(2);

                accountService.save(account);
                url = "/login.jsp";
                requestDispatcher = getServletContext().getRequestDispatcher(url);
                requestDispatcher.forward(request, response);
            } else {
                SessionUtil.getInstance().putValue(request, "password", "Password is invalid");
                url = "/login.jsp";
                requestDispatcher = getServletContext().getRequestDispatcher(url);
                requestDispatcher.include(request, response);
            }
        } else{
            SessionUtil.getInstance().putValue(request, "username", "Username is exist");
            url = "/login.jsp";
            requestDispatcher = getServletContext().getRequestDispatcher(url);
            requestDispatcher.include(request, response);
        }

    }
}
