package com.example.shoesproject.service.impl;

import com.example.shoesproject.dao.OrdersDAO;
import com.example.shoesproject.dao.impl.OrdersDAOImpl;
import com.example.shoesproject.model.Orders;
import com.example.shoesproject.service.OrderService;

import java.util.List;

public class OrderServiceImpl implements OrderService {

    private OrdersDAO ordersDAO = new OrdersDAOImpl();

    @Override
    public List<Orders> findAll() {
        return ordersDAO.findAll();
    }

    @Override
    public Orders findById(long id) {
        return ordersDAO.findById(id);
    }

    @Override
    public List<Orders> findByAccountId(long accountId) {
        return ordersDAO.findByAccountId(accountId);
    }

    @Override
    public long save(Orders orders) {
        return ordersDAO.save(orders);
    }

    @Override
    public Orders findNewOrderByAccountId(long accountId) {
        return ordersDAO.findNewOrderByAccountId(accountId);
    }
}
