<?php
include "config/connect.php";
	$q=$_GET["q"];
	$count=0;
	$cek=array();
	$mysql=mysql_query("select nama from peralatan");
	while($baris=mysql_fetch_array($mysql))
	{
		$cek[''.$count]=$baris[0];
		$count++;
	}
	
	if($mysql){
		$hint="";
		for($i=0; $i<count($cek); $i++){
			if (strtolower($q)==strtolower(substr($cek[$i],0,strlen($q)))){
				$hint=$cek[$i];
				break;
			}
		}
		echo $hint;
	}else{
		echo "Database ampas";
	}
?>