package com.example.shoesproject.service.impl;

import com.example.shoesproject.dao.OrderDetailDAO;
import com.example.shoesproject.dao.impl.OrderDetailDAOImpl;
import com.example.shoesproject.model.OrderDetail;
import com.example.shoesproject.service.OrderDetailService;

public class OrderDetailServiceImpl implements OrderDetailService {

    private OrderDetailDAO orderDetailDAO = new OrderDetailDAOImpl();

    @Override
    public OrderDetail save(OrderDetail orderDetail) {
        return orderDetailDAO.save(orderDetail);
    }
}
