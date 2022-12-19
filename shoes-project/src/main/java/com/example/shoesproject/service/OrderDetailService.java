package com.example.shoesproject.service;

import com.example.shoesproject.model.OrderDetail;

import java.util.List;

public interface OrderDetailService {

    List<OrderDetail> findByOrderId(long orderId);

    OrderDetail save(OrderDetail orderDetail);

}
