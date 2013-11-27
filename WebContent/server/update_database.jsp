<%@ page import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	String gambar = request.getParameter("img");
	String nama = request.getParameter("name");
	String harga = request.getParameter("prc");
	
	String db_url = "jdbc:mysql://localhost/ruserba";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection = DriverManager.getConnection(db_url, "root", "");
	Statement statement = connection.createStatement();
	
	int updateCount = 0;
	updateCount = statement.executeUpdate(
			"UPDATE barang "
			+ "SET "
				+ "nama='" + nama + "', "
				+ "gambar='" + gambar + "', "
				+ "harga='" + harga + "' "
			+ "WHERE id='" + id + "'"
		);
	
	if (updateCount == 0) {
		out.print("0");
	} else {
		out.print("1");
	}
	
	connection.close();
%>