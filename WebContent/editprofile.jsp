<!DOCTYPE html>
<html>
<head>
	<title>RAN's Shop - Profile</title>
	<link rel="stylesheet" href="css/main.css" type="text/css"/> 
</head>
<body id="index" class="home">
	<div id="container">
		<%@include file="header.jsp" %>
		
		<article id="contentfull" class="body">
			<h2>Edit Profil</h2>
			<%
			connection = DriverManager.getConnection(db_url, "root", "");
			statement = connection.createStatement();
			String query = "SELECT * FROM anggota WHERE username =\"" + session.getAttribute("Username") + "\"";
			ResultSet user = statement.executeQuery(query);
			user.next();
			%>
			<form id="registerform" method="post" action="editprofilesave.jsp">
				<pre>(*) Harus diisi.</pre>
				<pre>Nama Lengkap*		</pre><input type="text" name="nama" id="nama" value="<%= user.getObject("nama") %>"/>
				<pre>Username*			</pre><input type="text" name="username" id="usnm" value="<%= user.getObject("username") %>" disabled/>
				<pre>Password*			</pre><input type="password" name="password" id="pwd" value="<%= user.getObject("password") %>"/>
				<pre>Confirm Password*	</pre><input type="password" name="password2" id="pwd2"/>
				<pre>Nomor HP			</pre><input type="text" name="hp" id="nomorhp" value="<%= user.getObject("nomorhp") %>"/>
				<pre>Alamat				</pre><input type="text" name="alamat" id="alamat" value="<%= user.getObject("alamat") %>"/>
				<pre>Provinsi			</pre><input type="text" name="provinsi" id="provinsi" value="<%= user.getObject("provinsi") %>"/>
				<pre>Kota				</pre><input type="text" name="kota" id="kota" value="<%= user.getObject("kota") %>"/>
				<pre>Kode Pos			</pre><input type="text" name="kodepos" id="kodepos" value="<%= user.getObject("kodepos") %>"/>
				<pre>Email*				</pre><input type="text" name="email" id="email" value="<%= user.getObject("email") %>"/>
				<input type="submit" value="Save"/> <a href='profile.jsp'>Kembali</a>
			</form>
		</article>
		
		<%@include file="footer.jsp" %>
	</div>	
</body>
</html>