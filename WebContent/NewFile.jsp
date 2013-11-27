
<html>
<body>
	
	<form name="registrasi">
		Username: <input type="text" name="username" size="40"
			onchange="validateForm()"><small> minimal 5 karakter</small><br>
		Nama lengkap: <input type="text" name="nama" size="40"
			onchange="validateForm()"><small> minimal 2 kata</small><br>
		Nomor handphone: <input type="text" name="nohp" size="40"
			onchange="validateForm()"><br> Alamat: <input
			type="text" name="alamat" size="40" onchange="validateForm()"><br>
		Kota/Kabupaten: <input type="text" name="kota" size="40"
			onchange="validateForm()"><br> Provinsi: <input
			type="text" name="provinsi" size="40" onchange="validateForm()"><br>
		Kode Pos: <input type="text" name="kodepos" size="40"
			onchange="validateForm()"><br> Email: <input type="text"
			name="email" size="40" onchange="validateForm()"><br>
		Password: <input type="password" name="password" size="40"
			onchange="validateForm()"><small> minimal 8 karakter,
			!= username dan email</small><br> Confirm password: <input
			type="password" name="confpassword" size="40"
			onchange="validateForm()"><small> == password</small><br>
		<button id="submit" type="button" onclick="AJAXregister()" disabled>Register</button>
	</form>
	<input type="submit" value="Submit" />
</body>
</html>