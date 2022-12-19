package com.example.shoesproject.controller;

import com.example.shoesproject.model.Cart;
import com.example.shoesproject.model.Product;
import com.example.shoesproject.service.ProductService;
import com.example.shoesproject.service.impl.ProductServiceImpl;
import com.example.shoesproject.util.NumberUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {

    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        String productId = request.getParameter("productId");
        String command = request.getParameter("command");

        ArrayList<Long> listBuy = null;
        String url = "/order.jsp";
        try {
            listBuy = (ArrayList<Long>) session.getAttribute("cartId");
            long idBuy = 0;
            if (request.getParameter("cartId") != null) {
                idBuy = Long.parseLong(request.getParameter("cartId"));
                Product product = productService.findById(Long.parseLong(productId));

                switch (command) {
                    case "insert":
                        if (listBuy == null) {
                            listBuy = new ArrayList<>();
                            session.setAttribute("cartId", listBuy);
                        }
                        if (!listBuy.contains(idBuy)) {
                            cart.insertCart(product, 1);
                            listBuy.add(idBuy);
                        }
                        url = "/order.jsp";
                        break;
                    case "plus":
                        if (listBuy == null) {
                            listBuy = new ArrayList<>();
                            session.setAttribute("cart", listBuy);
                        }
                        if (!listBuy.contains(idBuy)) {
                            cart.insertCart(product, 1);
                            listBuy.add(idBuy);
                        }
                        url = "/order.jsp";
                        break;
                    case "sub":
                        if (listBuy == null) {
                            listBuy = new ArrayList<>();
                            session.setAttribute("cart", listBuy);
                        }
                        if (!listBuy.contains(idBuy)) {
                            cart.subCart(product, 1);
                            listBuy.add(idBuy);
                        }
                        url = "/order.jsp";
                        break;
                    case "remove":
                        if (listBuy == null) {
                            listBuy = new ArrayList<>();
                            session.setAttribute("cart", listBuy);
                        }
                        if (!listBuy.contains(idBuy)) {
                            cart.removeCart(product);
                        }
                        url = "/order.jsp";
                        break;
                    default:
                        break;
                }
                session.setAttribute("totalCost", NumberUtil.formatNumber(cart.totalCost()));
                session.setAttribute("totalProduct", cart.totalProduct());
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
                requestDispatcher.forward(request, response);
            }
        } catch (Exception e) {
            request.getRequestDispatcher("order.jsp").forward(request, response);
        }
    }
}
