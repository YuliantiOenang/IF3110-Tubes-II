<%@ include file="header.jsp" %>
		<script>
			if (localStorage.user!=null) {
				window.location = "index.jsp"
			}
			function validateForm() {
				var valid=true;
				//validasi username
				var x=document.forms["registrasi"]["username"].value;
				if (x.length<5) {
					valid=false;
					document.getElementById("submit").disabled = true;
					return;
				}
				//validasi nama lengkap
				var x=document.forms["registrasi"]["nama"].value;
				x.trim();
				if (x.search(" ")==-1) {
					valid=false;
					document.getElementById("submit").disabled = true;
					return;
				}
				//validasi email
				var x=document.forms["registrasi"]["email"].value;
				var atpos=x.indexOf("@");
				var dotpos=x.lastIndexOf(".");
				if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
					valid=false;
					document.getElementById("submit").disabled = true;
					return;
				}
				//validasi password
				var x=document.forms["registrasi"]["password"].value;
				var uname=document.forms["registrasi"]["username"].value;
				var email=document.forms["registrasi"]["email"].value;
				if ((x==uname)||(x==email)) {
					valid=false;
					document.getElementById("submit").disabled = true;
					return;
				}
				//validasi confirm password
				var x=document.forms["registrasi"]["confpassword"].value;
				var passw=document.forms["registrasi"]["password"].value;
				if ((x!=passw)||(x.length<8)) {
					valid=false;
					document.getElementById("submit").disabled = true;
					return;
				}
				document.getElementById("submit").disabled = false;
			}
			function AJAXregister() {
				var username=document.forms["registrasi"]["username"].value;
				var nama=document.forms["registrasi"]["nama"].value;
				var nohp=document.forms["registrasi"]["nohp"].value;
				var alamat=document.forms["registrasi"]["alamat"].value;
				var provinsi=document.forms["registrasi"]["provinsi"].value;
				var kota=document.forms["registrasi"]["kota"].value;
				var kodepos=document.forms["registrasi"]["kodepos"].value;
				var email=document.forms["registrasi"]["email"].value;
				var password=document.forms["registrasi"]["password"].value;
				var xmlhttp;
				if (window.XMLHttpRequest)
					{// code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp=new XMLHttpRequest();
				}
				else
					{// code for IE6, IE5
					xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlhttp.open("POST","AJAXregister.jsp",false);
				xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xmlhttp.send("username="+username+"&nama="+nama+"&nohp="+nohp+"&alamat="+alamat+"&provinsi="+provinsi+"&kota="+kota+"&kodepos="+kodepos+"&email="+email+"&password="+password);
				if (xmlhttp.responseText.trim()=="true") {
					localStorage.user=username;
					alert("Registrasi berhasil! Selanjutnya masukkan data kartu kredit anda.");
					window.location = "card.jsp";
				}
				else {
					alert("Username / password sudah pernah digunakan");
				}
			}
		</script>
	</head>
<%@ include file="middle.jsp" %>
		<h2>Registrasi Akun</h2>
		<form name="registrasi">
			Username: <input type="text" name="username" size="40" onchange="validateForm()"><small> minimal 5 karakter</small><br>
			Nama lengkap: <input type="text" name="nama" size="40" onchange="validateForm()"><small> minimal 2 kata</small><br>
			Nomor handphone: <input type="text" name="nohp" size="40" onchange="validateForm()"><br>
			Alamat: <input type="text" name="alamat" size="40" onchange="validateForm()"><br>
			Kota/Kabupaten: <input type="text" name="kota" size="40" onchange="validateForm()"><br>
			Provinsi: <input type="text" name="provinsi" size="40" onchange="validateForm()"><br>
			Kode Pos: <input type="text" name="kodepos" size="40" onchange="validateForm()"><br>
			Email: <input type="text" name="email" size="40" onchange="validateForm()"><br>
			Password: <input type="password" name="password" size="40" onchange="validateForm()"><small> minimal 8 karakter, != username dan email</small><br>
			Confirm password: <input type="password" name="confpassword" size="40" onchange="validateForm()"><small> == password</small><br>
			<button id="submit" type="button" onclick="AJAXregister()" disabled>Register</button>
		</form>
	</body>
</html>