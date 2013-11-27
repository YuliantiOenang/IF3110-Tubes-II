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
			<h2>Shopping Bag</h2>
			<div class="div-table">
	        	<div class="div-table-row">
	                <div class="div-table-col-head">Hapus</div>
	                <div class="div-table-col-head">Nama Barang</div>
	                <div class="div-table-col-head">Kategori</div>
	                <div class="div-table-col-head">Tambahan</div>
	                <div class="div-table-col-head">Jumlah</div>
	                <div class="div-table-col-head">Harga Satuan</div>
	                <div class="div-table-col-head">Total Harga</div>
	            </div>
	            <div class="div-table-row">
	                <div class="div-table-col"><input type="checkbox" name="delete"></div>
	                <div class="div-table-col">Apa aja boleh</div>
	                <div class="div-table-col">Apa aja boleh</div>
	                <div class="div-table-col">Gak ada</div>
	                <div class="div-table-col">Berapa ya</div>
	                <div class="div-table-col">Berapa ya</div>
	                <div class="div-table-col">Berapa ya</div>
	            </div>
      		</div>
      		<p id="total">Total: </p>
      		<button type="button" class="button" id="update">Update</button>
			<button type="button" class="button" id="checkout">Checkout</button>
			<button type="button" class="button" id="cont">Continue Shopping</button>
		</article>
		
		<%@include file="footer.jsp" %>
	</div>	
</body>
</html>