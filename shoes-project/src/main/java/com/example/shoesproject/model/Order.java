package com.example.shoesproject.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Order {

    private long id;
    private long accountId;
    private String address;
    private String progress;
    private double totalCost;
    private boolean status;

    public Order() {
    }

    public Order(long id, long accountId, String address, String progress, double totalCost, boolean status) {
        this.id = id;
        this.accountId = accountId;
        this.address = address;
        this.progress = progress;
        this.totalCost = totalCost;
        this.status = status;
    }
}
