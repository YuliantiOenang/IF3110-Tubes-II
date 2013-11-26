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
			<h2>Profil User</h2>
			<div id="info">
				<pre id="nama">Nama Lengkap		: </pre>
				<pre id="usernamep">Username			: </pre>
				<pre id="nomorhp">Nomor Hp			: </pre>
				<pre id="alamat">Alamat			: </pre>
				<pre id="provinsi">Provinsi			: </pre>
				<pre id="kota">Kota				: </pre>
				<pre id="kodepos">Kode Pos			: </pre>
				<pre id="email">Email			: </pre>
				<pre id="trans">Jumlah Transaksi	: </pre>
				<form method="post" action="editprofile.jsp">
				<input type="submit" class="button" value="Edit Profile">
				</form>
			</div>
		</article>
		
		<%@include file="footer.jsp" %>
	</div>	
</body>
</html>