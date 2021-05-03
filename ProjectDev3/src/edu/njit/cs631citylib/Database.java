package edu.njit.cs631citylib;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Database {
	private static Database dbManager = null;
	private static Connection dbConnection = null;

	public static Database getInstance() {
		if (dbManager == null) dbManager = new Database();
		return dbManager;
	}

	public boolean connect() {
	
		if (dbConnection != null) return true;

		
		String jdbc_url = "jdbc:mysql://localhost:3306/CITYLIBRARY?";
		String username = "root";
		String password = "Abhilash@602sql";

		try {
			
			Connection connection = DriverManager.getConnection(jdbc_url, username, password);

			
		    dbConnection = connection;
		} catch (SQLException e) {
		
			e.printStackTrace();
			return false;
		}
	
		return true;
	}

	public boolean disConnect() {
		if (dbConnection == null) return true;
		try {
			dbConnection.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public ArrayList<ArrayList<Object>> execQuery(String sql) {
	
		if (dbConnection == null) return null;

	
		ArrayList<ArrayList<Object>> arr = new ArrayList<ArrayList<Object>>();
		try {
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			int columnCount = rs.getMetaData().getColumnCount();

			// Iterate through all rows
			while (rs.next()) {
				ArrayList<Object> row = new ArrayList<Object>();
				for (int c = 1; c <= columnCount; c++) {
					row.add(rs.getObject(c));
				}
				arr.add(row);
			}

		
			rs.close();
			stmt.close();
			
			return arr;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public int execUpdate(String sql) {
		if (dbConnection == null) return -1;
		try {
			Statement stmt = dbConnection.createStatement();
			return stmt.executeUpdate(sql);			
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}
}
