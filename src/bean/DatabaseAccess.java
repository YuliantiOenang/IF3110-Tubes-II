package bean;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class DatabaseAccess {
	private static final long serialVersionUID = 1L;

	public DatabaseAccess() {
	}

	public Connection getConnection() {
		Connection conn = null;
		try {
			String userName = "root";
			String password = "";
			String url = "jdbc:mysql://localhost/progin_13511021";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = (Connection) DriverManager.getConnection(url, userName,
					password);
		} catch (Exception e) {
			System.out.println("Cannot connect to database server");
		}
		return conn;
	}

	public ResultSet doQuery(String SQL) {

		Statement stmt;
		ResultSet rs = null;
		try {
			stmt = (Statement) getConnection().createStatement();
			// rs =
			// stmt.executeQuery("SELECT * FROM barang WHERE kategori_barang = 1 ORDER BY n_beli DESC LIMIT 0,3");
			rs = stmt.executeQuery(SQL);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public int doQueryUpdate(String SQL) {

		Statement stmt;
		int rs=-1; // -1 ketika terjadi SQLException
		try {
			stmt=(Statement)getConnection().createStatement();
			rs = stmt.executeUpdate(SQL);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

}
