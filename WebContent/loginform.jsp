<!-- popup form -->

<link rel="stylesheet" href="css/login.css" type="text/css"/>
<a href="#x" class="overlay" id="login_form"></a>

<div class="popup">
	<p>Silakan masukkan username dan password Anda</p>
	<form method="get" action="UserServlet">
		<div>
			<label for="username">Username</label>
			<input type="text" name="username" value=""/>
		</div>
		<div>
			<label for="password">Password</label>
			<input type="password" name="password" value=""/>
		</div>
		<input type="submit" value="Log In" />
	</form>
	<a class="close" href="index.jsp"></a>
</div>