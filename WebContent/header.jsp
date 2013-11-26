<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>RUko SERba imBA</title>
<link href="AJS_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/modal.css" rel="stylesheet" type="text/css" />

</head>

<body>
	<div id="AJS_body_wrapper">
		<div id="AJS_wrapper">
			<div id="AJS_header">
				<%
					if (session.getAttribute("username") == null) {
						out.print("<div id=\"site_title\"><h1><a href=\"/ruko/index\">Ruko Serba Ada</a></h1></div>");
					} else {
						out.print("<div id=\"site_title\"> <h1><a href=\"/ruko/index\">Welcome,  "
								+ session.getAttribute("username") + "</a></h1></div>");
					}
				%>
				<div id="header_right">
					<p></p>
				</div>
				<div class="cleaner"></div>
			</div>
			<!-- End Of Header -->

			<div id="AJS_menubar">
				<div id="top_nav" class="ddsmoothmenu">
					<ul>
						<%
							if (session.getAttribute("username") == null) {
								out.print("<li><a href='register.php'>Sign Up</a></li>");
								out.print("<li><a href='#login_form'>Log In</a></li>");
							} else {
								out.print("<li><a href=\"cardregist.php\"> Register Credit Card </a></li>");
								out.print("<li><a href=\"shoppingbag.jsp\"> Shopping Bag </a></li>");
								out.print("<li><a href=\"Profile?id="
										+ session.getAttribute("username")
										+ "\">Profile</a></li>");
								out.print("<li><a href=\"logout.jsp\">Log out</a></li>");
							}
						%>
					</ul>
					<br style="clear: left" />
				</div>
				<!-- end of ddsmoothmenu -->
			</div>
			<!-- END of AJS_menubar -->
			<!-- popup form #1 -->
			<a href="#x" class="overlay" id="login_form"></a>
			<div class="popup">
				<h2>Welcome Guest!</h2>
				<p>Please enter your login and password here</p>

				<form name="login" action="VerLoginServlet" method="post">
					Username : <input type="text" name="username"><br>
					Password : <input type="password" name="password"><br>
					<div id="err_login"></div> <br> <input type="submit"
					value="Log In" />
				</form>

				<a class="close" href="#close"></a>
			</div>

			<div id="AJS_main">
				<div id="sidebar" class="float_r">
					<div class="sidebar_box">
						<span class="bottom"></span>
						<h3>Search Option :</h3>
						<form name="search" action="search" method="get">
							<input type="hidden" name="page" value="1"> 
							<input type="hidden" name="order" value="nama_barang"> 
							<input type="text" name="nama_barang" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" /> 
							<input type="submit" value="Cari" alt="Search" id="searchbutton" title="Search" class="sub_btn" />
							<p>Kategori :</p>
							<select name="kategori">
									<option value="1">Pangan</option>
									<option value="2">Pakaian</option>
									<option value="3">Elektronik</option>
									<option value="4">Rumah Tangga</option>
									<option value="5">Olah Raga</option>
							</select><br>
									<p>Harga kurang dari :</p> 
									<input type="text" name="harga" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
						</form>

						<h3>Kategori</h3>
						<div class="content">
							<ul class="sidebar_list">
								<li><a href='kategori?id=1&page=1&order=nama_barang'>Pangan</a></li>
								<li><a href='kategori?id=2&page=1&order=nama_barang'>Pakaian</a></li>
								<li><a href='kategori?id=3&page=1&order=nama_barang'>Elektronik</a></li>
								<li><a href='kategori?id=4&page=1&order=nama_barang'>Rumah
										Tangga</a></li>
								<li><a href='kategori?id=5&page=1&order=nama_barang'>Olah
										Raga</a></li>
							</ul>
						</div>
					</div>
				</div>

				<script>
					function verLogin() {
						var username = document.forms['login']['username'].value;
						var password = document.forms['login']['password'].value;
						var err_login;
						var isLogin = false;
						if (window.XMLHttpRequest) {
							xmlhttp = new XMLHttpRequest();
						} else {
							xmlhttp = new AciveXObject("Microsoft.XMLHTTP");
						}
						xmlhttp.onreadystatechange = function() {
							if (xmlhttp.readyState == 4
									&& xmlhttp.status == 200) {
								err_login = xmlhttp.responseText;
								if (err_login == "") {
									//Handle SESSION & LOCAL STORAGE
								}
							}
						}
						xmlhttp.open("GET", "login.php?username=" + username
								+ "&password=" + password, true);
						xmlhttp.send();
					}
				</script>