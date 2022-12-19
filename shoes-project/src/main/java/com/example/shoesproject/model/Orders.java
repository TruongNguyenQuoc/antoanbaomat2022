package com.example.shoesproject.model;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class Orders {

    private long id;
    private long accountId;
    private String phone;
    private String address;
    private String progress;
    private String shipping;
    private Timestamp createAt;
    private double totalCost;
    private boolean status;

    public Orders() {
    }

    public Orders(long id, long accountId, String phone, String address, String progress, String shipping, Timestamp createAt, double totalCost, boolean status) {
        this.id = id;
        this.accountId = accountId;
        this.phone = phone;
        this.address = address;
        this.progress = progress;
        this.shipping = shipping;
        this.createAt = createAt;
        this.totalCost = totalCost;
        this.status = status;
    }
}
