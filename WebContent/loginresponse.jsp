<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="3; url=index" />
<title>Insert title here</title>
</head>
<body>
<%= request.getAttribute("response") %><br />
If you are not directed in 3 seconds, please click this <a href="index">link</a>
<% if (request.getSession(true).getAttribute("user_id") == null) { %>
<script>
alert("login failed");
</script>
<% } %>
</body>
</html>