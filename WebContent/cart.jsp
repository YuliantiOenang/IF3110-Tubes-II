<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="layout.jsp" />
	<div id='content_frame' name='page'>
<!--  		<h1 class='header'>Shopping Cart</h1>-->
		<div class='orderdata'>
			<div class="wrapV_m">
				<div class='orderdetail'><h4>Order details</h4></div>
			<div id="contentV_m">
				<div>
					<div class='row'>
						<div class='list_head' id='no'><h6>No</h6></div>
						<div class='list_head' id='item'><h6>Item</h6></div>
						<div class='list_head' id='price'><h6>Price</h6></div>
						<div class='list_head' id='qty'><h6>Qty.</h6></div>
						<div class='list_head' id='subtotal'><h6>Sub Total</h6></div>
						<div class='list_head' id='remove'><h6>X</h6></div>
					</div>
				<!-- 	<?php
					$total = 0;
					$ind = 1;
					if (isset($_SESSION["dibeli"])){
						$array = $_SESSION["dibeli"];
						$kategori = new Kategori();
						$ind = 1;
						$total = 0;
						foreach ($array as $item) {
							if ((isset($_SESSION[$item])) && ($_SESSION[$item] > 0)){
								$data = new Barang();
								$brg = $data->cari('nama=:n',array(':n'=>$item));
								echo "
								<div class='row'>
									<div class='list_body' id='no'><p>".$ind.".</p></div>
									<div class='list_body' id='item'><p><b>".$kategori->cari('id=:_id',array('_id'=>$brg->id_kategori))->nama_kategori." :</b><br/> &nbsp &nbsp &nbsp".$item."</p></div>
									<div class='list_body' id='price'><p>IDR ".$this->toCurrency($brg->harga)."</p></div>
									<div class='list_body' id='qty'><input id='quantity_".$brg->nama."' type='number' onkeyup='cekCart(\"".$brg->nama."\", ".$_SESSION[$item].")' value='".$_SESSION[$item]."'></input></div>
									<input type='hidden' id='id_barang_".$brg->nama."' value='".$brg->nama."'>
									<div class='list_body' id='subtotal'><p>IDR ".$this->toCurrency($brg->harga*$_SESSION[$item])."</p></div>
									<div class='list_body' id='remove'><a href='".$this->makeUrl("barang/delete/".$brg->id)."' title='Remove ".$item." from your Shopping Cart'>x</a></div>
								</div>
								";
								$total += $brg->harga*$_SESSION[$item];
								$ind++;
							}
						}
						} 
						$_SESSION['total_shopping'] = $total;
						?>			
						 -->
						<div class='row'>
							<div class='list_foot' id='totallabel'><h6>TOTAL</h6></div>
							<div class='list_foot' id='total'><p>IDR <?php echo $this->toCurrency($total) ?></p></div>
						</div>
					<h2>Free delivery cost. :)</h2>
				</div>
			</div></div>
			<div class='formcontainer'>
				<div class='buyerdetail'><h4>Term and Condition</h4>
				<ul>
					<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus neque nisl, aliquam ac mi ut, imperdiet consequat odio. Mauris suscipit laoreet dignissim.</li>
					<li>Urabitur convallis varius lectus, vitae congue mauris adipiscing eu. Vivamus id ultrices mi. Aenean eget erat id massa fringilla gravida.</li>
					<li>Aenean eu augue aliquet, congue nisl vitae, mattis quam. Quisque eu urna cursus, semper turpis in, ultricies est.</li>
					<li>Proin ullamcorper vehicula dolor, volutpat euismod leo cursus varius.</li>
					<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus neque nisl, aliquam ac mi ut, imperdiet consequat odio. Mauris suscipit laoreet dignissim.</li>
					<li>Urabitur convallis varius lectus, vitae congue mauris adipiscing eu. Vivamus id ultrices mi. Aenean eget erat id massa fringilla gravida.</li>
					
				</ul>
				<a href='<?php echo $this->getBaseUrl() ?>/profile/credit?redirect=shop/payment'><input type="btn"  name="submit" value="Process to payment" class="button"></a>
				<a href='<?php echo $this->getBaseUrl() ?>/kategori'><input type="btn" name="submit" value="Add Item" class="button"></a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />

</body>
</html>