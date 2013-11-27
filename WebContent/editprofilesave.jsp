<%@ page import="java.sql.*" %>
<%
	String nama = request.getParameter("nama");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String nohp = request.getParameter("hp");
	String alamat = request.getParameter("alamat");
	String provinsi = request.getParameter("provinsi");
	String kota = request.getParameter("kota");
	String kodepos = request.getParameter("kodepos");
	String email = request.getParameter("email");
	
	String dburl = "jdbc:mysql://localhost/ruserba";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connect = DriverManager.getConnection(dburl, "root", "");
	Statement stmt = connect.createStatement();
	
	String query = "UPDATE anggota SET password='" + password + "', nama = '" + nama + 
			"', nomorhp = '" + nohp + "', alamat= '" + alamat +
			"', provinsi = '" + provinsi + "', kota = '" + kota + "', kodepos = '" + kodepos +
			"', email ='" + email + "' WHERE username = '" + username + "'";
	int updateCount = stmt.executeUpdate(query);
	
	if (updateCount == 0) {
		out.print("0");
	} else {
		out.print("1");
	}
	
	connect.close();
%>