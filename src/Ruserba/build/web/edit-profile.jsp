<%-- 
    Document   : edit-profile
    Created on : Nov 27, 2013, 11:38:57 AM
    Author     : Aldo2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Profile</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<script type="text/javascript" src="js/edit-profile.js"></script>
	</head>
	<body>
		<!--Header-->
			<div id="header">
				<%@ include file="header.jsp"%>
			</div>
			<!--Body-->
			<div id="profile-page-body">
				<h1>Edit Profil
                </h1>
				<div id="profil">
					Nama:<br><br>
					Ganti Password:<br><br>
					Konfirmasi Password:<br><br>
					Alamat:<br><br>
					Provinsi:<br><br>
					Kabupaten:<br><br>
					Kode Pos:<br><br>
					No HP:<br><br>
				</div>
				<div id="register-form">
				<form enctype="multipart/form-data" method="post" action="changeprofil">
					<!--Name-->
					<div id="spacing-nama">
					<input type="text" id="gantinama" onKeyUp="check_nama('<%out.print(nama);%>')" name="textgantinama" value="<%out.print(nama);%>" /> <div id="warning-nama"></div> <br><br>
					</div>
					<!--Name-->
					<div id="spacing-password">
					<input type="password" id="gantipassword" onKeyUp="check_password('<%out.print(password);%>')" name="textgantipassword" value="<%out.print(password);%>" /><div id="warning-password"></div> <br><br>
					</div>
					<!--HP-->
					<div id="spacing-konfirmasipassord">
					<input type="password" id="konfirmasigantipassword" onKeyUp="check_confirmpassword()" name="textkonfirmasigantipassword"/><div id="warning-konfirmasi"></div> <br><br>
					</div>
					<!--Alamat-->
					<div id="spacing-alamat">
					<input type="text" id="alamat" onKeyUp="check_alamat('<%out.print(alamat);%>')" name="textalamat" value="<%out.print(alamat);%>" /><div id="warning-alamat"></div> <br><br>
					</div>
					<!--Provinsi-->
					<div id="spacing-provinsi">
					<input type="text" id="provinsi" onKeyUp="check_provinsi('<%out.print(provinsi);%>')" name="textprovinsi" value="<%out.print(provinsi);%>" /><div id="warning-provinsi"></div> <br /><br>
					</div>
					<!--Kabupaten-->
					<div id="spacing-kabupaten">
					<input type="text" id="kabupaten" onKeyUp="check_kabupaten('<%out.print(kabupaten);%>')" name="textkabupaten" value="<%out.print(kabupaten);%>" /><div id="warning-kabupaten"></div> <br /><br>
					</div>
					<!--Pos-->
					<div id="spacing-pos">
					<input type="text" id="pos" onKeyUp="check_pos('<%out.print(pos);%>')" name="textpos" value="<%out.print(pos);%>" /><div id="warning-pos"></div> <br /><br>
					</div>
					<div id="spacing-HP">
					<input type="text" id="HP" onKeyUp="check_HP('<%out.print(HP);%>')" name="textHP" value="<%out.print(HP);%>" /><div id="warning-HP"></div> <br /><br>
					</div>
					<button id="create">Confirm Edit</button>
				</form>
				<form method="post" action="profile.jsp"><input type="submit" value="Back" ></form>
				</div>
				
			</div>
	</body>
</html>
