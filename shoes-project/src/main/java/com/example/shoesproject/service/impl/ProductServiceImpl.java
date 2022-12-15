package com.example.shoesproject.service.impl;

import com.example.shoesproject.dao.ProductDAO;
import com.example.shoesproject.dao.impl.ProductDAOImpl;
import com.example.shoesproject.model.Product;
import com.example.shoesproject.service.ProductService;

import java.util.List;

public class ProductServiceImpl implements ProductService {

    private ProductDAO productDAO = new ProductDAOImpl();

    @Override
    public List<Product> findAll() {
        return productDAO.findAll();
    }

    @Override
    public Product findById(long id) {
        return productDAO.findById(id);
    }
}
