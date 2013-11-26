<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>Detail Product</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
	</script>
</head>
<body>
	
	<div id="container">
		
		<jsp:include page="header.jsp"/>
		
		<div id="dagangan">
			
			<!-- Dagangan Baris 1 -->
			<div class="frame">
				<div class="kolom-6 product">					
					<div class="frame">
						<div class="kolom-6">
							<img class="gambar" src="res/img/product/<%=session.getAttribute("namab")%>.jpg" alt=""/>
						</div>
						<div class="kolom-6">
							<p class="nama-produk-b"><a href="<%=session.getAttribute("namab")%>"><%=session.getAttribute("namab")%></a></p>
							<p class="harga">Harga: <%=session.getAttribute("hargab")%> /kg</p>
							<div class="frame buy-bar">
							<form action="CartController" method="post" accept-charset='UTF-8'>
								<textarea name="cartDetail" class="kolom-10 buy-text" rows="4" onfocus="checkclear(this)" onblur="checkempty(this, 'Detail pesanan jika ada')">Detail pesanan jika ada</textarea>
								<input class="kolom-9 buy-box" type="text" name="cartQuantity" value="Banyaknya barang.." onfocus="checkclear(this)" onblur="checkempty(this, 'Banyaknya barang..')"> 
								<input type="hidden" name="action" value="add">
								<input type="hidden" value="<%out.print((String)session.getAttribute("namab"));%>" name="cartNama">
								<input type="hidden" value="<%out.print((Integer)session.getAttribute("hargab"));%>" name="cartHarga">
								<input type="hidden" value="<%out.print((String)session.getAttribute("kategorib"));%>" name="cartKategori">
								<button class="kolom-1 buy-button" type="submit" ></button>
							</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--End of Dagangan-->	
		</div>
		
	</div>
	
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>
	
</body>
</html>