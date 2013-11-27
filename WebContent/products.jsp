<?php
	include("functions.php");
	include("header.php");
	
	if(isset($_REQUEST['command']) && isset($_REQUEST['productid'])) {
		if($_REQUEST['command']=='add' && $_REQUEST['productid']>0){
			$pid=$_REQUEST['productid'];
			addtocart($pid);
			header("location:shoppingcart.php");
			exit();
		}
	}

	include("connect-mysql.php");
?>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script language="javascript">
	function addtocart(pid){
		document.form1.productid.value=pid;
		document.form1.command.value='add';
		document.form1.submit();
	}
</script>
</head>

<body>
	<form name="form1">
		<input type="hidden" name="productid" />
    	<input type="hidden" name="command" />
	</form>
	<div id = "content"> <div id = "mainContent">
		<section id = "products">
			<h2>Products</h2>
			<?php
				$result = mysql_query("SELECT * FROM product WHERE category = " .$_GET['category']);

				while($row = mysql_fetch_array($result)) { ?>
					<img src="<?php echo $row['picture']?>" />
					<h3> 
						<?php echo '<a href=detail_product.php?product_id='.$row['id'].'>'; ?>
						<?php echo $row['name']; ?>
						<?php echo '</a>'; ?>
					 </h3>
					Price: $<?php echo $row['price']?>
					<form>
						<input type="button" value="Add to Cart" onclick="addtocart(<?php echo $row['id'];?>)" />
					</form>
        		<?php } ?>
		</section>
	</div> </div>
</body>

</html>
