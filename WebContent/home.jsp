<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

	<%
		if (request.getSession(true).getAttribute("user_id") == null) {
	%>
	<form name="login_form" action="login" method="post">
		Username: <input type="text" name="username" id="username" />
		Password: <input type="password" name="password" id="password" /> <input
			type="submit" value="login" />
	</form>
	<a href="register.jsp">Register</a>
	<%
		} else {
	%>
	Halo
	<a href="user?id=<%=request.getSession(true).getAttribute("user_id")%>"><%=request.getSession(true).getAttribute("username")%></a>!
	<a href="logout">Logout</a>
	<%
		}
	%>
</body>
</html>