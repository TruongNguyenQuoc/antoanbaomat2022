package com.example.shoesproject.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Product implements Comparable<Product>{

    private long id;
    private String name;
    private String description;
    private String detail;
    private String avatar;
    private double price;
    private int discount;
    private boolean status;
    private long categoryId;

    public Product() {
    }

    public Product(long id, String name, String description, String detail, String avatar, double price, int discount, boolean status, long categoryId) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.detail = detail;
        this.avatar = avatar;
        this.price = price;
        this.discount = discount;
        this.status = status;
        this.categoryId = categoryId;
    }

    @Override
    public int compareTo(Product p) {
        return (int) (this.id - p.id);
    }
}
