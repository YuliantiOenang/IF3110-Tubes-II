<%@ page import = "java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
// Query from database
final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
final String DB_URL="jdbc:mysql://localhost/ruserba";
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager.getConnection(DB_URL, "root", "");
Statement statement = connection.createStatement();
String sql = "SELECT * FROM user WHERE username='" + request.getParameter("username") + "'";
ResultSet categories = statement.executeQuery("sql");
if (categories.next()) {
	if (categories.getString("password") == request.getParameter("password")) {
		out.println("true");
	}
	else {
		out.println("false");
	}
}
else {
	out.println("false");
}
%>

</body>
</html>