<%@ include file="header.jsp" %>
		<script>
			if (localStorage.user!="admin") {
				window.location = "index.jsp"
			}
			
			function AJAXhapusBarang() {
				alert("Anda akan menghapus barang bernama " + document.forms["hapus"]["nama"].value);
						var nama=document.forms["hapus"]["nama"].value;
						
						var xmlhttp;
						if (window.XMLHttpRequest)
							{// code for IE7+, Firefox, Chrome, Opera, Safari
							xmlhttp=new XMLHttpRequest();
						}
						else
							{// code for IE6, IE5
							xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
						}
						xmlhttp.open("POST","AJAXhapus.jsp",false);
						xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
						xmlhttp.send("nama="+nama);
						if (xmlhttp.responseText.trim()=="true") {
						alert("Data Berhasil Dihapus");
							
								window.location = "indexadmin.jsp";
							
						}
						else {
							alert("Tidak ada barang bernama " + document.forms["hapus"]["nama"].value);
							
						}
			}
		</script>
		<link rel="stylesheet" href="layout.css">
	</head>
	<%@ include file="middleadmin.jsp" %>
		<div id="container-left">
		<div id="container">
		<h2>Hapus Barang</h2>
		<form name="hapus">
			Nama Barang: <input type="text" name="nama" size="40"><br>
		
			<button id="submit" type="button" onclick="AJAXhapusBarang()">Hapus</button>
		</form>
		</div>
		</div>
	</body>
</html>