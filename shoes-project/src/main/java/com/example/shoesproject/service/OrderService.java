package com.example.shoesproject.service;

import com.example.shoesproject.model.Orders;

import java.util.List;

public interface OrderService {

    Orders findById(long id);

    List<Orders> findByAccountId(long accountId);

    long save(Orders orders);

    Orders findNewOrderByAccountId(long accountId);
}
