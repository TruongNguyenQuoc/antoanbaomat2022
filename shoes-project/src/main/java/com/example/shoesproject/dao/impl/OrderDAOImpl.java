package com.example.shoesproject.dao.impl;

import com.example.shoesproject.dao.ConnectDB;
<<<<<<< Updated upstream:shoes-project/src/main/java/com/example/shoesproject/dao/impl/OrderDAOImpl.java
import com.example.shoesproject.dao.OrderDAO;
import com.example.shoesproject.model.Order;
=======
import com.example.shoesproject.dao.OrdersDAO;
import com.example.shoesproject.model.Orders;
>>>>>>> Stashed changes:shoes-project/src/main/java/com/example/shoesproject/dao/impl/OrdersDAOImpl.java

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrdersDAOImpl implements OrdersDAO {

    PreparedStatement statement;
    ResultSet resultSet;

    @Override
<<<<<<< Updated upstream:shoes-project/src/main/java/com/example/shoesproject/dao/impl/OrderDAOImpl.java
    public Order save(Order order) {
=======
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
>>>>>>> Stashed changes:shoes-project/src/main/java/com/example/shoesproject/dao/impl/OrdersDAOImpl.java
        try {
            String query = "INSERT INTO orders (account_id, address, progress, shipping, create_at, total_cost, status) " +
                    " values(?, ?, ?, ?, ?, ?, ?)";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            statement.setLong(1, orders.getAccountId());
            statement.setString(2, orders.getAddress());
            statement.setString(3, orders.getProgress());
            statement.setString(4, orders.getShipping());
            statement.setTimestamp(5, orders.getCreateAt());
            statement.setDouble(6, orders.getTotalCost());
            statement.setBoolean(7, orders.isStatus());
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
}
