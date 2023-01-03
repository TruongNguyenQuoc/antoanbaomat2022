package com.example.shoesproject.controller;

import com.example.shoesproject.model.Account;
import com.example.shoesproject.service.AccountService;
import com.example.shoesproject.service.impl.AccountServiceImpl;
import com.example.shoesproject.util.SignatureUser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;

@MultipartConfig(maxFileSize = 1024 * 10)
@WebServlet(name = "private-key", value = "/changePrivateKey")
public class ChangePrivateKey extends HttpServlet {

    private AccountService accountService = new AccountServiceImpl();

    private SignatureUser signatureUser = new SignatureUser();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String fileName = request.getParameter("fileName");

        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\"");

        if (account == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (fileName != null) {
                // find index account and change status = false
                Account oldAccount = accountService.findById(account.getId());
                oldAccount.setStatus(false);
                accountService.update(oldAccount);

                account.setPublicKey(signatureUser.convertPublicKey(signatureUser.getPublicKey().getEncoded()));
                accountService.save(account);
                out.write(signatureUser.convertPublicKey(signatureUser.getPrivateKey().getEncoded()));
                out.close();

                session.removeAttribute("account");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        String uploadFolder = request.getServletContext().getRealPath("/uploads");
        Path pathUpload = Paths.get(uploadFolder);
        Part partUpload = request.getPart("fileKey");

        if (account == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (signatureUser.checkPrivateKey(partUpload, pathUpload, account.getPublicKey())) {
                response.sendRedirect("/changePrivateKey?fileName=privateKey.txt");
            } else {
                session.setAttribute("key_err", "Please check your private key");
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            }
        }

    }
}
