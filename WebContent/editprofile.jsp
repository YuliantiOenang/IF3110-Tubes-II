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
			<form id="registerform" method="post">
				<pre>(*) Harus diisi.</pre>
				<pre>Nama Lengkap*		<input type="text" name="nama" id="nama"/></pre>
				<pre>Username*			<input type="text" name="username" id="usnm"/></pre>
				<pre>Password*				<input type="password" name="password" id="pwd"/></pre>
				<pre>Confirm Password*		<input type="password" name="password2" id="pwd2"/></pre>
				<pre>Nomor HP				<input type="text" name="nomorhp" id="nomorhp"/></pre>
				<pre>Alamat				<input type="text" name="alamat" id="alamat"/></pre>
				<pre>Provinsi				<input type="text" name="provinsi" id="provinsi"/></pre>
				<pre>Kota					<input type="text" name="kota" id="kota"/></pre>
				<pre>Kode Pos				<input type="text" name="kodepos" id="kodepos"/></pre>
				<pre>Email*				<input type="text" name="email" id="email"/></pre>
				<input type="button" value="Save"/> <a href='profile.php'>Kembali</a>
			</form>
		</article>
		
		<%@include file="footer.jsp" %>
	</div>	
</body>
</html>