<%-- 
    Document   : wronglogin
    Created on : Nov 26, 2013, 6:31:31 PM
    Author     : Aldo2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Wrong Password</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<script type="text/javascript" src="register.js"></script>
	</head>
	<body>
		<!--Header-->
			<div id="header">
				<%@ include file="header.jsp" %>
			</div>
			<!--Body-->
			<div id="task-page-body">
				<h1>Kombinasi Username/Password Salah</h1>
				Email dan kata sandi yang Anda masukkan tidak cocok. Silakan ulangi input.
				<br>
				<br>
				<form action="checklogin" method="post" enctype="multipart/form-data">
				<div>
					<label for="login">Username :</label>
					<input type="text" id="loginusername" value="" name="username"/>
				</div>
				<div>
					<label for="asignee">Password : </label>
					<input type="password" id="loginPassword" value="" name="password"/>
				</div>
				<div>
					<input type="submit" value="Login"/>
					<a href="register.php">Register</a>
				</div>
				</form>
			</div>
			
			
	</body>
</html>
