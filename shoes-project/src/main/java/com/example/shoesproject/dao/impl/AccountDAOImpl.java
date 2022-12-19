package com.example.shoesproject.dao.impl;

import com.example.shoesproject.dao.AccountDAO;
import com.example.shoesproject.dao.ConnectDB;
import com.example.shoesproject.model.Account;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountDAOImpl implements AccountDAO {

    PreparedStatement statement;
    ResultSet resultSet;

    @Override
    public List<Account> findAll() {
        List<Account> result = new ArrayList<>();
        try {
            String query = "SELECT * FROM account WHERE status = 1";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Account Account = new Account(
                        resultSet.getLong("id"),
                        resultSet.getString("fullName"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("public_key"),
                        resultSet.getBoolean("status"),
                        resultSet.getLong("role_id"));

                result.add(Account);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public Account findById(long id) {
        try {
            String query = "SELECT * FROM account WHERE id = ? AND status = 1";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query);
            statement.setLong(1, id);
            resultSet = statement.executeQuery();

            Account account = null;

            while (resultSet.next()) {
                account = new Account(
                        resultSet.getLong("id"),
                        resultSet.getString("fullName"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("public_key"),
                        resultSet.getBoolean("status"),
                        resultSet.getLong("role_id"));
            }

            return account;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Account findByUserName(String userName) {
        try {
            String query = "SELECT * FROM account WHERE username = ? AND status = 1";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query);
            statement.setString(1, userName);
            resultSet = statement.executeQuery();

            Account account = null;

            while (resultSet.next()) {
                account = new Account(
                        resultSet.getLong("id"),
                        resultSet.getString("fullName"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("public_key"),
                        resultSet.getBoolean("status"),
                        resultSet.getLong("role_id"));
            }

            return account;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Account findByUserName(String userName, String password) {
        try {
            String query = "SELECT * FROM account WHERE username = ? AND password = ? AND status = 1";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query);
            statement.setString(1, userName);
            statement.setString(2, password);
            resultSet = statement.executeQuery();

            Account account = null;

            while (resultSet.next()) {
                account = new Account(
                        resultSet.getLong("id"),
                        resultSet.getString("fullName"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("public_key"),
                        resultSet.getBoolean("status"),
                        resultSet.getLong("role_id"));
            }

            return account;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Account update(Account account) {
        try {
            String query = "UPDATE account " +
                    "SET fullname = ?, username = ?, password = ?, email = ?, " +
                    "" +
                    "address = ?, phone = ?, public_key = ?, status = ?, role_id = ? " +
                    "WHERE id = ?";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query);
            statement.setString(1, account.getFullName());
            statement.setString(2, account.getUsername());
            statement.setString(3, account.getPassword());
            statement.setString(4, account.getEmail());
            statement.setString(5, account.getAddress());
            statement.setString(6, account.getPhone());
            statement.setString(7, account.getPublicKey());
            statement.setBoolean(8, account.isStatus());
            statement.setLong(9, account.getRoleId());
            statement.setLong(10, account.getId());
            statement.executeUpdate();

            return account;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Account save(Account account) {
        try {
            String query = "INSERT INTO account (fullname, username, password, email, address, phone, public_key, status, role_id)" +
                    " values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            statement = ConnectDB.getInstance().getConnection().prepareStatement(query);
            statement.setString(1, account.getFullName());
            statement.setString(2, account.getUsername());
            statement.setString(3, account.getPassword());
            statement.setString(4, account.getEmail());
            statement.setString(5, account.getAddress());
            statement.setString(6, account.getPhone());
            statement.setString(7, account.getPublicKey());
            statement.setBoolean(8, account.isStatus());
            statement.setLong(9, account.getRoleId());

            statement.executeUpdate();

            return account;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
