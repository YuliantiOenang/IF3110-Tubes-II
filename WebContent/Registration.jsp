<%@ page import = "java.sql.*" %>
<%@ page import = "database.UserSQL; " %>

<!DOCTYPE html>
<html>

<!-- Head -->
<head><script src="FormValidation.js"></script>
</head>

<!-- Body -->
<body>

<!-- JSP Script -->

<%
	String username = request.getParameter("username");
	String fullname = request.getParameter("fullname");
	String hp = request.getParameter("hp");
	String email = request.getParameter("email");
	String alamat = request.getParameter("alamat");
	String provinsi = request.getParameter("provinsi");
	String kota = request.getParameter("kota");
	String kodepos = request.getParameter("kodepos");
	String password = request.getParameter("password");
	
	UserSQL.AddUser(username, email, password, fullname, alamat, provinsi, kota, Integer.parseInt(kodepos), Integer.parseInt(hp));

%>


<!-- Form Pendaftaran -->	
<form method="post" action="Registration.jsp" name="registration" >
<span>Username:<input id='id' type="text" name="username" onkeyup='validate("username")' required><label id = "username"></label></span>
<span><br>Nama Lengkap: <input id="fname" type="text" name="fullname" onkeyup='validate("fullname")' required > <label id = "fullname"></label></span> 
<span><br>Nomor Handphone:* <input type="text" name="hp" id="nohp"></span>
<span><br>Email: <input id='mail' type="text" name="email" onkeyup='validate("email")' required><label id = "email"></label></span>
<span><br>Alamat:* <input type="text" name="alamat"id="alamat"></span>
<span><br>Provinsi:* <input type="text" name="provinsi"id="provinsi"></span>
<span><br>Kota/Kabupaten:* <input type="text" name="kota" id="kota"></span>
<span><br>Kodepos:* <input type="text" name="kodepos"id="kodepos"></span>
<span><br>Password: <input id="pass" type="password" name="password" onkeyup='validate("password")' required><label id = "password"></label></span> 
<span><br>Confirm Password: <input type="password" name="confirm" onkeyup='validate("confirm")' required><label id = "confirm"></label></span> 
<br><input type="submit" id="submitbutton" value="Register">
<p>*optional</p>
</form>

</body>
</html>