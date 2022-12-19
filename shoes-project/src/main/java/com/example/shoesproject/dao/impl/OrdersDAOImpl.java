package com.example.shoesproject.dao.impl;

import com.example.shoesproject.dao.ConnectDB;
import com.example.shoesproject.dao.OrderDAO;
import com.example.shoesproject.model.Account;
import com.example.shoesproject.model.Order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAOImpl implements OrderDAO {

    PreparedStatement statement;
    ResultSet resultSet;

    @Override
    public List<Order> findByAccountId(long accountId) {
        List<Order> result = new ArrayList<>();
        try {
            String query = "SELECT * FROM orders WHERE account_id = ?";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query);
            statement.setLong(1, accountId);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Order order = new Order(resultSet.getLong("id"),
                                    resultSet.getLong("account_id"),
                                    resultSet.getString("address"),
                                    resultSet.getString("progress"),
                                    resultSet.getString("shipping"),
                                    resultSet.getTimestamp("createAt"),
                                    resultSet.getInt("totalCost"),
                                    resultSet.getBoolean("status"));

                result.add(order);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public Order save(Order order) {
        try {
            String query = "INSERT INTO orders (account_id, address, progress, shipping, create_at, total_cost, status) " +
                    " values(?, ?, ?, ?, ?, ?, ?)";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query);
            statement.setLong(1, order.getAccountId());
            statement.setString(2, order.getAddress());
            statement.setString(3, order.getProgress());
            statement.setString(4, order.getShipping());
            statement.setTimestamp(5, order.getCreateAt());
            statement.setDouble(6, order.getTotalCost());
            statement.setBoolean(7, order.isStatus());

            statement.executeUpdate();

            return order;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
