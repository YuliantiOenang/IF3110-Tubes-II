<!DOCTYPE html>
<html>

<!-- Head -->
<head><script src="FormValidation.js"></script>
<script src="UserAJAX.js"></script>
</head>

<!-- Body -->
<body onload="LoginRedirection(); InitializeValue()">

<!-- Form Pendaftaran -->
<form name="registration" >
<label>Username: </label><label id="username"></label> <br>
<span>Nama Lengkap: <input type="text" name="fullname" onkeyup='validatep("fullname")' required> <label id = "fullname"></label></span><br> 
<span>Nomor Handphone:* <input type="text" name="hp" id='nohp'> <br></span>
<label>Email: </label><label id="email"></label> <br>
<span>Alamat:* <input type="text" name="alamat"id='alamat'> <br></span>
<span>Provinsi:* <input type="text" name="provinsi"id='provinsi'> <br></span>
<span>Kota/Kabupaten:* <input type="text" name="kota"id='kota'> <br></span>
<span>Kodepos:* <input type="text" name="kodepos"id='kodepos'> <br></span>
<span>Password: <input type="password" name="password" onkeyup='validatep("password")' required><label id = "password"></label></span><br> 
<span>Confirm Password: <input type="password" name="confirm" onkeyup='validatep("confirm")'required><label id = "confirm"></label></span><br>
<label>Jumlah Transaksi: </label><label id="transaksi"></label><br>
<input type="button" onclick="SubmitNewProfile()" id="submitbutton" value="Edit Profile">
<p>*optional</p>	
</form>

</body>
</html>