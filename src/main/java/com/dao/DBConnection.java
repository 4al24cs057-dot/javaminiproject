package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null || con.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hospitaldb" +
                    "?useSSL=false" +
                    "&allowPublicKeyRetrieval=true" +
                    "&serverTimezone=UTC",
                    "root",
                    "pandu@142"   // ← your password
                );
                System.out.println("[DBConnection] ✅ Connected to hospitaldb!");
            }
        } catch (Exception e) {
            System.out.println("[DBConnection] ❌ FAILED: " + e.getMessage());
            e.printStackTrace();
            con = null;
        }
        return con;
    }
}