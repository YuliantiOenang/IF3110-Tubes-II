
<?php
  include "config/connect.php";
			$hasil=mysql_query("select jumlah from peralatan where no_alat='".$_GET['id']."'")  or die(mysql_error());
			while($baris=mysql_fetch_row($hasil))
			{
				$jumlah=$baris[0];
			}
			
			if($jumlah<$_GET['jumlah'])
			{
				echo $jumlah;
			}
			else
			{
				$mysql=mysql_query("UPDATE `keranjang` SET `jumlah`='".$_GET['jumlah']."' WHERE id_customer='".$_COOKIE['IdCustomer']."'")  or die(mysql_error());
				if($mysql)
				{
				
				
				}
				
				
				
			}
			
     
?>

