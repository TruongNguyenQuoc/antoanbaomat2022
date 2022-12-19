package com.example.shoesproject.controller;

import com.example.shoesproject.model.Account;
import com.example.shoesproject.model.Orders;
import com.example.shoesproject.service.AccountService;
import com.example.shoesproject.service.OrderService;
import com.example.shoesproject.service.impl.AccountServiceImpl;
import com.example.shoesproject.service.impl.OrderServiceImpl;
import com.example.shoesproject.util.SignatureUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ProfileController", value = "/profile")
public class ProfileController extends HttpServlet {

    private AccountService accountService = new AccountServiceImpl();
    private OrderService orderService = new OrderServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileName = request.getParameter("fileName");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        SignatureUser signatureUser = new SignatureUser();

        if (account == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (fileName != null && account.getPublicKey().equals("")) {
                String path = getServletContext().getRealPath("/" + "file" + File.separator + fileName);
                response.setContentType("APPLICATION/OCTET-STREAM");
                response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\"");

//                FileInputStream inputStream = new FileInputStream(path);
                out.write(signatureUser.convertPublicKey(signatureUser.getPrivateKey().getEncoded()));
//                inputStream.close();
                out.close();

                account.setPublicKey(signatureUser.convertPublicKey(signatureUser.getPublicKey().getEncoded()));
                accountService.update(account);
            }

            List<Orders> orders = orderService.findByAccountId(account.getId());
            request.setAttribute("order", orders);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
