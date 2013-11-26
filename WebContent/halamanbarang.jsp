<!DOCTYPE html>
<html>
<head>
	<title>List Barang</title>
	<link rel="stylesheet" href="css/main.css" type="text/css"/> 
	<link rel="stylesheet" href="css/halamanbarang.css" type="text/css"/>
</head>
<body id="index" class="home">
	<div id="container">
		<%@include file="header.jsp" %>
		<%
		connection = DriverManager.getConnection(db_url, "root", "");
		assert(connection != null);
		statement = connection.createStatement();
		String query = "SELECT * FROM barang WHERE kategori = " + request.getParameter("kategori");
		ResultSet goodies = statement.executeQuery(query);
		%>
		<div id="contentcontainer">
		<article id="content" class="body">
			<div class="sort">
				<p id="sort-text">Sort by:<br>
					<button type="button" class="button" id="sortnama">Nama</button>
					<button type="button" class="button" id="sortharga">Harga</button>
				</p>
			</div>
			<% while(goodies.next()) { %>
			<div class="view">
				<img src="<%= goodies.getObject("gambar") %>"/>
				<div class="mask">
					<h2><a href="detailbarang.jsp?barang='<%= goodies.getObject("nama") %>'" class="info">
					<%= goodies.getObject("nama") %></a></h2>
					<p>Harga: <%= goodies.getObject("harga") %>
					<br>Masukkan jumlah yang akan dibeli:
					<br><input type="number" id="qty" name="quantity" min="0">
					<input type="button" id="buybutton" value="Beli!">
					</p>
				</div>
			</div>
			<% } connection.close(); %>
		</article>
		
		<%@include file="sidebar.jsp" %>
		</div>
		
		<%@include file="footer.jsp" %>
	</div>	
</body>
</html>