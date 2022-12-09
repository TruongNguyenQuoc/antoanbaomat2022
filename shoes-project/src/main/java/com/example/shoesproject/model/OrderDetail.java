package com.example.shoesproject.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderDetail {

    private long id;
    private long orderId;
    private long productId;
    private int amount;
    private double price;

    public OrderDetail() {
    }

    public OrderDetail(long id, long orderId, long productId, int amount, double price) {
        this.id = id;
        this.orderId = orderId;
        this.productId = productId;
        this.amount = amount;
        this.price = price;
    }
}
