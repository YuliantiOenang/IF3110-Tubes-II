<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Edit profile</h1>
	<hr />
	<form method="post" action="user" onsubmit="return validateAll()" name="regform">
		<input id="action" name="action" type="hidden" value="edit"/>
		<input id="password1" name="password1" placeholder="password" type="password" onkeyup="if(this.value != '') validatePassword(this.value, password2.value, username.value, email.value, 'valpasswords');" required /><div id="valpassword"></div><br />
		<input id="password2" name="password2" placeholder="password lagi" type="password" onkeyup="if(this.value != '') validatePassword(password1.value, this.value, username.value, email.value, 'valpasswords');" required /><div id="valpasswords"></div><br />
		<input id="name" name="name" placeholder="nama lengkap" type="text" onkeyup="if(this.value != '') validateName(this.value, 'fullname');" required /><div id="fullname"></div><br />
		<input id="email" name="email" placeholder="email" type="email" onkeyup="if(this.value != '') validateEmail('email', this.value, 'valemail');" required /><div id="valemail"></div><br />
		                        
		<input id="telephone" name="telephone" placeholder="telepon" type="tel" onkeyup="validateEmpty(this.value, 'valtelephone')" required /><div id="valtelephone"></div><br />
		<textarea id="address" name="address" onkeyup="validateEmpty(this.value, 'valaddress')" required ></textarea><div id="valaddress"></div><br />
		<input id="city" name="city" placeholder="kota" type="text" onkeyup="validateEmpty(this.value, 'valcity')" required /><div id="valcity"></div><br />
		<input id="province" name="province" placeholder="provinsi" type="text" onkeyup="validateEmpty(this.value, 'valprovince')" required /><div id="valprovince"></div><br />
		<input id="postal" name="postal" placeholder="kode pos" type="number" onkeyup="validateEmpty(this.value, 'valpostal')" required /><div id="valpostal"></div><br />
		                        
		<input type="submit" /><br />
	</form>
</body>
</html>