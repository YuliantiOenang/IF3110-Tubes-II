<?php
  include "config/connect.php";
  if($_GET['jumlah'] == 0)
  {
  ?>
				<script type="text/javascript">
							window.alert("Tidak ada barang yang di beli");
							window.location="pembayaran.php";
				</script>
	<?php
  }
  
  $cekCreditCard= mysql_query("select card_number from customer where no_customer='".$_COOKIE['IdCustomer']."'");
	  while($cardNum=mysql_fetch_row($cekCreditCard))
	  {
		$haveCard=$cardNum[0];
	  }
	if($haveCard=='')
	{
		?>
				<script type="text/javascript">
							window.alert("Maaf Anda belum mendaftarkan kartu kredit anda");
							window.location="registrasi_kartu.php?status=payment";
				</script>
		<?php
	}
	
  
  $bool=true;
			$mysql1=mysql_query("select id_alat from keranjang where id_customer='".$_COOKIE['IdCustomer']."'");
			while($baris=mysql_fetch_row($mysql1))
			{
				$mysql=mysql_query("select jumlah from peralatan where no_alat='".$baris[0]."'");
				while($baris1=mysql_fetch_row($mysql))
				{	
					if($baris1[0]<$baris[0])
					{
						$bool=false;
					}
					
				}
			}
			$boolChek=true;
			if($bool)
			{
			$mysql1=mysql_query("select id_alat,pesan,jumlah from keranjang where id_customer='".$_COOKIE['IdCustomer']."'");
			while($baris=mysql_fetch_row($mysql1))
			{
				$mysql=mysql_query("select jumlah from peralatan where no_alat='".$baris[0]."'");
				while($baris1=mysql_fetch_row($mysql))
				{	
					if($baris1[0]<$baris[2])
					{
						$bool=false;
					}
					$mysql3=mysql_query("INSERT INTO `terbayar`(`id_barang`, `jumlah`, `id_costumer`,`pesan`) VALUES ('".$baris[0]."','".$baris[2]."','".$_COOKIE['IdCustomer']."','".$baris[1]."')")  or die(mysql_error());
					$newCount=$baris1[0]-$baris[2];
					$mysql4=mysql_query("UPDATE `peralatan` SET `jumlah`=".$newCount." WHERE no_alat='".$baris[0]."'");
					$mysql5=mysql_query("DELETE FROM `keranjang` WHERE id_customer='".$_COOKIE['IdCustomer']."'");
					if(!$mysql3 || !$mysql4 || !$mysql5)
					{
						$boolChek=false;
					}
					
				}
			}
			if($boolChek)
			{
			?>
				<script type="text/javascript">
							window.alert("Berhasil Membeli");
							window.location="index.php";
				</script>
			<?php
			}
			else
			{
				?>
				<script type="text/javascript">
							window.alert("Gagal membeli, terdapat kesalahan dalam akses database");
							window.location="index.php";
				</script>
			<?php
			}
			}
			else
			{
				?>
				<script type="text/javascript">
							window.alert("Gagal Membeli, benda kurang");
							window.location="index.php";
				</script>
			<?php
			}
			
         
     
?>