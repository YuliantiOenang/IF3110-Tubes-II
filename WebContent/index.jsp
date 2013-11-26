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
		<% 
		connection = DriverManager.getConnection(db_url, "root", "");
		statement = connection.createStatement();
		categories = statement.executeQuery("SELECT DISTINCT kategori FROM barang");
		%>
		
		<div id = contentcontainer>
			<article id="content" class="body">
				<% while(categories.next()) {
					Statement statement2 = connection.createStatement();
					String query2 = "SELECT * FROM barang WHERE kategori = \"" +
							categories.getObject("kategori") + "\" ORDER BY terjual DESC";
					ResultSet mostBoughtProducts = statement2.executeQuery(query2); %>
					<h2><%= categories.getObject("kategori") %></h2>
					<% for(int i = 1; i <= 3; i++) { 
						if(mostBoughtProducts.next()) { %>
						<div class="view">
							<img src="<%= mostBoughtProducts.getObject("gambar") %>"/>
							<div class="mask">
								<h2><a href="detailbarang.jsp?barang='<%= mostBoughtProducts.getObject("nama") %>'" class="info">
								<%= mostBoughtProducts.getObject("nama") %></a></h2><p>Harga: <%= mostBoughtProducts.getObject("harga") %>
								<br />Masukkan jumlah yang akan dibeli:
								<br /><input type="number" id="qty" name="quantity" min="0">
								<input type="button" id="buybutton" value="Beli!">
								</p>
							</div>
						</div>
					<% } else {
							break;
						}
					} 
				} connection.close(); %>
			</article>
			
			<aside id="indexsidebar" class="body">
				<img src="images/howto.png"/>
			</aside>
		</div>
		<%@include file="footer.jsp" %>
	</div>	
</body>
</html>