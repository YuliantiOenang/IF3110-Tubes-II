<%-- 
    Document   : login
    Created on : Nov 26, 2013, 10:03:19 PM
    Author     : A46CB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" href="assets/css/style.css" type="text/css" />
	<link rel="shortcut icon" href="favicon.ico" />
	<script type="text/javascript" src="json2.js"></script>
	<script type="text/javascript" src="xhr.js"></script>
	<script type="text/javascript" src="validate.js"></script>
</head>
<body>
	<div id="content">
		<div class="section page">
			<h1>Login</h1>
			<div class="wrapper">
				<form name="login" method="post" action="login.php">
					<label>Username</label>
					<input type="text" name="username" id="username">
					<span id="unameInfo"></span>
					<label>Password</label>
					<input type="password" name="password" id="password">
					<span id="passInfo"></span><br />
					<span id="loginInfo"></span><br />
					<input type="button" value="Login" id="submit" name="submit" onclick="validateLogin()">
				</form>
			</div>
		</div>
	</div>
</body>
</html>
