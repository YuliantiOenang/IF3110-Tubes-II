<!DOCTYPE html>

<html>
<script>
	function validateLogin() {
		var user = document.forms['loginForm']['username'].value;
		var pass = document.forms['loginForm']['password'].value;
		var xmlhttp;
		if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		xmlhttp.onreadystatechange=function()
		  {
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				var res;
				if (xmlhttp.response == 1)
					res = "bener";
				else res = "salah";
				document.getElementById("result").innerHTML = res;
				
			}
		  }
		xmlhttp.open("GET","verifyLogin.jsp?username="+user+"&password="+pass,true);
		xmlhttp.send();
	}
</script>

<body>
	<div id='header'>
		<form id='loginForm' method='POST'>
			username: <input type='text' name='username'>
			password: <input type='password' name='password'>
			<input type="button" value="Submit" action onclick='validateLogin()'></input>
		</form>
	</div>
	<div id='result'></div>
<body>
</html>