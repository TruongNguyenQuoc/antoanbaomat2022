package com.example.shoesproject.model;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class Order {

    private long id;
    private long accountId;
    private String address;
    private String progress;
    private String shipping;
    private Timestamp createAt;
    private double totalCost;
    private boolean status;

    public Order() {
    }

    public Order(long id, long accountId, String address, String progress, String  shipping, Timestamp createAt, double totalCost, boolean status) {
        this.id = id;
        this.accountId = accountId;
        this.address = address;
        this.progress = progress;
        this.shipping =  shipping;
        this.createAt = createAt;
        this.totalCost = totalCost;
        this.status = status;
    }
}
