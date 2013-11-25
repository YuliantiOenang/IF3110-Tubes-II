<!DOCTYPE html>
<html>
<head>
	<title>Detail Barang</title>
	<link rel="stylesheet" href="css/main.css" type="text/css"/> 
</head>
<body id="index" class="home">
	<div id="container">
		<%@include file="header.jsp" %>
		<%@include file="sidebar.jsp" %>
		
		<article id="content" class="body">
			<img id="imgbarang" src="images/cocacola.jpg"/>
			<h2>Coca Cola</h2>
			<form>
			<p>Keterangan: </p>
			<p>Minuman soda menyegarkan.</p>
			<p>Tambahan permintaan: </p>
			<textarea></textarea>
			<p>Masukkan jumlah yang akan dibeli: </p>
			<input type="number" id="qty" name="quantity" min="0">
			<input type="button" id="buybutton" value="Beli!">
			</form>
		</article>
		
		<%@include file="footer.jsp" %>
	</div>	
</body>
</html>