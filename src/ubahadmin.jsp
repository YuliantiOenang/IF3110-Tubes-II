<%@ include file="header.jsp" %>
		<script>
			if (localStorage.user!="admin") {
				window.location = "index.jsp"
			}
			
		
		</script>
		<link rel="stylesheet" href="layout.css">
	</head>
	<%@ include file="middleadmin.jsp" %>
		<div id="container-left">
		<div id="container">
		<h2>Ubah Informasi Barang</h2>
		<form name="hapus">
			<a href="ubahNamaadmin.jsp"><button type="button">Ubah Nama</button></a>
			<a href="ubahGambaradmin.jsp"><button type="button">Ubah Gambar</button></a>
			<a href="ubahhargaadmin.jsp"><button type="button">Ubah Harga</button></a>
			
		</form>
		</div>
		</div>
	</body>
</html>