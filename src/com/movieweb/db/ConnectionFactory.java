package com.movieweb.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.cj.jdbc.Driver;

public class ConnectionFactory {

    public static final String URL = "jdbc:mysql://localhost:3306/movieweb?useSSL=false";
    public static final String USER = "root";
    public static final String PASSWORD = "root";

	public static Connection getConnection()
    {
      try {
          DriverManager.registerDriver(new Driver());
          return DriverManager.getConnection(URL, USER, PASSWORD);
      } catch (SQLException ex) {
          throw new RuntimeException("Error connecting to the database", ex);
      }
    }


}
