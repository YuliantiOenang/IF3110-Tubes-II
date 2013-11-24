<link rel="stylesheet" href="css/header.css" type="text/css"/>
<header id="banner" class="body">
	<span>
		<center>
			<a title="HOME" href="index.jsp">
				<img src="images/logo.png" alt="Logo - link to home" width="250" height="250"/>
			</a>
		</center>
	</span>
	<nav>
		<ul id="menubar">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="#">Kategori Barang</a>
				<ul class="sub-menu">	
					<li><a href="#">Kategori Dummy 1</a></li>
					<li><a href="#">Kategori Dummy 2</a></li>
					<li><a href="#">Kategori Dummy 3</a></li>
					<li><a href="#">Kategori Dummy 4</a></li>
					<li><a href="#">Kategori Dummy 5</a></li>
				</ul>
			</li>
			<li><a href="#login_form">Log In</a></li>
			<%@include file="loginform.jsp" %>
			<li><a href="#">Daftar</a></li>
			<li><a href="#">Shopping Bag</a></li>
			<div id="searchbar">
				<li>
					<input type="text" name="search" id="cari" placeholder="Cari Barang" onkeyup="searchsuggest(cari.value)" onblur="resetsuggest()">
						<ul class="suggestion" id="cariyu"></ul>
					</input>
				</li>
				<li><button type="button" onclick="resetsearch();search(cari.value,1);">Search</button></li>
			</div>
		</ul>
	</nav>
</header>