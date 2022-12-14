package com.example.shoesproject.dao.impl;

import com.example.shoesproject.dao.ConnectDB;
import com.example.shoesproject.dao.OrderDetailDAO;
import com.example.shoesproject.model.OrderDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderDetailDAOImpl implements OrderDetailDAO {

    PreparedStatement statement;
    ResultSet resultSet;

    @Override
    public OrderDetail save(OrderDetail orderDetail) {
        try {
            String query = "INSERT INTO order_detail (order_id, product_id, amount, price, discount)" +
                    " values(?, ?, ?, ?, ?)";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query);
            statement.setLong(1, orderDetail.getOrderId());
            statement.setLong(2, orderDetail.getProductId());
            statement.setInt(3, orderDetail.getAmount());
            statement.setDouble(4, orderDetail.getPrice());
            statement.setLong(5, orderDetail.getDiscount());

            statement.executeUpdate();

            return orderDetail;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
