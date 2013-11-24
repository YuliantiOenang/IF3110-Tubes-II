<script src='/ruserba/scripts/addtobag.js'></script>
<?php    
    //mencari banyak data yang ada dalam tabel  
	$query = 'select nama_kategori from kategori where id_kategori=?';
	$params = array($_GET['id']);
	include 'scripts/php/query.php';
	echo '<h3 class="judul_halaman">Kategori: ';
	echo $result[0]['nama_kategori'];
	echo '</h3>';
	echo '<br/>';
	$query = "select * from barang where id_kategori=?";
	$params = array($_GET['id']);
	include 'scripts/php/query.php';
	$banyakBarang = count($result);
	$page = isset($_GET['p']) ? $_GET['p'] : 1;  
	$limit = 10;  
	$mulai_dari = $limit * ($page - 1);  
	$query = "select * from barang where id_kategori=? order by nama_barang limit ?, ? ";  
	$params = array($_GET['id'], $mulai_dari, $limit);
	include 'scripts/php/query.php';
	foreach($result as $barang){
		echo '<div class="halaman_category_container">';
		echo '<div class="barang_container">';
		echo '<div class="barang">';
		echo '<a href="/ruserba/barang/'.$barang['id_barang'].'">';
		echo '<img src="/ruserba/assets/barang/'.$barang['gambar'].'" height="100%"/>';
		echo '</a>';
		echo '</div>';
		echo '<div class="barang">';
		echo '<span class="barang_nama">';
		echo '<a href="/ruserba/barang/'.$barang['id_barang'].'">';
		echo $barang['nama_barang'];
		echo '</a>';
		echo '</span>';
		echo '<br>';
		if($barang['tersedia']==0){
			echo '<span class="barang_tersedia">';
			echo 'Barang tidak tersedia';
			echo '</span>';
			echo '<br>';
		}
		else{
			echo '<span class="barang_tersedia">';
			echo 'Barang tersedia ('.$barang['tersedia'].' 	unit)';
			echo '</span>';
			echo '<br>';
		}
		echo '<span class="barang_harga">';
		echo 'Rp '.$barang['harga_barang'].',00';
		echo '</span>';
		echo '<br>';
		echo '</div>';
		echo '<a class="button beli" name="'.$barang['id_barang'].'" href="javascript:void(0)"><div>Pesan Barang</div></a>';
		echo '</div>';
		echo '</div>';
		echo '<hr>';
	}   
	//membuat pagination
	$banyakHalaman = ceil($banyakBarang / $limit);  
	if ($banyakHalaman > 1) {
		echo '<div class="paginasi">';
		echo 'Halaman: ';
		for($i = 1; $i <= $banyakHalaman; $i++){  
			if($page != $i){  
				echo '<a href="/ruserba/kategori/'.$_GET['id'].'/'.$i.'">['.$i.']</a> ';  
			}
			else {  
				echo "[$i] ";  
			}  
		}
		echo '</div>';
	}
?>  