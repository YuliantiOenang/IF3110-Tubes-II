<%-- 
    Document   : validasikredit
    Created on : 27-Nov-2013, 17:59:15
    Author     : Asus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Class.GetConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Validasi</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<script type="text/javascript" src="js/register.js"></script>
	</head>
	<body>
		<!--Header-->
		<div id="header">
            <%@ include file="header.jsp"%>
		</div>
		<!--Body-->
		<div id="task-page-body">
			<h1>Validasi Kartu Kredit:</h1>
			<div id="register">
				Nomor  :<br><br>
				Nama   :<br><br>
				Expired:<br><br>
			</div>
			<div id="registerkartu-form">
			<form  method="post" action="checkkreditvalid" enctype="multipart/form-data">
				<!--UserName-->
				<div id="spacing-nomor">
				<input type="text" id="nomorbulan" name="textnomor"/><br /><br />
				</div>
				<!--Name-->
				<div id="spacing-nama">
				<input type="text" id="namalengkap" name="textnamalengkap" /><br /><br />
				</div>
				<!--HP-->
				<div id="spacing-expired">
				<input type="text" id="expbulan" name="textexpbulan" />/<input type="text" id="exptahun" name="textexptahun" /> mo/ye <br /><br />
				</div>
				<div id="warning-message"></div>
				<button id="registerkartu">Bayar</button>
			</form>
			<form  method="post" action="cart.jsp">
				<button id="cancel">Cancel</button>
			</form>
			</div>
		</div>
	</body>
</html>