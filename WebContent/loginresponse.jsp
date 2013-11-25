<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="3; url=home.jsp" />
<title>Insert title here</title>
</head>
<body>
<%= request.getAttribute("response") %>
If you are not directed in 3 seconds, please click this <a href="index.jsp">link</a>
</body>
</html>