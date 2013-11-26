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
			<!-- Header Section -->
			<div id="header" class="frame">
				<div class="kolom-7">
					<img src="res/img/logo.png" alt="" id="logo"/>
				</div>
				<div class="kolom-4">
					<div id="user-panel">
						
						<div id="user" class="frame">
							<img id="user-pict" class="kolom-5" src="res/img/userpict_h.png" alt=""/>
							<div id="user-text" class="kolom-7">
								<h3>Welcome, <span class="user-name">Riandy</span>!</h3>
								<p id="user-control">
									<span class="edit-logout"><a href="">Edit Profile</a></span>
									&nbsp;or&nbsp;
									<span class="edit-logout"><a href="">Logout</a></span>
								</p>
								
								<a href="#" class="btn">Check Your Cart</a>
							</div>
						</div>
						
						<div id="search-bar" class="frame">
							<form action="search.php">
								<input id="search-box" class="kolom-9" type="text" name="src" value="Ketikkan barang yang dicari...">
								<input id="search-button" class="kolom-1" type="submit" value="">
							</form>					
						</div>
					</div>
				</div>			
			</div>
			<!-- End of Header -->
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
