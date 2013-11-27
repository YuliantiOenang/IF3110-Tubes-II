<%@ include file="header.jsp" %>
		<script>
			if (localStorage.user!="admin") {
				window.location = "index.jsp"
			}
			
			function AJAXubahgambarBarang() {
				
						var nama=document.forms["ubahgambar"]["nama"].value;
						
						
						var xmlhttp;
						if (window.XMLHttpRequest)
							{// code for IE7+, Firefox, Chrome, Opera, Safari
							xmlhttp=new XMLHttpRequest();
						}
						else
							{// code for IE6, IE5
							xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
						}
						xmlhttp.open("POST","AJAXubahgambar.jsp",false);
						xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
						xmlhttp.send("nama="+nama);
						if (xmlhttp.responseText.trim()=="true") {
						
							
								window.location = "uploaderadmin.jsp?nama=" + nama;
							
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
		<h2>Ubah Gambar Barang</h2>
		<form name="ubahgambar">
			Nama Barang: <br><input type="text" name="nama" size="40"><br>
			
			
		
			<button id="submit" type="button" onclick="AJAXubahgambarBarang()">Upload Gambar</button>
		</form>
		</div>
		</div>
	</body>
</html>