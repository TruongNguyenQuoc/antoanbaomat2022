package com.example.shoesproject.controller;

import com.example.shoesproject.model.Account;
import com.example.shoesproject.model.OrderDetail;
import com.example.shoesproject.model.Orders;
import com.example.shoesproject.service.OrderDetailService;
import com.example.shoesproject.service.OrderService;
import com.example.shoesproject.service.impl.OrderDetailServiceImpl;
import com.example.shoesproject.service.impl.OrderServiceImpl;
import com.example.shoesproject.util.PDFUtil;
import com.itextpdf.kernel.pdf.PdfWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@WebServlet(name = "validator-order", value = "/validator-order")
public class ValidatorOrderController extends HttpServlet {

    private OrderService orderService = new OrderServiceImpl();
    private OrderDetailService orderDetailService = new OrderDetailServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        OutputStream outputStream = response.getOutputStream();
        String orderId = request.getParameter("orderId");
        HttpSession session = request.getSession();

        if (orderId != null) {
            Account account = (Account) session.getAttribute("account");
            Orders orders = orderService.findById(Long.parseLong(orderId));
            List<OrderDetail> orderDetail = orderDetailService.findByOrderId(orders.getId());
            PdfWriter pdfWriter = new PdfWriter(outputStream);
            PDFUtil pdfUtil = new PDFUtil(orders, account, orderDetail, pdfWriter);
        }

        request.getRequestDispatcher("profile.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
