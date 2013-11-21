<%
	String bestb1="";
	String bestb2="";
	String bestb3="";
	String bestb4="";
	String bestb5="";
	String bestb6="";
	String bestb7="";
	String bestb8="";
	String bestb9="";
	String bestb10="";
	String bestb11="";
	String bestb12="";
	String bestb13="";
	String bestb14="";
	String bestb15="";
	if (session.getAttribute("BestBuy1")==null){
		response.sendRedirect("getbestbuy");
	}else{
		bestb1 = (String)session.getAttribute("BestBuy1");
		bestb2 = (String)session.getAttribute("BestBuy2");
		bestb3 = (String)session.getAttribute("BestBuy3");
		bestb4 = (String)session.getAttribute("BestBuy4");
		bestb5 = (String)session.getAttribute("BestBuy5");
		bestb6 = (String)session.getAttribute("BestBuy6");
		bestb7 = (String)session.getAttribute("BestBuy7");
		bestb8 = (String)session.getAttribute("BestBuy8");
		bestb9 = (String)session.getAttribute("BestBuy9");
		bestb10 = (String)session.getAttribute("BestBuy10");
		bestb11 = (String)session.getAttribute("BestBuy11");
		bestb12 = (String)session.getAttribute("BestBuy12");
		bestb13 = (String)session.getAttribute("BestBuy13");
		bestb14 = (String)session.getAttribute("BestBuy14");
		bestb15 = (String)session.getAttribute("BestBuy15");
	}
	
%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>Masukkan Judul Dokumen</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
</head>
<body>
	
	<div id="container">
		
		<jsp:include page="header.jsp"/>
		
	
		
		<br/>
		<a id="best-buy-btn" href="#best-buy" class="btn">Best Buy Products!!</a>
		
		<!-- Slideshow Section -->
		<div id="slideshow" class="frame">
			<div class="item">
				<img class="img-konten" src="res/img/slideshow/gulali_world.png" alt=""/>
				<div class="caption">
					<p class="text">
						Thank you for visiting our online shop !
					</p>
				</div>
			</div>
			<a href="#" class="btn-left">&lsaquo;</a>
			<a href="#" class="btn-right">&rsaquo;</a>
		</div>
		<br/><br/><br/><br/>
		<!-- End of Section -->
		<div id="divpetunjuk" style="float: left; width: 27%;">
	<form id="formpetunjuk">
	<br>Aturan Belanja: <br> 
	<br>1. Pengguna yang ingin berbelanja harus memiliki akun terlebih dahulu, jika sudah, pilih login dan jika belum pilih registrasi
	<br><br>2. Pengguna yang ingin berbelanja harus memasukkan informasi kartu kredit, jika tidak, transaksi tidak akan direalisasikan
	<br>HAPPY SHOPPING!
	</form>
	</div>
		
		<div id="best-buy" class="frame">
			<div id="bbuy-text" class="kolom-4">
				<p id="bbuy-a">Best Buy</p>
				<p id="bbuy-b">Products</p>
			</div>
			<div class="kolom-8">
			
				<div class="frame">
					<div>
					BERAS
					</div>
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/<%out.print(bestb1);%>.jpg" alt=""/>
							<p class="nama-produk"><?php echo $_SESSION['BestBuy'][0]?></p>
							<p class="asal-produk"><?php echo $_SESSION['BestBuyKategori'][0]?></p>
						</a>
					</div>
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/<%out.print(bestb2);%>.jpg" alt=""/>
							<p class="nama-produk"><?php echo $_SESSION['BestBuy'][1]?></p>
							<p class="asal-produk"><?php echo $_SESSION['BestBuy'][1]?></p>	
						</a>						
					</div>
					<div class="kolom-4 product">
						<a href="#">
							<img class="gambar" src="res/img/product/<%out.print(bestb3);%>.jpg" alt=""/>
							<p class="nama-produk"><?php echo $_SESSION['BestBuy'][2]?></p>
							<p class="asal-produk"><?php echo $_SESSION['BestBuy'][2]?></p>
						</a>							
					</div>
					
					<div>
					DAGING
					</div>
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/<%out.print(bestb4);%>.jpg" alt=""/>
							<p class="nama-produk"><?php echo $_SESSION['BestBuy'][3]?></p>
							<p class="asal-produk"><?php echo $_SESSION['BestBuy'][3]?></p>		
						</a>						
					</div>		
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/<%out.print(bestb5);%>.jpg" alt=""/>
							<p class="nama-produk"><?php echo $_SESSION['BestBuy'][3]?></p>
							<p class="asal-produk"><?php echo $_SESSION['BestBuy'][3]?></p>		
						</a>						
					</div>
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/<%out.print(bestb6);%>.jpg" alt=""/>
							<p class="nama-produk"><?php echo $_SESSION['BestBuy'][3]?></p>
							<p class="asal-produk"><?php echo $_SESSION['BestBuy'][3]?></p>		
						</a>						
					</div>
					<div>
					SAYURAN
					</div>
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/<%out.print(bestb7);%>.jpg" alt=""/>
							<p class="nama-produk"><?php echo $_SESSION['BestBuy'][3]?></p>
							<p class="asal-produk"><?php echo $_SESSION['BestBuy'][3]?></p>		
						</a>						
					</div>
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/<%out.print(bestb8);%>.jpg" alt=""/>
							<p class="nama-produk"><?php echo $_SESSION['BestBuy'][3]?></p>
							<p class="asal-produk"><?php echo $_SESSION['BestBuy'][3]?></p>		
						</a>						
					</div>
					
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/<%out.print(bestb9);%>.jpg" alt=""/>
							<p class="nama-produk"><?php echo $_SESSION['BestBuy'][3]?></p>
							<p class="asal-produk"><?php echo $_SESSION['BestBuy'][3]?></p>		
						</a>						
					</div>
					<div>
					FROZEN FOOD
					</div>
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/<%out.print(bestb10);%>.jpg" alt=""/>
							<p class="nama-produk"><?php echo $_SESSION['BestBuy'][3]?></p>
							<p class="asal-produk"><?php echo $_SESSION['BestBuy'][3]?></p>		
						</a>						
					</div>
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/<%out.print(bestb11);%>.jpg" alt=""/>
							<p class="nama-produk"><?php echo $_SESSION['BestBuy'][3]?></p>
							<p class="asal-produk"><?php echo $_SESSION['BestBuy'][3]?></p>		
						</a>						
					</div>
					
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/<%out.print(bestb12);%>.jpg" alt=""/>
							<p class="nama-produk"><?php echo $_SESSION['BestBuy'][3]?></p>
							<p class="asal-produk"><?php echo $_SESSION['BestBuy'][3]?></p>		
						</a>						
					</div>
					<div>
					SNACK
					</div>
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/<%out.print(bestb13);%>.jpg" alt=""/>
							<p class="nama-produk"><?php echo $_SESSION['BestBuy'][3]?></p>
							<p class="asal-produk"><?php echo $_SESSION['BestBuy'][3]?></p>		
						</a>						
					</div>
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/<%out.print(bestb14);%>.jpg" alt=""/>
							<p class="nama-produk"><?php echo $_SESSION['BestBuy'][3]?></p>
							<p class="asal-produk"><?php echo $_SESSION['BestBuy'][3]?></p>		
						</a>						
					</div>
					
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/<%out.print(bestb15);%>.jpg" alt=""/>
							<p class="nama-produk"><?php echo $_SESSION['BestBuy'][3]?></p>
							<p class="asal-produk"><?php echo $_SESSION['BestBuy'][3]?></p>		
						</a>						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>
	
	
</body>
</html>