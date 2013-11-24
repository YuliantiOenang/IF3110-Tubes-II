<link rel="stylesheet" href="css/header.css" type="text/css"/>
<header id="banner" class="body">
	<span>
		<center>
			<a href="index.jsp"><img src="images/logo.png" alt="Logo" width="250" height="250"/></a>
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
				</ul>
			</li>
			<!--div id="log"></div-->
			<li><a href="#login_form">Log In</a></li>
			<li><a href="registerform.jsp">Daftar</a></li>
			<li><a href="#">Shopping Bag</a></li>
			<div id="searchbar">
				<li><input type="text" name="search" id="cari" placeholder="Cari Barang">
					<ul class="suggestion" id="cariyu">	
					</ul>
				</li>
				<li><button type="button" class="button">Search</button></li>
			</div>
		</ul>
	</nav>
	<%@include file="loginform.jsp" %>
</header>