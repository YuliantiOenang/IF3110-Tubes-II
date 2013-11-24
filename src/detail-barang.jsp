<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>Detail Product</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
	<script language="javascript" type="text/javascript">
	function AddToCart(IdBarang,Kategori){
		var xmlhttp;
		if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function(){
			if (xmlhttp.readyState==4 && xmlhttp.status==200){
				alert("Pesanan sedang diproses");
				if (xmlhttp.responseText.trim()=="Betul"){
					alert("Pesanan Diterima");}
				else{
					alert("Jumlah Barang : "+xmlhttp.responseText);}
			}
		}
		var JumlahStr=""+IdBarang;
		var Jumlah=document.getElementById(JumlahStr).value;
		alert("AddToCart.php?action=add&id="+IdBarang+"&Jumlah="+Jumlah+"&Kategori="+Kategori);
		xmlhttp.open("GET","AddToCart.php?action=add&id="+IdBarang+"&Jumlah="+Jumlah+"&Kategori="+Kategori,true);
		xmlhttp.send();
	}
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
								<textarea name="detail" class="kolom-10 buy-text" rows="4" onfocus="checkclear(this)" onblur="checkempty(this, 'Detail pesanan jika ada')">Detail pesanan jika ada</textarea>
								<input class="kolom-9 buy-box" type="text" id='<%=session.getAttribute("idb")%>' name="buy" value="Banyaknya barang.." onfocus="checkclear(this)" onblur="checkempty(this, 'Banyaknya barang..')"> 
								<button class="kolom-1 buy-button" type="button" onClick=AddToCart(<%=session.getAttribute("idb")%>,'<%=session.getAttribute("kategorib")%>')></button>
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