<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>${user.getUsername()}</h1>
	${user.getAddress()}
	<br /> ${user.getCity()}
	<br /> ${user.getProvince()}
	<br /> ${user.getTelephone()}
	<br /> ${user.getPostal()}
	<br />
	<button type="button" onclick="location.href='editprofile.jsp'">Edit Profile</button>
	<button>CC</button>
</body>
</html>