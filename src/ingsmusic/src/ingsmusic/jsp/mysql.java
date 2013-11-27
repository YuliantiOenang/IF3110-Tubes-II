package ingsmusic.jsp;

import java.sql.*;

public class mysql {
	
	private static Connection connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			return DriverManager.getConnection("jdbc:mysql://localhost/ingsdb", "root", "root");
		}
		catch (Exception e) {
			System.out.println("test4");
			return null;
		}
	}
	
	public static void close(Connection c) {
		try {
			c.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void close(Statement s) {
		try {
			Connection c = s.getConnection();
			close(c);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				s.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void close(ResultSet rs) {
		try {
			Statement s = rs.getStatement();
			close(s);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static ResultSet send(String query) {
		ResultSet rs = null;
		Statement stmt = null;
		Connection c = connect();

		try {
			stmt = c.createStatement();
			rs = stmt.executeQuery(query);

			System.out.println("test1");
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("test3");

		return rs;
	}
	
}
