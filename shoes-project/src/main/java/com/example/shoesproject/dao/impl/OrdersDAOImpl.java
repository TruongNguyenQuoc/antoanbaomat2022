package com.example.shoesproject.dao.impl;

import com.example.shoesproject.dao.ConnectDB;
import com.example.shoesproject.dao.OrdersDAO;
import com.example.shoesproject.model.Orders;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrdersDAOImpl implements OrdersDAO {

    PreparedStatement statement;
    ResultSet resultSet;

    @Override
    public List<Orders> findAll() {
        List<Orders> result = new ArrayList<>();
        try {
            String query = "SELECT * FROM orders";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Orders orders = new Orders(resultSet.getLong("id"),
                        resultSet.getLong("account_id"),
                        resultSet.getString("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("progress"),
                        resultSet.getString("shipping"),
                        resultSet.getTimestamp("create_at"),
                        resultSet.getInt("total_cost"),
                        resultSet.getBoolean("status"));

                result.add(orders);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public Orders findById(long id) {
        try {
            String query = "SELECT * FROM orders WHERE id = ?";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query);
            statement.setLong(1, id);
            resultSet = statement.executeQuery();

            Orders orders = null;

            while (resultSet.next()) {
                orders = new Orders(resultSet.getLong("id"),
                        resultSet.getLong("account_id"),
                        resultSet.getString("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("progress"),
                        resultSet.getString("shipping"),
                        resultSet.getTimestamp("create_at"),
                        resultSet.getInt("total_cost"),
                        resultSet.getBoolean("status"));
            }

            return orders;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Orders> findByAccountId(long accountId) {
        List<Orders> result = new ArrayList<>();
        try {
            String query = "SELECT * FROM orders WHERE account_id = ?";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query);
            statement.setLong(1, accountId);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Orders orders = new Orders(resultSet.getLong("id"),
                                    resultSet.getLong("account_id"),
                                    resultSet.getString("phone"),
                                    resultSet.getString("address"),
                                    resultSet.getString("progress"),
                                    resultSet.getString("shipping"),
                                    resultSet.getTimestamp("create_at"),
                                    resultSet.getInt("total_cost"),
                                    resultSet.getBoolean("status"));

                result.add(orders);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public long save(Orders orders) {
        try {
            String query = "INSERT INTO orders (account_id, phone, address, progress, shipping, create_at, total_cost, status) " +
                    " values(?, ?, ?, ?, ?, ?, ?, ?)";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            statement.setLong(1, orders.getAccountId());
            statement.setString(2, orders.getPhone());
            statement.setString(3, orders.getAddress());
            statement.setString(4, orders.getProgress());
            statement.setString(5, orders.getShipping());
            statement.setTimestamp(6, orders.getCreateAt());
            statement.setDouble(7, orders.getTotalCost());
            statement.setBoolean(8, orders.isStatus());
            statement.executeUpdate();

            ResultSet rs = statement.getGeneratedKeys();
            try {
                if (rs.next()) {
                    return rs.getInt(1);
                }
                rs.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
         return 0;
    }

    @Override
    public Orders findNewOrderByAccountId(long accountId) {
        try {
            String query = "SELECT * FROM orders WHERE account_id = ? ORDER BY id DESC LIMIT 1";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query);
            statement.setLong(1, accountId);
            resultSet = statement.executeQuery();
            Orders orders = null;

            while (resultSet.next()) {
                orders = new Orders(resultSet.getLong("id"),
                        resultSet.getLong("account_id"),
                        resultSet.getString("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("progress"),
                        resultSet.getString("shipping"),
                        resultSet.getTimestamp("create_at"),
                        resultSet.getInt("total_cost"),
                        resultSet.getBoolean("status"));
            }

            return orders;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
