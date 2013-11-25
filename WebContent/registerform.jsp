<!DOCTYPE html>
<html>
<head>
	<title>Registrasi Anggota</title>
	<link rel="stylesheet" href="css/main.css" type="text/css"/> 
	<link rel="stylesheet" href="css/register.css" type="text/css"/>
</head>
<body id="index" class="home">
	<div id="container">
		<%@include file="header.jsp" %>
		
		<article id="contentfull" class="body">
			<h2 id="judul">Pendaftaran Anggota Baru RAN's Shop</h2>
			
			<form id="registerform" class="rounded" method="post" action="">
			<p id="text">(*) Harus diisi.</p>
			
			<div class="field">
				<label for="nama">Nama Lengkap*</label>
				<input type="text" class="input" name="nama" id="nama"/>
				<p class="hint">Masukkan nama lengkap Anda.</p>
			</div>
			
			<div class="field">
				<label for="username">Username*</label>
				<input type="text" class="input" name="username" id="username"/>
				<p class="hint">Masukkan username yang Anda inginkan.</p>
			</div>
			
			<div class="field">
				<label for="password">Password*</label>
				<input type="password" class="input" name="password" id="password"/>
				<p class="hint">Masukkan password Anda inginkan.</p>
			</div>
			
			<div class="field">
				<label for="password2">Confirm Password*</label>
				<input type="password" class="input" name="password2" id="password2"/>
				<p class="hint">Konfirmasi password.</p>
			</div>
			
			<div class="field">
				<label for="nohp">Nomor HP</label>
				<input type="text" class="input" name="nohp" id="nohp"/>
				<p class="hint">Masukkan nomor HP Anda.</p>
			</div>
			
			<div class="field">
				<label for="alamat">Alamat</label>
				<input type="text" class="input" name="alamat" id="alamat"/>
				<p class="hint">Masukkan alamat Anda.</p>
			</div>
			
			<div class="field">
				<label for="provinsi">Provinsi</label>
				<input type="text" class="input" name="provinsi" id="provinsi"/>
				<p class="hint">Masukkan provinsi tempat Anda tinggal.</p>
			</div>
			
			<div class="field">
				<label for="kota">Kota</label>
				<input type="text" class="input" name="kota" id="kota"/>
				<p class="hint">Masukkan kota tempat Anda tinggal.</p>
			</div>
			
			<div class="field">
				<label for="kodepos">Kode Pos</label>
				<input type="text" class="input" name="kodepos" id="kodepos"/>
				<p class="hint">Masukkan kode pos tempat Anda tinggal.</p>
			</div>
			
			<div class="field">
				<label for="email">Email*</label>
				<input type="text" class="input" name="email" id="email"/>
				<p class="hint">Masukkan email Anda.</p>
			</div>
			
			<input type="submit" class="button" value="Daftar"/>
			</form>
		</article>
		
		<%@include file="footer.jsp" %>
	</div>	
</body>
</html>