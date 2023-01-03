package com.example.shoesproject.model;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
@Getter
@Setter
public class OrderDTO {

    private long id;
    private long accountId;
    private String phone;
    private String address;
    private String progress;
    private String shipping;
    private Timestamp createAt;
    private double totalCost;
    private boolean status;
    private String accountName;

    public OrderDTO() {
    }

    public OrderDTO(long id, long accountId, String phone, String address, String progress, String shipping, Timestamp createAt, double totalCost, boolean status, String accountName) {
        this.id = id;
        this.accountId = accountId;
        this.phone = phone;
        this.address = address;
        this.progress = progress;
        this.shipping = shipping;
        this.createAt = createAt;
        this.totalCost = totalCost;
        this.status = status;
        this.accountName = accountName;
    }
}
