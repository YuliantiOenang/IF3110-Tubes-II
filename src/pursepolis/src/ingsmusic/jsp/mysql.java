package ingsmusic.jsp;

import java.sql.*;

public class mysql {
	
	public static Connection connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			return DriverManager.getConnection("jdbc:mysql://localhost/ingsdb", "root", "root");
		}
		catch (Exception e) {
			System.out.println("test4");
			return null;
		}
	}
	
	public static boolean close(Connection c) {
		try {
			c.close();
			return true;
		}
		catch (Exception e) {
			return false;
		}
	}
	
	public static ResultSet send(String query) {
		Connection c = connect();
		try {
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			System.out.println("test1");
			return rs;
		}
		catch (Exception e) {
			System.out.println("test2");
			//error message
		}
		finally {
			close(c);
		}
		System.out.println("test3");
		return null;
	}
	
}
