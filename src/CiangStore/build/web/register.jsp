<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en-US">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
		<script type="text/javascript" src="js/reg.js"></script>
		<title>
			Lembar Pendaftaran
		</title>
	</head>
	<body>
		<div id="container">
			<jsp:include page="Header.jsp"/>
                <jsp:include page="Navbar.jsp"/>
				
		<div id="form-registrasi" class="frame">
			<p id="registration-title">Registration</p>
		
			<form name="regisform" action="register_card.jsp" method="post">
				<div id="username" class="form-field">
					<p class="label">
						Username :
					</p>
					<p><input class="field-box kolom-12" type="text" onkeyup="validateregisForm()" name="username">
						<p class="info">
							(Minimal 5 karakter)
						</p>
					</input></p>
				</div>
				
				<div id="password" class="form-field">
					<p class="label">
						Password :
					</p>
					<p><input class="field-box kolom-12" type="password" onkeyup="validateregisForm()" name="password">
						<p class="info">
							(Minimal 8 Karakter)
						</p>
					</input></p>
				</div>
				
				<div id="password-retype" class="form-field">
					<p class="label">
						Ulangi Password :
					</p>
					<p><input class="field-box kolom-12" type="password" onkeyup="validateregisForm()" name="confirmpassword"></input></p>
				</div>
				
				<div id="nama-lengkap" class="form-field">
					<p class="label">
						Nama Lengkap :
					</p>
					<p><input class="field-box kolom-12" type="text" onkeyup="validateregisForm()" name="namalengkap"></input></p>
				</div>
				
				<div id="handphone" class="form-field">
					<p class="label">
						Nomor HP :
					</p>
					<p><input class="field-box kolom-12" type="text" onkeyup="validateregisForm()" name="nomorhp"></input></p>
				</div>
				
				<div id="alamat" class="form-field">
					<p class="label">
						Alamat :
					</p>
					<p><input class="field-box kolom-12" type="text" onkeyup="validateregisForm()" name="alamat"></input></p>
				</div>
				
				<div id="kota-kabupaten" class="form-field">
					<p class="label">
						Kota/Kabupaten :
					</p>

					<p><input class="field-box kolom-12" type="text" onkeyup="validateregisForm()" name="kota"></input></p>
				</div>
				
				<div id="provinsi" class="form-field">
					<p id="label_form" class="label">
						Provinsi :
					</p>
					<p><input class="field-box kolom-12" type="text" onkeyup="validateregisForm()" name="provinsi"></input></p>
				</div>
				
				<div id="kode-pos" class="form-field">
					<p class="label">
						Kode Pos :
					</p>
					<p><input class="field-box kolom-12" type="text" onkeyup="validateregisForm()" name="kodepos"></input></p>
				</div>
				
				<div id="email" class="form-field">
					<p class="label">
						Email :
					</p>
					<p><input id="label_form" class="field-box kolom-12" type="text" onkeyup="validateregisForm()" name="email"></input></p>
				</div>
				<br/>
					<input id="btn-register" type="submit" disabled value="DAFTAR" name="daftar"></input>
			</form>
		</div>
	</div>
	</body>
</html>
