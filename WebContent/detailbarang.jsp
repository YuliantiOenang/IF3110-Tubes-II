<!DOCTYPE html>
<html>
<head>
	<title>Detail Barang</title>
	<link rel="stylesheet" href="css/main.css" type="text/css"/>
	<script src="javascript/admin.js"></script>
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
			<%
				if (session.getAttribute("Privilege") == "User") {
					%>
						<img id="imgbarang" src="<%= goods.getObject("gambar")%>"/>
						<h2><%= goods.getObject("nama") %></h2>
					<%
				} else {
					%>
						<img id="imgbarang" src="<%= goods.getObject("gambar")%>"/>
						<form name="barang">
							<div>
								<input type="hidden" name="id" value="<%= goods.getObject("id") %>"/>
							</div>
							<div>
								<h3>Gambar</h3>
								<input type="text" name="gambar" value="<%= goods.getObject("gambar") %>"/>
							</div>
							<div>
								<h3>Nama</h3>
								<input type="text" name="nama" value="<%= goods.getObject("nama") %>"/>
							</div>
							<div>
								<h3>Harga</h3>
								<input type="text" name="harga" value="<%= goods.getObject("harga") %>"/>
							</div>
						</form>
						<h4></h4>
						<input id="buybutton" type="button" value="Hapus Barang" onclick="deleteBarang()" />
						<input id="buybutton" type="button" value="Update Barang" onclick="updateBarang()" />
					<%
				}
			%>
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