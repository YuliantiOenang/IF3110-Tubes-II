<!DOCTYPE html>
<html>
<head>
	<title>RAN's Shop - Profile</title>
	<link rel="stylesheet" href="css/main.css" type="text/css"/> 
</head>
<body id="index" class="home">
	<div id="container">
		<%@include file="header.jsp" %>
		<%
			connection = DriverManager.getConnection(db_url, "root", "");
			statement = connection.createStatement();
			String query = "SELECT * FROM anggota WHERE username =\"" + session.getAttribute("Username") + "\"";
			ResultSet user = statement.executeQuery(query);
			user.next();
		%>
		<article id="contentfull" class="body">
			<h2>Profil User</h2>
			<div id="info">
				<pre id="nama">Nama Lengkap		: <%= user.getObject("nama") %></pre>
				<pre id="usernamep">Username			: <%= user.getObject("username") %></pre>
				<pre id="nomorhp">Nomor Hp			: <%= user.getObject("password") %></pre>
				<pre id="alamat">Alamat				: <%= user.getObject("alamat") %></pre>
				<pre id="provinsi">Provinsi				: <%= user.getObject("provinsi") %></pre>
				<pre id="kota">Kota					: <%= user.getObject("kota") %></pre>
				<pre id="kodepos">Kode Pos				: <%= user.getObject("kodepos") %></pre>
				<pre id="email">Email				: <%= user.getObject("email") %></pre>
				<pre id="trans">Jumlah Transaksi		: <%= user.getObject("jmlhtransaksi") %></pre>
				<form method="post" action="editprofile.jsp">
				<input type="submit" class="button" value="Edit Profile">
				</form>
			</div>
		</article>
		
		<%@include file="footer.jsp" %>
	</div>	
</body>
</html>