<?php
	if (isset($_POST['id'])) {
		$query = 'select * from barang where id_barang=?';
		$params = array($_POST['id']);
		include 'query.php';
		if (count($result)>0){
			if($result[0]['tersedia']>0){
				session_start();
				if (isset($_SESSION['cart'])){
					array_push($_SESSION['cart'], $_POST['id']);
				}
				else {
					$shoppingBag = array($_POST['id']);
					$_SESSION['cart'] = $shoppingBag;
				}
				echo json_encode(array('status'=>'success'));
			}
			else{
				echo json_encode(array('status'=>'failed'));
			}
		
		}
		else {
			echo json_encode(array('status'=>'failed'));
		}
	}
?>