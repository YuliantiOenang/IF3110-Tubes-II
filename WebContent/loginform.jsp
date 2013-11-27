<!-- popup form -->

<link rel="stylesheet" href="css/login.css" type="text/css"/>
<script src="javascript/cookies.js"></script>
<script src="javascript/login.js"></script>
<a href="#x" class="overlay" id="login_form"></a>

<div class="popup">
	<p>Silakan masukkan username dan password Anda</p>
	<form name="login" method="get" action="">
	<div>
		<label for="username">Username</label>
		<input type="text" name="username" value=""/>
	</div>
	<div>
		<label for="password">Password</label>
		<input type="password" name="password" value=""/>
	</div>
	<input type="button" value="Log In" onclick="validateUser()" />
	<a class="close" href="index.jsp"></a>
	</form>
</div>