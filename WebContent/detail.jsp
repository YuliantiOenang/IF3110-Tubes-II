<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="kelas.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detail Barang</title>
</head>
<body>
	<div class="page_container">
		<%@ include file="template/template.jsp" %>
		<link rel="stylesheet" href="css/details.css" type="text/css"> 
		<br/><br/><br/>
		<% 
			Barang b = (Barang) request.getAttribute("barang");
		%>
		<div class = "goodsimagedata"> 
			<div class = "goodsimage">
				<img class="gambardetail" width=470px src='res/<%= b.getGambar() %>'> <br/>
			</div>
			<div class = "data">
				<div id="dataname"><%= b.getNama() %></div><br/>
				<div id="description"><%= b.getDesc() %></div><br/>
				<form novalidate> Permintaan Khusus : <br/> 
					<textarea id="textinput" class="textinput" type="text" name="tambahan"></textarea>
				</form>
					<div id='numinput'>
					Quantity : 
					<input id="jumlah" value =0 type="number" name="quantity"></div> 
					<div id='cart'><img onclick="addToCart2(document.getElementById('jumlah').value, '<?php echo $_GET['gid']; ?>', document.getElementById('textinput').value)" src="res/addtocart.png" /></div>
			</div>
		</div>
	</div>
</body>
</html>