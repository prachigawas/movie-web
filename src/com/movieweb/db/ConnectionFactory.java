package com.movieweb.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectionFactory {

    private static final Logger LOGGER = Logger.getLogger(ConnectionFactory.class.getName());
	private static ConnectionFactory instance = new ConnectionFactory();
	String url = "jdbc:mysql://10.95.147.130:3306/test-movies";
	String user = "root";
	String password = "root";
	String driverClass = "com.mysql.jdbc.Driver";

	private ConnectionFactory() {
		try {
			Class.forName(driverClass);
		} catch (ClassNotFoundException e) {
			LOGGER.log(Level.SEVERE,"Exception occurred establishing database connection",e);
		}
	}

	public static ConnectionFactory getInstance() {
		return instance;
	}

	public Connection getConnection() throws SQLException, ClassNotFoundException {
		Connection connection = DriverManager.getConnection(url, user, password);
		return connection;
	}
}
