<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>Shopping Bag</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
	</script>
</head>
<body>
		
	<jsp:include page="header.jsp"/>
		
	<jsp:useBean id="cart" scope="session" class="npackage.Cart" />
		
	<div id="dagangan">
		<div class="kolom-6">
		
			
			<c:forEach var="cartItem" items="${cart.getCartItems()}" varStatus="counter"> 
				
				<form name="item" method="post" action="CartController"> 
					<c:out value="${counter.count}"/>
					<br>Nama Barang	: <c:out value="${cartItem.getNama()}"/>
					<br>Harga Barang	: <c:out value="${cartItem.harga}"/>
					<br>Jumlah	: <input type='hidden' name='itemIndex' value=<c:out value='${counter.count}'/>>
					<input type='text' name="quantity" value='<c:out value="${cartItem.jumlah}"/>'>
					<input type="submit" name="action" value="Update">
					<input type="submit" name="action" value="Delete">
					<br>Kategori	: <c:out value="${cartItem.kategori}"/>
					<br>Jumlah Harga	: Rp <c:out value="${cartItem.jumHarga}"/>
				</form>
			</c:forEach> 
			<br><br>Total:	Rp <c:out value="${cart.hargaTotal}"/>
  
		</div>
	</div>
	
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>
	
</body>
</html>