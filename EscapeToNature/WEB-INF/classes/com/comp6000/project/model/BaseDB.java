package com.comp6000.project.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BaseDB {
	public final static String connectionString = "jdbc:mysql://localhost:3306/EscapeToNature";
	
	
	protected static  Connection getConnection() {
		Connection connection=null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(connectionString, "root", "12345");
			if(!connection.isClosed())
			     System.out.println("Successfully connected to " + "MySQL server using TCP/IP...");
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return connection;
	}
	public static ResultSet makeQuery(String query) {
		//String connectionURL = "jdbc:mysql://localhost:3306/assignment2";
		ResultSet resultSet = null;
		try {
		     
		    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		    Connection connection = DriverManager.getConnection(connectionString, "root", "12345");
		    if(!connection.isClosed())
		         System.out.println("Successfully connected to " + "MySQL server using TCP/IP...");
		    
		    Statement st = connection.createStatement();
		    resultSet = st.executeQuery(query);
		    
		    System.out.println("QUERY: " + query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	    return resultSet;	    
	}
	public static void updateQuery(String query) {
		try {
		    Connection connection = null; 
		    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		    connection = DriverManager.getConnection(connectionString, "root", "12345");
		    if(!connection.isClosed())
		         System.out.println("Successfully connected to " + "MySQL server using TCP/IP...");
		    
		    Statement st = connection.createStatement();
		    st.executeUpdate(query);
		    
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	public static int insertQuery(String query) {
		ResultSet resultSet = null;
		try {
		    Connection connection = null; 
		    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		    connection = DriverManager.getConnection(connectionString, "root", "12345");
		    if(!connection.isClosed())
		         System.out.println("Successfully connected to " + "MySQL server using TCP/IP...");
		    
		    Statement st = connection.createStatement();
		    st.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
		    resultSet = st.getGeneratedKeys();
		    
		    System.out.println("QUERY: " + query);
		    
		    if(resultSet.next()) {
		    	return resultSet.getInt(1);
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	    return -1;
	}
}
