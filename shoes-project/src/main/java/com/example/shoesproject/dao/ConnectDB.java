package com.example.shoesproject.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class ConnectDB {

    private static Connection connection;
    private static ConnectDB instance;

    ResourceBundle resourceBundle = ResourceBundle.getBundle("application");

    private ConnectDB(){
        try{

            String driverName = resourceBundle.getString("driverName");
            String url = resourceBundle.getString("url");
            String username = resourceBundle.getString("username");
            String password = resourceBundle.getString("password");

            Class.forName(driverName);
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static ConnectDB getInstance() {
        if (instance == null) {
            instance = new ConnectDB();
        }
        return instance;
    }

    public Connection getConnection(){
        return connection;
    }
}
