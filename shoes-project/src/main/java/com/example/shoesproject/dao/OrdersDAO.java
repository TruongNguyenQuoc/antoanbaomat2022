package com.example.shoesproject.dao;

import com.example.shoesproject.model.Order;

import java.util.List;

public interface OrderDAO {

    List<Order> findByAccountId(long accountId);

    Order save(Order order);

}
