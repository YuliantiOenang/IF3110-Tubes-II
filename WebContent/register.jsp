<%@ page import="java.sql.*"%>  
<%@ page import="java.util.*"%>  
<%@ page import="java.io.*"%>

<%
	String url = "jdbc:mysql://localhost/ruserba";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection(url, "root", "");

	String nama = request.getParameter("nama");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String nohp = request.getParameter("hp");
	String alamat = request.getParameter("alamat");
	String provinsi = request.getParameter("provinsi");
	String kota = request.getParameter("kota");
	String kodepos = request.getParameter("kodepos");
	String email = request.getParameter("email");

	String query = "INSERT into anggota (username, password, nama, nomorhp, alamat, provinsi, kota, kodepos, email, foto, jmlhtransaksi, tipe) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
	
	PreparedStatement stat = conn.prepareStatement(query);
	
	stat.setString(1,username);
	stat.setString(2,password);
	stat.setString(3,nama);
	stat.setString(4,nohp);
	stat.setString(5,alamat);
	stat.setString(6,provinsi);
	stat.setString(7,kota);
	stat.setString(8,kodepos);
	stat.setString(9,email);
	stat.setString(10,"");
	stat.setInt(11,0);
	stat.setString(12,"User");
	
	int rec = stat.executeUpdate();
	
	conn.close();
%>

<!DOCTYPE html>
<html>
<head>
	<title>RAN's Shop - Shopping Cart</title>
	<link rel="stylesheet" href="css/main.css" type="text/css"/>
	<link rel="stylesheet" href="css/cart.css" type="text/css"/> 
</head>
<body id="index" class="home">
	<div id="container">
		<%@include file="header.jsp" %>
		
		<article id="contentfull" class="body">
			<h2>Registrasi Berhasil!</h2><br>
			<a href="index.jsp">Kembali ke halaman utama</a>
		</article>
		
		<%@include file="footer.jsp" %>
	</div>	
</body>
</html>