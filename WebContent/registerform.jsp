<!DOCTYPE html>
<html>
<head>
	<title>Registrasi Anggota</title>
	<link rel="stylesheet" href="css/main.css" type="text/css"/> 
	<link rel="stylesheet" href="css/register.css" type="text/css"/>
	<script>

	</script>	
</head>
<body id="index" class="home">
	<div id="container">
		<%@include file="header.jsp" %>
		
		<article id="contentfull" class="body">
			<h2 id="judul">Pendaftaran Anggota Baru RAN's Shop</h2>
			
			<form id="registerform" name="regform" class="rounded" method="post" action="">
			<p id="text">(*) Harus diisi.</p>
			
			<div class="field">
				<label for="nama">Nama Lengkap*</label>
				<input type="text" class="input" name="nama" 
					onblur="valNama();valid()">
				<span id="nama"></span>
				<p class="hint">Masukkan nama lengkap Anda.</p>
			</div>
			
			<div class="field">
				<label for="username">Username*</label>
				<input type="text" class="input" name="username"  
					onblur="valPassword();valUsername();valid()">
				<span id="user"></span>
				<p class="hint">Masukkan username yang Anda inginkan.</p>
			</div>
			
			<div class="field">
				<label for="password">Password*</label>
				<input type="password" class="input" name="password"  
					onblur="valPassword();valUsername();valEmail();valid()">
				<span id="pass"></span>
				<p class="hint">Masukkan password Anda inginkan.</p>
			</div>
			
			<div class="field">
				<label for="password2">Confirm Password*</label>
				<input type="password" class="input" name="confirm" 
					onblur="valConfirm();valid()">
				<span id="conf"></span>
				<p class="hint">Konfirmasi password.</p>
			</div>
			
			<div class="field">
				<label for="nohp">Nomor HP</label>
				<input type="text" class="input" name="hp"
					onblur="valHP();valid()">
				<span id="hp"></span>
				<p class="hint">Masukkan nomor HP Anda.</p>
			</div>
			
			<div class="field">
				<label for="alamat">Alamat</label>
				<input type="text" class="input" name="alamat"
					onblur="valAlamat();valid()">
				<span id="alamat"></span>
				<p class="hint">Masukkan alamat Anda.</p>
			</div>
			
			<div class="field">
				<label for="provinsi">Provinsi</label>
				<input type="text" class="input" name="provinsi"
					onblur="valProvinsi();valid()">
				<span id="provinsi"></span>
				<p class="hint">Masukkan provinsi tempat Anda tinggal.</p>
			</div>
			
			<div class="field">
				<label for="kota">Kota</label>
				<input type="text" class="input" name="kota"
					onblur="valKota();valid()">
				<span id="kota"></span>
				<p class="hint">Masukkan kota tempat Anda tinggal.</p>
			</div>
			
			<div class="field">
				<label for="kodepos">Kode Pos</label>
				<input type="text" class="input" name="kodepos"
					onblur="valKodepos();valid()">
				<span id="kodepos"></span>
				<p class="hint">Masukkan kode pos tempat Anda tinggal.</p>
			</div>
			
			<div class="field">
				<label for="email">Email*</label>
				<input type="text" class="input" name="email" 
					onblur="valEmail();valEmail2();valPassword();valid()">
				<span id="email"></span>
				<p class="hint">Masukkan email Anda.</p>
			</div>
			
			<input type="submit" class="button" value="Daftar"/>
			</form>
		</article>
		
		<script>
			var validUsername = false;
			var validPassword = false;
			var validConfirm = false;
			var validEmail = false;
			var validNama = false;
			var validHP = false;
			var validAlamat = false;
			var validProvinsi = false;
			var validKota = false;
			var validKodepos = false;

			function valHP() {
				var hp = document.forms["regform"]["hp"].value;
				var regex = /^.+$/;
				var validhp = hp.match(regex);
				if (validhp == null) {
					document.getElementById("hp").innerHTML = " Tidak boleh kosong";
					validHP = false;
				}
				else {
					document.getElementById("hp").innerHTML = " Valid";
					validHP = true;
				}
			}
			function valAlamat() {
				var alamat = document.forms["regform"]["alamat"].value;
				var regex = /^.+$/;
				var validalamat = alamat.match(regex);
				if (validalamat == null) {
					document.getElementById("alamat").innerHTML = " Tidak boleh kosong";
					validAlamat = false;
				}
				else {
					document.getElementById("alamat").innerHTML = " Valid";
					validAlamat = true;
				}
			}
			function valProvinsi() {
				var provinsi = document.forms["regform"]["provinsi"].value;
				var regex = /^.+$/;
				var validprovinsi = provinsi.match(regex);
				if (validprovinsi == null) {
					document.getElementById("provinsi").innerHTML = " Tidak boleh kosong";
					validProvinsi = false;
				}
				else {
					document.getElementById("provinsi").innerHTML = " Valid";
					validProvinsi = true;
				}
			}
			function valKota() {
				var kota = document.forms["regform"]["kota"].value;
				var regex = /^.+$/;
				var validkota = kota.match(regex);
				if (validkota == null) {
					document.getElementById("kota").innerHTML = " Tidak boleh kosong";
					validKota = false;
				}
				else {
					document.getElementById("kota").innerHTML = " Valid";
					validKota = true;
				}
			}
			function valKodepos() {
				var kodepos = document.forms["regform"]["kodepos"].value;
				var regex = /^.+$/;
				var validkodepos = kodepos.match(regex);
				if (validkodepos == null){
					document.getElementById("kodepos").innerHTML = " Tidak boleh kosong";
					validKodepos = false;
				}
				else {
					document.getElementById("kodepos").innerHTML = " Valid";
					validKodepos = true;
				}
			}

			function valid() {
				if (validUsername && validConfirm && validPassword && validEmail && validNama && validHP && validAlamat && validProvinsi && validKota && validKodepos) {
					document.getElementById("register").disabled = false;
				}
				else {
					document.getElementById("register").disabled = true;
				}
			}


			function valPassword() {
				var username = document.forms["regform"]["username"].value;
				var password = document.forms["regform"]["password"].value;
				var email = document.forms["regform"]["email"].value;

				if ((password.length < 8) && (password.length > 0)) {
					document.getElementById("pass").innerHTML = " Password minimal 8 karakter";
					validPassword = false;
				}
				else if ((password == username) && (password.length > 0)) {
					document.getElementById("pass").innerHTML = " Password tidak boleh sama dengan username";
					validPassword = false;
				}
				else if ((password == email) && (password.length > 0)) {
					document.getElementById("pass").innerHTML = " Password tidak boleh sama dengan email";
					validPassword = false;
				}
				else if (password.length == 0) {
					document.getElementById("pass").innerHTML = " Tidak boleh kosong";
					validPassword = false;
				}
				else {
					document.getElementById("pass").innerHTML = " Valid";
					validPassword = true;
				}
			}

			function valConfirm() {
				var confirm = document.forms["regform"]["confirm"].value;
				var password = document.forms["regform"]["password"].value;

				if ((confirm != password) && (confirm.length > 0)) {
					document.getElementById("conf").innerHTML = " Password tidak sama";
					validConfirm = false;
				}
				else if (confirm.length == 0) {
					document.getElementById("conf").innerHTML = " Tidak boleh kosong";
					validConfirm = false;
				}
				else {
					document.getElementById("conf").innerHTML = " Valid";
					validConfirm = true;
				}
			}

			function valNama() {
				var nama = document.forms["regform"]["nama"].value;
				var regex = /^[\S.]+ [\S.]+$/;
				var validnama = nama.match(regex);
				if ((validnama == null) && (nama.length > 0)) {
					document.getElementById("nama").innerHTML = " Harus terdiri dari minimal 2 kata";
					validNama = false;
				}
				else if (validnama == null) {
					document.getElementById("nama").innerHTML = " Tidak boleh kosong";
					validNama = false;
				}
				else {
					document.getElementById("nama").innerHTML = " Valid";
					validNama = true;
				}
			}

			function valEmail() {
				var email = document.forms["regform"]["email"].value;
				var password = document.forms["regform"]["password"].value;
				var regex = /^[a-zA-Z0-9\_]+@[a-zA-Z0-9]+\.[a-zA-Z0-9.]{2,}$/;
				var validemail = email.match(regex);
				if ((validemail == null) && (email.length > 0)) {
					document.getElementById("email").innerHTML = " Bukan Email yang valid";
				}
				else if ((password == email) && (email.length > 0)) {
					document.getElementById("email").innerHTML = " Email tidak boleh sama dengan Password";
				}
				else if (validemail == null) {
					document.getElementById("email").innerHTML = " Tidak boleh kosong";
				}
				else {
					document.getElementById("email").innerHTML = " Valid";

					if (email.length > 0) {
					validEmail = true;
					var xmlhttp; 
					if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
		  				xmlhttp=new XMLHttpRequest();
		  			}
					else {// code for IE6, IE5
		  			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  			}
					xmlhttp.onreadystatechange=function() {
						if (xmlhttp.readyState==4 && xmlhttp.status==200) {
							var temp = xmlhttp.responseText;
							document.getElementById("email").innerHTML = temp;
							if (temp == "Email sudah ada") {
								validEmail = false;
							}
						}
					}
					xmlhttp.open("GET","Validate-Register.php?type=2&value="+email,true);
					xmlhttp.send();
					}
				}

				
			}


			function valUsername() {
				var username = document.forms["regform"]["username"].value;
				var password = document.forms["regform"]["password"].value;

				if ((username.length < 5) && (username.length > 0)) {
					document.getElementById("user").innerHTML = " Username minimal 5 karakter";
					validUsername = false;
				}
				else if ((username == password) && (username.length > 0)) {
					document.getElementById("user").innerHTML = " Username tidak boleh sama dengan password";
					validUsername = false;
				}
				else if (username.length == 0) {
					document.getElementById("user").innerHTML = " Tidak boleh kosong";
					validUsername = false;
				}
				else {
					document.getElementById("user").innerHTML = " Valid";

					if (username.length > 0) {
					validUsername = true;

					var xmlhttp; 
					if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
		  				xmlhttp=new XMLHttpRequest();
		  			}
					else {// code for IE6, IE5
		  			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  			}
					xmlhttp.onreadystatechange=function() {
						if (xmlhttp.readyState==4 && xmlhttp.status==200) {
							var temp = xmlhttp.responseText;
							document.getElementById("user").innerHTML = temp;
							if (temp == "Username sudah ada") {
								validUsername = false;
							}
						}
					}
					xmlhttp.open("GET","Validate-Register.php?type=1&value="+username,true);
					xmlhttp.send();
					}

				}
				
				
			}
		</script>
		
		<%@include file="footer.jsp" %>
	</div>	
</body>
</html>