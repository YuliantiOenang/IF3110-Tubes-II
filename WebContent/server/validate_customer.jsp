<%@ page import="java.sql.*" %>
<%
	String db_url = "jdbc:mysql://localhost/ruserba";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection = DriverManager.getConnection(db_url, "root", "");
	Statement statement = connection.createStatement();
	
	String username = request.getParameter("usr");
	String password = request.getParameter("pass");
	
	ResultSet user = statement.executeQuery(
			"SELECT DISTINCT tipe "
			+ "FROM anggota "
			+ "WHERE username='" + username
			+ "' AND password='" + password
			+ "'"
		);
	
	if (user == null) {
		out.print("0"); // user not found
	} else {
		user.next();
		session.setAttribute("USR", username);
		if (user.getObject("tipe") == "User") {
			out.print("1"); // normal user
			session.setAttribute("PRI", "User");
		} else {
			out.print("2"); // admin euy
			session.setAttribute("PRI", "Admin");
		}
	}
	
	connection.close();
%>