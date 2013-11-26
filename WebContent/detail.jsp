<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class = "goodsimagedata"> 
		<div class = "goodsimage">
			<img width=475px src='../img/<?php echo $row['gambar'];?>'> <br/>
		</div>
		<div class = "data">
			<div id="dataname"><?php echo $row['nama_inventori'];?></div><br/>
			<div id="description"><?php echo $row['description'];?></div><br/>
			<form novalidate> Permintaan Khusus : <br/> 
				<textarea id="textinput" class="textinput" type="text" name="tambahan"></textarea>
			</form>
				<div id='numinput'>
				Quantity : 
				<input id="jumlah" value =0 type="number" name="quantity"></div> 
				<div id='cart'><img onclick="addToCart2(document.getElementById('jumlah').value, '<?php echo $_GET['gid']; ?>', document.getElementById('textinput').value)" src="../img/addtocart.png" /></div>
		</div>
	</div>
</body>
</html>