<%@page import="bean.Barang"%>
<%@page import="bean.Transaksi"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="header.jsp" />

<h3>Your Shopping Cart</h3>
<!-- <form name="shopping_cart" action="edit_shopcart.php" method="post"> -->
<%
	// 	ArrayList<Transaksi> shopList;
	// 	Barang B = new Barang("101", "Tahu Sumedang", "./images/Tahu.png",
	// 			1000, 1, 10, "tahu dari sumedang. wuenak", 10);
	// 	Transaksi trans = new Transaksi(B, 2,
	// 			"Dibungkus yaah, pake daun pisang kalo bisa");
	// 	shopList = new ArrayList<Transaksi>();
	// 	shopList.add(trans);

	if (session.getAttribute("username") != null) {
		ArrayList<Transaksi> shopList;
		if (session.getAttribute("shopping_cart") != null) {
			shopList = (ArrayList<Transaksi>) session
					.getAttribute("shopping_cart");
		} else {
			shopList = new ArrayList<Transaksi>();
			out.print("<h4><b>Maaf, Keranjang Anda Masih Kosong</b></h4>");
		}

		for (int i = 0; i < shopList.size(); i++) {
			out.print("<h4><b>" + (i + 1) + ". "
					+ shopList.get(i).getBarang().getNama_barang()
					+ "</b></h4>");
			out.print("<p>Quantity : " + shopList.get(i).getQuantity()
					+ "</p>");
			out.print("<p>Request Tambahan = "
					+ shopList.get(i).getReqTambahan() + "</p>");
			out.print("<p>Total Harga .................. "
					+ (shopList.get(i).getBarang().getHarga_barang() * shopList
							.get(i).getQuantity()) + "</p><br></br>");

		}
	} else {
		System.out.println("Belum LOGIN WOII!!!");
		response.sendRedirect("/ruko/");
	}
%>

<jsp:include page="footer.jsp" />
<!-- 
<?php
	include 'connect.php';
	include 'header.php';
	if(isset($_SESSION['shopping_cart'])&& isset($_SESSION['shopping_request'])){
		$shopList = $_SESSION['shopping_cart'];
		$shopRequest = $_SESSION['shopping_request'];	
	}
	else{
		$shopList = array();
		$shopRequest = array();
	}
	$totalharga = 0;
?>	
	<h3> Your Shopping Cart </h3>
	<form name="shopping_cart" action="edit_shopcart.php" method="post">
	<?php
		foreach($shopList as $i => $value){
		$shopcart_query = "SELECT * FROM `progin_13511059`.barang WHERE id_barang='".$i."'";
		$shopcart_result = mysql_query($shopcart_query,$con);
		if(!$shopcart_result){
			echo ' Unable to Access your Shopping Cart';
		}
		else{
			$shopcart_row = mysql_fetch_array($shopcart_result);
			echo $shopcart_row['nama_barang'], '	: <input type="text" name = "', $i, '" value="',$value, '">',$shopRequest[$i],'<br>';
			$totalharga+= $value * $shopcart_row['harga_barang'];
		}
		}
		echo '<input type="submit" id="edit" value="Edit!"><br><br>';
		echo '</form>';
		
		echo 'Total Pembelian Anda :<input type="text" id="totalharga" value="',$totalharga,'" readonly><br>
				Choose Your Credit Card :<br>';
		$credit_query = "SELECT * FROM `progin_13511059`.creditcard WHERE card_owner ='".$_SESSION['username']."'";
		$credit_result = mysql_query($credit_query,$con);
		if(!$credit_result){
			echo 'You do not have any credit card <a href="cardregist.php"> Register?</a>';
		}
		else{
			echo '<form name="beli_barang" action="beli.php" method="get">';
			while($credit_row = mysql_fetch_array($credit_result)){
				echo '<input type="radio" value="', $credit_row['card_id'],'" name="creditid">', $credit_row['card_id'],'<br>';
			}
			echo '
			<input type="submit" value="Beli!">
			<div id="barang_error"></div>
			</form>';
		}
	include 'footer.php';
?>

-->