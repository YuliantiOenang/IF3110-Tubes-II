<%@ page import="java.sql.*" %>
<%
	String db_url = "jdbc:mysql://localhost/ruserba";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection = DriverManager.getConnection(db_url, "root", "");
	Statement statement = connection.createStatement();
	ResultSet user = statement.executeQuery(
			"SELECT DISTINCT tipe "
			+ "FROM anggota "
			+ "WHERE username='" + request.getParameter("usr")
			+ "' AND password='" + request.getParameter("pass")
			+ "'"
		);
	
	if (user == null) {
		out.print("0");
	} else {
		out.print("1");
	}
	
	connection.close();
%>