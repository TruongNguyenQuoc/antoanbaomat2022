package com.example.shoesproject.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Account {

    private long id;
    private String fullName;
    private String username;
    private String password;
    private String email;
    private String phone;
    private String address;
    private boolean status;
    private long roleId;

    public Account() {
    }

    public Account(long id, String fullName, String username, String password, String email, String phone, String address, boolean status, long roleId) {
        this.id = id;
        this.fullName = fullName;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.status = status;
        this.roleId = roleId;
    }
}
