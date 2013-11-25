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
		<%@include file="sidebar.jsp" %>
		
		<article id="content" class="body">
			<div class="view">
				<img src="images/cocacola.jpg"/>
				<div class="mask">
					<h2><a href="detailbarang.jsp" class="info">Barang Dummy 1</a></h2>
					<p>Harga: 1000
					<br>Masukkan jumlah yang akan dibeli:
					<br><input type="number" id="qty" name="quantity" min="0">
					<input type="button" id="buybutton" value="Beli!">
					</p>
				</div>
			</div>
			<div class="view">
				<img src="images/floridina.jpg"/>
				<div class="mask">
					<h2><a href="detailbarang.jsp" class="info">Barang Dummy 2</a></h2>
					<p>Harga: 2000
					<br>Masukkan jumlah yang akan dibeli:
					<br><input type="number" id="qty" name="quantity" min="0">
					<input type="button" id="buybutton" value="Beli!">
					</p>
				</div>
			</div>
		</article>
		
		<%@include file="footer.jsp" %>
	</div>	
</body>
</html>