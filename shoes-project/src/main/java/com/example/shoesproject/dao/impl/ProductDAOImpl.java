package com.example.shoesproject.dao.impl;

import com.example.shoesproject.dao.ConnectDB;
import com.example.shoesproject.dao.ProductDAO;
import com.example.shoesproject.model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements ProductDAO {

    PreparedStatement statement;
    ResultSet resultSet;

    @Override
    public List<Product> findAll() {
        List<Product> result = new ArrayList<>();
        try {
            String query = "SELECT * FROM product";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Product product = new Product(
                                    resultSet.getLong("id"),
                                    resultSet.getString("name"),
                                    resultSet.getString("description"),
                                    resultSet.getString("detail"),
                                    resultSet.getString("avatar"),
                                    resultSet.getDouble("price"),
                                    resultSet.getInt("discount"),
                                    resultSet.getBoolean("status"),
                                    resultSet.getLong("categoryId"));

                result.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public Product findById(long id) {
        try {
            String query = "SELECT * FROM product WHERE id = ?";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query);
            statement.setLong(1, id);
            resultSet = statement.executeQuery();
            Product product = null ;

            while (resultSet.next()) {
                product = new Product(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getString("detail"),
                        resultSet.getString("avatar"),
                        resultSet.getDouble("price"),
                        resultSet.getInt("discount"),
                        resultSet.getBoolean("status"),
                        resultSet.getLong("categoryId"));
            }
            return product;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
