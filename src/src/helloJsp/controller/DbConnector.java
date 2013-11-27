package helloJsp.controller;
import java.sql.Connection;
import java.sql.DriverManager;

	public class DbConnector {
		Connection connection = null;

		public Connection mySqlConnection() {
			String url = "jdbc:mysql://localhost:3306/chintalian";
			String driver = "com.mysql.jdbc.Driver";
			String username = "root";
			String password = "";

			try {
				Class.forName(driver).newInstance();
				connection = DriverManager.getConnection(url, username, password);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return connection;
		}
	}
