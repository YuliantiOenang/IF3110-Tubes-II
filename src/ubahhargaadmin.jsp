<%@ include file="header.jsp" %>
		<script>
			if (localStorage.user!="admin") {
				window.location = "index.jsp"
			}
			
			function AJAXubahhargaBarang() {
				
						var nama=document.forms["ubahharga"]["nama"].value;
						var harganew=document.forms["ubahharga"]["harganew"].value;
						
						var xmlhttp;
						if (window.XMLHttpRequest)
							{// code for IE7+, Firefox, Chrome, Opera, Safari
							xmlhttp=new XMLHttpRequest();
						}
						else
							{// code for IE6, IE5
							xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
						}
						xmlhttp.open("POST","AJAXubahharga.jsp",false);
						xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
						xmlhttp.send("nama="+nama+"&harganew="+harganew);
						if (xmlhttp.responseText.trim()=="true") {
						alert("Harga Berhasil Diubah");
							
								window.location = "indexadmin.jsp";
							
						}
						else {
							alert("Terjadi kesalahan, silakan mencoba lagi");
							
						}
			}
		</script>
	<link rel="stylesheet" href="layout.css">
	</head>
	<%@ include file="middleadmin.jsp" %>
		<div id="container-left">
		<div id="container">
		<h2>Ubah Harga Barang</h2>
		<form name="ubahharga">
			Nama Barang: <br><input type="text" name="nama" size="40"><br>
			Harga Baru Barang: <br><input type="text" name="harganew" size="40"><br>
			
		
			<button id="submit" type="button" onclick="AJAXubahhargaBarang()">Ubah</button>
		</form>
		</div>
		</div>
	</body>
</html>