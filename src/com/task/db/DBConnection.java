package com.task.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static final String NAME = "root";
    public static final String PASSWORD ="root";
    public static final String URL = "jdbc:mysql://localhost:3306/trainingdb?useUnicode=true&characterEncoding=gb2312";
    public static final String DRIVER = "com.mysql.jdbc.Driver";
    public Connection conn = null;
    public Connection getConn(){
        return conn;
    }
    public DBConnection() {
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, NAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }

    }
}