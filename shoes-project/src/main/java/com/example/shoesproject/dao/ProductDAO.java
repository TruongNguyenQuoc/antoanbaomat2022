package com.example.shoesproject.dao;

import com.example.shoesproject.model.Product;

import java.util.List;

public interface ProductDAO {

    List<Product> findAll();

    Product findById(long id);
}
