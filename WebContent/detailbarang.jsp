<!DOCTYPE html>
<html>
<head>
	<title>Detail Barang</title>
	<link rel="stylesheet" href="css/main.css" type="text/css"/> 
</head>
<body id="index" class="home">
	<div id="container">
		<%@ include file="header.jsp" %>
		<%
		connection = DriverManager.getConnection(db_url, "root", "");
		statement = connection.createStatement();
		String query = "SELECT * FROM barang WHERE nama = " + request.getParameter("barang");
		ResultSet goods = statement.executeQuery(query);
		%>
		
		<div id="contentcontainer">
		<% while(goods.next()) { %>
		<article id="contentfull" class="body">
			<img id="imgbarang" src="<%= goods.getObject("gambar")%>"/>
			<h2><%= goods.getObject("nama") %></h2>
			<form>
			<p>Keterangan: </p>
			<p><%= goods.getObject("keterangan") %></p>
			<p>Tambahan permintaan: </p>
			<textarea></textarea>
			<p>Masukkan jumlah yang akan dibeli: </p>
			<input type="number" id="qty" name="quantity" min="0">
			<input type="button" id="buybutton" value="Beli!">
			</form>
		</article>
		<% } connection.close(); %>
		</div>
		
		<%@include file="footer.jsp" %>
	</div>	
</body>
</html>