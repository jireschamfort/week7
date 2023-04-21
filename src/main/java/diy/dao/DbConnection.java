package diy.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import diy.exception.Dbexception;

public class DbConnection {
	private static final String SCHEMA = "db-diy";
	private static final String USER = "dbdiy";
	private static final String PASSWORD = "dbdiy";
	private static final String HOST = "localhost";
	private static final int PORT = 3306;

	public static Connection getConnection() {
		String url = String.format("jdbc:mysql://%s:%d/%s?user=%s&password=%s&useSSL=false", HOST, PORT, SCHEMA, USER,
				PASSWORD);
		System.out.println("Connecting with url= "+url);
		try {
			Connection conn = DriverManager.getConnection(url);
			System.out.println("Succefully connected");
			return conn;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Connection failled ");
			e.printStackTrace();
			throw new Dbexception(e);
		}
		
		
	}

}
