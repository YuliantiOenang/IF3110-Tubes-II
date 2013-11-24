<%
	int jumlahsnack = 0;
	if (session.getAttribute("jumlahsnack")!=null){
	}else{
		response.sendRedirect("getsnack");
	}
	
%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>Snack</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
	<script language="javascript" type="text/javascript">
	function AddToCart(IdBarang){
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
		alert("AddToCart.php?action=add&id="+IdBarang+"&Jumlah="+Jumlah+"&Kategori=Snack");
		xmlhttp.open("GET","AddToCart.php?action=add&id="+IdBarang+"&Jumlah="+Jumlah+"&Kategori=Snack",true);
		xmlhttp.send();
	}
	</script>
</head>
<body>
	
	<div id="container">
		
		<jsp:include page="header.jsp"/>
		
		<!-- Navbar Section -->
		<p id="bbuy-a"> Products in "Snack" Category</p>
		<form method=post action="getsnack">
			<select name="sort">
				<option value = "urutkan">--urutkan--</option>
				<option value = "namabarang">nama</option>
				<option value = "harga">harga</option>
			</select>
			<input type=submit value="OK">
		</form>

		<!-- End of Navbar -->
		
		<div id="dagangan">
			
			<!-- Dagangan Baris 1 -->
			<div class="frame">
			
			<%String str ="";
			int test = (Integer)session.getAttribute("jumlahsnack");
			if (test>Integer.parseInt(request.getParameter("l"))){
				test = Integer.parseInt(request.getParameter("l"));
			}
			for (int i =Integer.parseInt(request.getParameter("f"));i<=test;i++){ %>
				<div class="kolom-6 product">					
					<div class="frame">
						<div class="kolom-6">
							<img class="gambar" src="res/img/product/<%str =(String)session.getAttribute("snnama"+i);out.print(str);%>.jpg" alt=""/>
						</div>
						<div class="kolom-6">
							<p class="nama-produk-b"><a href="getbarang?namabarang=<%=(String)session.getAttribute("snnama"+i)%>"><%str =(String)session.getAttribute("snnama"+i);out.print(str);%></a></p>
							<p class="harga">Harga: <% int intr =(Integer)session.getAttribute("snharga"+i);out.print(intr);%> /kg</p>
							
							<div class="frame buy-bar">
								<input class="kolom-9 buy-box" type="text" id='<%str =(String)session.getAttribute("snnama"+i);out.print(str);%>' name="buy" value="Banyaknya barang.." onfocus="checkclear(this)" onblur="checkempty(this, 'Banyaknya barang..')"> 
								<!--<button class="kolom-1 buy-button" type="button" onClick=AddToCart(<//%str =(String)session.getAttribute("did"+i);out.print(str);%>)></button>-->
							</div>
							
						</div>
					</div>
				</div>
			<%}%> 	
			</div>
			<!--End of Dagangan-->				
		</div>
		
		<div id="pagination">
			<ul>
				<%String n = ""+(Integer.parseInt(request.getParameter("f")));
				  String m = ""+(Integer.parseInt(request.getParameter("l")));
				  String o = ""+(Integer.parseInt(request.getParameter("f")));
				  String p = ""+(Integer.parseInt(request.getParameter("l")));
				  if (Integer.parseInt(request.getParameter("f"))>10){
					  o = ""+(Integer.parseInt(request.getParameter("f"))-10);
					  p = ""+(Integer.parseInt(request.getParameter("l"))-10);
				   %>
					   
				 <% }
				 if (Integer.parseInt(request.getParameter("l"))<(Integer)session.getAttribute("jumlahsnack")){
					   n = ""+(Integer.parseInt(request.getParameter("f"))+10);
					   m = ""+(Integer.parseInt(request.getParameter("l"))+10);
				  %>
				  	
				 <% }%>
				 <li><a href="Snack.jsp?f=<%out.print(o);%>&l=<%out.print(p);%>">&laquo;Previous</a></li>
				 <li><a href="Snack.jsp?f=<%out.print(n);%>&l=<%out.print(m);%>">Next&raquo;</a></li>
				
				
			
			</ul>
		</div>
		
	</div>
	
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>
	
</body>
</html>