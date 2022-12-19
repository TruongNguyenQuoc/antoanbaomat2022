package com.example.shoesproject.dao;

import com.example.shoesproject.model.OrderDetail;

import java.util.List;

public interface OrderDetailDAO {

    List<OrderDetail> findByOrderId(long orderId);

    OrderDetail save(OrderDetail orderDetail);
}
