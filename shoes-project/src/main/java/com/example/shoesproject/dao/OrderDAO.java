package com.example.shoesproject.dao;

import com.example.shoesproject.model.Orders;

import java.util.List;

public interface OrdersDAO {

    Orders findById(long id);

    List<Orders> findByAccountId(long accountId);

    long save(Orders orders);

}
