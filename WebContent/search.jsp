<!DOCTYPE html>
<html>
<head>
	<title>RAN's Shop - Home</title>
	<link rel="stylesheet" href="css/main.css" type="text/css"/> 
	<link rel="stylesheet" href="css/halamanbarang.css" type="text/css"/>
</head>
<body id="index" class="home">
	<div id="container">
		<%@include file="header.jsp" %>
		<%@include file="sidebar.jsp" %>
		
		<% 
		String searchParam = request.getParameter("search");
		connection = DriverManager.getConnection(db_url, "root", "");
		statement = connection.createStatement();
		String query = "SELECT * FROM barang WHERE nama LIKE \"%" + searchParam + "%\"";
		ResultSet searchResult = statement.executeQuery(query);
		%>
		<article id="content" class="body">
			<h1>Search Result : <%= searchParam %></h1>
			<%
			if(searchResult != null) {
				while(searchResult.next()) { %>
					<div class="view">
						<img src="<%= searchResult.getObject("gambar") %>"/>
						<div class="mask">
							<h2><a href="detailbarang.jsp?barang='<%= searchResult.getObject("nama") %>'" class="info">
							<%= searchResult.getObject("nama") %></a></h2>
							<p>Harga: <%= searchResult.getObject("harga") %>
							<br />Masukkan jumlah yang akan dibeli:
							<br /><input type="number" id="qty" name="quantity" min="0">
							<input type="button" id="buybutton" value="Beli!">
							</p>
						</div>
					</div>
			<% } 
			} %>
		</article>
		
		<%@include file="footer.jsp" %>
	</div>	
</body>
</html>