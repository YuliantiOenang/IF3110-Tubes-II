<!-- popup form -->

<link rel="stylesheet" href="css/login.css" type="text/css"/>
<script src="javascript/cookies.js"></script>
<script src="javascript/login.js"></script>
<a href="#x" class="overlay" id="logout_form"></a>

<div class="popup">
	<p>Anda yakin ingin keluar?</p>
	<form name="login">
	<div>
		<label for="username">Username</label>
		<input type="text" name="username" value=""/>
	</div>
	<div>
		<label for="password">Password</label>
		<input type="password" name="password" value=""/>
	</div>
	<a href="index.jsp"><input type="button" value="Log In" onclick="validateUser()" /></a>
	<a class="close" href="index.jsp"></a>
	</form>
</div>