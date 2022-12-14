package com.example.shoesproject.service;

import com.example.shoesproject.model.Product;

import java.util.List;

public interface ProductService {

    List<Product> findAll();

    Product findById(long id);

}
