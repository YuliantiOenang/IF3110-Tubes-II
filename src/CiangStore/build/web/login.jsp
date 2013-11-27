<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<html lang="en-US">
	<head>
		<meta charset="UTF-8"></meta>
		<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
		<script src="js/login.js"></script>
		<title>
			Masuk
		</title>
	</head>
	<body>
	<div id="container">
		<div id="form-registrasi" class="frame">
		<form name="loginForm">
			<div id="data-diri" class="frame>
				<p id="label_form" class="label">
					Username :
				</p>
				<p><input id="field-box kolom-12" class="text_field" type="text" name="username"></input></p>
			</div>
			<div id="form_one_row">
				<p id="label_form" class="label">
					Password :
				</p>
				<p><input id="field-box kolom-12" class="text_field" type="password" name="pwd"></input></p>
			</div>
			<br/>
				<input id="submit" type="button" value="MASUK" onclick=" validateForm()"></input>
		</form>
		</div>
	</div>
	</body>
</html>
