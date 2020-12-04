package com.cdvtc.guashen.db;

import java.sql.*;

public class DBConnection {
    public Connection getConnection() throws SQLException {
        //注册驱动类
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //获取连接
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/guashen?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=Asia/Shanghai&&"
                + "user=root&password=123456");

        return con;
    }
}
