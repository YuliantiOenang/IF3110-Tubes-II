<link rel="stylesheet" href="css/header.css" type="text/css"/>
<header id="banner" class="body">
	<%@ page import="java.sql.*" %>
	<%
	String db_url = "jdbc:mysql://localhost/ruserba";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection = DriverManager.getConnection(db_url, "root", "");
	assert(connection != null);
	Statement statement = connection.createStatement();
	ResultSet categories = statement.executeQuery("SELECT DISTINCT kategori FROM barang");
	%>
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
					<% while (categories.next()) { %>
					<li><a href="halamanbarang.jsp?kategori='<%= categories.getObject("kategori") %>'">
					<%= categories.getObject("kategori") %></a></li>
					<% } connection.close();%>
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
				<li><button type="button" class="button" id="searchbutton">Search</button></li>
			</div>
		</ul>
	</nav>
	<%@include file="loginform.jsp" %>
</header>