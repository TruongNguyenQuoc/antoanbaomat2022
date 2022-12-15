package com.example.shoesproject.controller;

import com.example.shoesproject.dao.AccountDAO;
import com.example.shoesproject.dao.ProductDAO;
import com.example.shoesproject.dao.impl.AccountDAOImpl;
import com.example.shoesproject.dao.impl.ProductDAOImpl;
import com.example.shoesproject.model.Product;
import com.example.shoesproject.service.ProductService;
import com.example.shoesproject.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {

    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> listProduct = productService.findAll();

        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
