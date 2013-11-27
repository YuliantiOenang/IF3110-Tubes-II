<%@include file="header.jsp"%>

<body>

<div style="float: left; width: 70%;">
<ul>
		<h1> &nbsp; &nbsp; Barang Terlaris</h1>
		<div id="divterlaris1">
		<form id="formterlaris1">
		
		<b>1. Kategori Beras <b><br><br>
		<?php
			while($row = mysql_fetch_array($hasilBeras)){ ?>
		
				&nbsp; &nbsp; <span> &nbsp; &nbsp; 
				<?php
				$id=$row['productid'];
				$result=mysql_query("select * from barang where id=$id") or die("select path"."<br/><br/>".mysql_error());
				while($row2 = mysql_fetch_array($result))
					echo '<a href="detailProduct.php?id=',$row['productid'],'">
					<img src= "'.$row2['path'].'" width="200" height="200" /></a>';
		?>
				<a href="detailProduct.php?id=<?php echo $row['productid'] ?>"></a>
				</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		<?php
			}
			
		?>
		</form>
		</div>
		
		
		
		
		<div id="divterlaris2">
		<form id="formterlaris2">
		<br><b>2. Kategori Roti<b><br>
		<?php
			while($row = mysql_fetch_array($hasilRoti)){ ?>
		
				&nbsp; &nbsp; <span> &nbsp; &nbsp; 
				<?php
				$id=$row['productid'];
				$result=mysql_query("select * from barang where id=$id") or die("select path"."<br/><br/>".mysql_error());
				while($row2 = mysql_fetch_array($result))
					echo '<a href="detailProduct.php?id=',$row['productid'],'">
					<img src= "'.$row2['path'].'" width="200" height="200" /></a>';
		?>
				
				</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		<?php
			}
			
		?>
		</form>
		</div>
		
		
		
		<div id="divterlaris1">
		<form id="formterlaris1">
		<br><b>3. Kategori Daging Segar<b><br><br>
		<?php
			while($row = mysql_fetch_array($hasilDS)){ ?> &nbsp; &nbsp; <span> &nbsp; &nbsp;  <?php
				$id=$row['productid'];
				$result=mysql_query("select * from barang where id=$id") or die("select path"."<br/><br/>".mysql_error());
				while($row2 = mysql_fetch_array($result))
					echo '<a href="detailProduct.php?id=',$row['productid'],'">
					<img src= "'.$row2['path'].'" width="200" height="200" /></a>';
		?>
				</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		<?php
			}
		?>
		
		</form>
		</div>
		
		
		<div id="divterlaris2">
		<form id="formterlaris2">
		<br><b>4. Kategori Daging Olahan<b><br><br>
		<?php
			while($row = mysql_fetch_array($hasilDO)){ ?> &nbsp; &nbsp; <span> &nbsp; &nbsp;  <?php
				$id=$row['productid'];
				$result=mysql_query("select * from barang where id=$id") or die("select path"."<br/><br/>".mysql_error());
				while($row2 = mysql_fetch_array($result))
					echo '<a href="detailProduct.php?id=',$row['productid'],'">
					<img src= "'.$row2['path'].'" width="200" height="200" /></a>';
		?>
				</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		<?php
			}
		?>
		</form>
		</div>
		
		<div id="divterlaris1">
		<form id="formterlaris1">
		<br><b>5. Kategori Buah<b><br><br>
		<?php
			while($row = mysql_fetch_array($hasilBuah)){  ?> &nbsp; &nbsp; <span> &nbsp; &nbsp;  <?php
				$id=$row['productid'];
				$result=mysql_query("select * from barang where id=$id") or die("select path"."<br/><br/>".mysql_error());
				while($row2 = mysql_fetch_array($result))
					echo '<a href="detailProduct.php?id=',$row['productid'],'">
					<img src= "'.$row2['path'].'" width="200" height="200" /></a>';
		?>
				</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		<?php
			}
		?>
		</form>
		</div>
		
		<div id="divterlaris2">
		<form id="formterlaris2">
		<br><b>6. Kategori Sayur<br><br>
		<?php
			while($row = mysql_fetch_array($hasilSayur)){  ?> &nbsp; &nbsp; <span> &nbsp; &nbsp;  <?php
				$id=$row['productid'];
				$result=mysql_query("select * from barang where id=$id") or die("select path"."<br/><br/>".mysql_error());
				while($row2 = mysql_fetch_array($result))
					echo '<a href="detailProduct.php?id=',$row['productid'],'">
					<img src= "'.$row2['path'].'" width="200" height="200" /></a>';
		?>
				</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		<?php
			}
		?>
		</form>
		</div>
</ul>
</div>
<div>
<ul>
	<div id="divpetunjuk" style="float: left; width: 27%;">
	<form id="formpetunjuk">
	<br>Aturan Belanja: <br> 
	<br>1. Pengguna yang ingin berbelanja harus memiliki akun terlebih dahulu, jika sudah, pilih login dan jika belum pilih registrasi
	<br><br>2. Pengguna yang ingin berbelanja harus memasukkan informasi kartu kredit, jika tidak, transaksi tidak akan direalisasikan
	<br>HAPPY SHOPPING!
	</form>
	</div>
</ul>
</div>

	
</body>
</html>