package com.example.shoesproject.service.impl;

import com.example.shoesproject.dao.OrderDAO;
import com.example.shoesproject.dao.impl.OrderDAOImpl;
import com.example.shoesproject.model.Order;
import com.example.shoesproject.service.OrderService;

public class OrderServiceImpl implements OrderService {

    private OrderDAO orderDAO = new OrderDAOImpl();

    @Override
    public Order save(Order order) {
        return orderDAO.save(order);
    }
}
