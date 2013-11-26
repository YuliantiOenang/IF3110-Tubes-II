<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>Masukkan Judul Dokumen</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
</head>
<body>
	
	<div id="container">
		
		<%@ include file="header.jsp" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		
		<!-- Navbar Section -->
		<div id="navbar" class="frame">
			<ul>
				<li><a href="Barang?Kategori=Beras">Beras</a></li>
				<li><a href="Barang?Kategori=Daging">Daging</a></li>
				<li><a href="Barang?Kategori=Sayuran">Sayuran</a></li>
				<li><a href="Barang?Kategori=Frozen Food">Frozen Food</a></li>
			</ul>
		</div>
		<!-- End of Navbar -->
		
		<br/>
		<a id="best-buy-btn" href="#best-buy" class="btn">See Best Buy!!</a>
		
		<!-- Slideshow Section -->
		<div id="slideshow" class="frame">
			<div class="item">
				<img class="img-konten" src="res/img/slideshow/gulali_world.png" alt=""/>
				<div class="caption">
					<p class="text">
						Check out our snack section! We have a lot of snack 
						from Gulali World!!
					</p>
				</div>
			</div>
			<a href="#" class="btn-left">&lsaquo;</a>
			<a href="#" class="btn-right">&rsaquo;</a>
		</div>
		<img src="res/img/baloon.png" alt=""/>
		<!-- End of Section -->
		
		<div id="best-buy" class="frame">
			<div id="bbuy-text" class="kolom-4">
				<p id="bbuy-a">Best Buy</p>
				<p id="bbuy-b">Products</p>
			</div>
			<div class="kolom-8">
				<div class="frame">
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/" alt=""/>
							<p class="nama-produk"></p>
							<p class="asal-produk"></p>
						</a>
					</div>
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/" alt=""/>
							<p class="nama-produk"></p>
							<p class="asal-produk"></p>
						</a>
					</div>
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/" alt=""/>
							<p class="nama-produk"></p>
							<p class="asal-produk"></p>
						</a>
					</div>
					<div class="kolom-4 product">
						<a href="">
							<img class="gambar" src="res/img/product/" alt=""/>
							<p class="nama-produk"></p>
							<p class="asal-produk"></p>
						</a>
					</div>		
				</div>
			</div>
		</div>
	</div>
	
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>
	<script src="popup.js"></script> 
	<script src="Ajaxlogin.js"></script> 
	<script>
	function forLogin(){
		if (AJAXPost()!=' 100 '){
			var username = AJAXPost();
			document.getElementById('sbmtlogin').value="Login\nLogin Sukses";
			var newhtml =		'<h3>Welcome, <span class="user-name"><a href="edit-profile.php" id="member">'+username+'</a></span>!</h3><p id="user-control"><span class="edit-logout">	<a href="logout.php" id="logout2">Logout</a></span></p>';
			document.getElementById("logreg").innerHTML=newhtml;
	
		}else{
			document.getElementById('sbmtlogin').value="Login\nusername/password salah";
		}
	}
	</script>	
	
</body>
</html>