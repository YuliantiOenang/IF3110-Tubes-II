<jsp:include page="header.jsp" />

<div id="content" class="float_l">
	<h2>Tambah Barang</h2>
		<form name="edit" action="tambahbarang" method="post">
			Nama Barang : <input type="text" name="nama_barang"><br><br>
			Harga Barang : <input type="text" name="harga_barang"><br><br>
			Kategori Barang : <br>
			<select name="kategori">
				<option value="1">Pangan</option>
				<option value="2">Pakaian</option>
				<option value="3">Elektronik</option>
				<option value="4">Rumah Tangga</option>
				<option value="5">Olah Raga</option>
			</select><br><br>
			Keterangan : <br><textarea rows="4" cols="50"  name="request_tambahan" form="usrform"></textarea><br><br>
			Stok : <input type="text" name="stok"><br><br>
			Upload Gambar : <br>
			<form action="UploadServlet" method="post" enctype="multipart/form-data">
				<input type="file" name="file" size="50"> <br>
				<input type="submit" value="Upload File"> <br>
			</form>
			<input type="hidden" name="id_barang" value="1000"> 
			<input type="submit" id="subedit" value="Tambah">
		</form>
</div>


<jsp:include page="footer.jsp" />