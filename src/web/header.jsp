<%-- 
    Document   : header
    Created on : Nov 26, 2013, 4:27:23 PM
    Author     : A46CB
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>${param.pageTitle}</title>
        <link rel="stylesheet" href="assets/css/style.css" type="text/css" />
	<link rel="shortcut icon" href="favicon.ico" />
	<script type="text/javascript" src="json2.js"></script>
	<script type="text/javascript" src="xhr.js"></script>
	<script type="text/javascript" src="validate.js"></script>
</head>
<body>
	<div class="header">
		<div class="wrapper">
			<div class="top-header">
				<h1 class="branding-title"><a href="./">Shirts 4 Mike</a></h1>
				<div class="top-right">
                                    <a href="javascript:void(0)" onclick="login()" class="menutop"> Login </a> <br />
				</div>
			</div>
			<ul class="cat">
				<li class="menu">Kategori</li>
				<li class="menucat"><a href="products.php?category=snack">Snack</a></li>
				<li class="menucat"><a href="products.php?category=minuman">Minuman</a></li>
				<li class="menucat"><a href="products.php?category=makanan">Makanan</a></li>
				<li class="menucat"><a href="products.php?category=properti">Properti</a></li>
				<li class="menucat"><a href="products.php?category=buah">Buah</a></li>
			</ul>
		</div>
	</div>

	<div id="content">