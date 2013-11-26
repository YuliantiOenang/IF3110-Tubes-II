	<head>
		<link rel="stylesheet" type="text/css" href="header.css">
	</head>
	<body>
		<!--Header's body-->
		<div id="title">
		<div id="icon">
			<a href="index.jsp"><img src="logo.jpg" alt="RuSerBa" width="160" height="160"></a>
		</div>
		<div id="name-title">
			Ruko Serba Ada Habibi
		</div>
		<div id="head-right">
		<form id="search" action="search.jsp" method="get">
			Nama : <input type="search" name="keyword"><br>
			Kategori : <select name="kategori">
				<option value="beras" selected>Beras</option>
				<option value="daging">Daging</option>
				<option value="ikan">Ikan</option>
				<option value="sayur">Sayur</option>
				<option value="buah">Buah</option>
			</select><br>
			Harga : <select name="range">
				<option value="<10000" selected>< 10000</option>
				<option value="10000-50000">10000 - 50000</option>
				<option value=">50000">> 50000</option>
			</select><br>
			<input type="submit" value="Search"><br><br>
		</form>
		<div id="account">
			<script>
				renderAccount();
			</script>
		</div>
		</div>
		</div>
		<div id="navcontainer">
		<ul id="kategori">
			<li><a href="product.jsp?kategori=beras&sort=namaasc">Beras</a>
			<li><a href="product.jsp?kategori=daging&sort=namaasc">Daging</a>
			<li><a href="product.jsp?kategori=ikan&sort=namaasc">Ikan</a>
			<li><a href="product.jsp?kategori=sayur&sort=namaasc">Sayur</a>
			<li><a href="product.jsp?kategori=buah&sort=namaasc">Buah</a>
		</ul>
		</div>