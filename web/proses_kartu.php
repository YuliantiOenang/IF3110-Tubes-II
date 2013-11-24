<?php
	include "config/connect.php";
	
	$card_number = $_GET["card_number"];
	$card_name = $_GET["card_name"];
	$card_expired = $_GET["card_expired"];
	$return1 = array();
	
	$arrCardName = mysql_query("SELECT card_name FROM kartu_kredit WHERE card_name = '".$card_name."' and card_number='".$card_number."'");
	
	
	if(mysql_num_rows($arrCardName) >0){
	$mysql= mysql_query("UPDATE `customer` SET `card_number`='$card_number' WHERE no_customer='".$_COOKIE['IdCustomer']."'");	
		
		if($mysql)
		{
		$return1["status"] = true;
		}
		else
		{
		$return1["status"] = false;
		}
		echo json_encode($return1);
	}else{
		$return1["status"] = false;
		$return1["cek"] = $card_number;
		
		echo json_encode($return1);
	}
?>