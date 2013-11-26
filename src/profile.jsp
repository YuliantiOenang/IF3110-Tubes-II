<%@ include file="header.jsp" %>
		<script>
			if (localStorage.user==null) {
				window.location = "register.jsp";
			}
			
			//AJAX to get account info
			var username=localStorage.user;
			var xmlhttp;
			if (window.XMLHttpRequest)
			{// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp=new XMLHttpRequest();
			}
			else
			{// code for IE6, IE5
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.open("POST","AJAXaccountinfo.jsp",false);
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("username="+username);
			var accountinfo=(xmlhttp.responseText).trim().split("`");
			var _username=accountinfo[0];
			var _nama=accountinfo[1];
			var _nohp=accountinfo[2];
			var _alamat=accountinfo[3];
			var _provinsi=accountinfo[4];
			var _kota=accountinfo[5];
			var _kodepos=accountinfo[6];
			var _email=accountinfo[7];
			var _password=accountinfo[8];
			var _transaksi=accountinfo[9];
			//end of ajax
				
			function setAccountInfo() {
				document.forms["registrasi"]["username"].value=_username;
				document.forms["registrasi"]["nama"].value=_nama;
				document.forms["registrasi"]["nohp"].value=_nohp;
				document.forms["registrasi"]["alamat"].value=_alamat;
				document.forms["registrasi"]["provinsi"].value=_provinsi;
				document.forms["registrasi"]["kota"].value=_kota;
				document.forms["registrasi"]["kodepos"].value=_kodepos;
				document.forms["registrasi"]["email"].value=_email;
				document.forms["registrasi"]["transaksi"].value=_transaksi;
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
			function AJAXedit() {
				var username=document.forms["registrasi"]["username"].value;
				var nama=document.forms["registrasi"]["nama"].value;
				var nohp=document.forms["registrasi"]["nohp"].value;
				var alamat=document.forms["registrasi"]["alamat"].value;
				var provinsi=document.forms["registrasi"]["provinsi"].value;
				var kota=document.forms["registrasi"]["kota"].value;
				var kodepos=document.forms["registrasi"]["kodepos"].value;
				var email=document.forms["registrasi"]["email"].value;
				var password=document.forms["registrasi"]["password"].value;
				if ((nama==_nama)&&(password==_password)&&(alamat==_alamat)&&(provinsi==_provinsi)&&(kota==_kota)&&(kodepos==_kodepos)&&(nohp==_nohp)) {
					alert("Field tidak berubah!");
					return;
				}
				var xmlhttp;
				if (window.XMLHttpRequest)
					{// code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp=new XMLHttpRequest();
				}
				else
					{// code for IE6, IE5
					xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlhttp.open("POST","AJAXedit.jsp",false);
				xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xmlhttp.send("username="+username+"&nama="+nama+"&nohp="+nohp+"&alamat="+alamat+"&provinsi="+provinsi+"&kota="+kota+"&kodepos="+kodepos+"&email="+email+"&password="+password);
				if (xmlhttp.responseText.trim()=="true") {
					alert("Edit berhasil!");
					window.location="profile.jsp";
				}
				else {
					alert("Edit gagal!");
				}
			}
		</script>
		<link rel="stylesheet" href="layout.css">
	</head>
<%@ include file="middle.jsp" %>
		<div id="container-left">
		<div id="container">
		<h2>Profil</h2>
		<form name="registrasi">
			Transaksi : <input type="text" name="transaksi" size="40" readonly> kali<br><br>
			Username: <input type="text" name="username" size="40" onchange="validateForm()" readonly><br>
			Nama lengkap: <input type="text" name="nama" size="40" onchange="validateForm()"><small> minimal 2 kata</small><br>
			Nomor handphone: <input type="text" name="nohp" size="40" onchange="validateForm()"><br>
			Alamat: <input type="text" name="alamat" size="40" onchange="validateForm()"><br>
			Kota/Kabupaten: <input type="text" name="kota" size="40" onchange="validateForm()"><br>
			Provinsi: <input type="text" name="provinsi" size="40" onchange="validateForm()"><br>
			Kode Pos: <input type="text" name="kodepos" size="40" onchange="validateForm()"><br>
			Email: <input type="text" name="email" size="40" onchange="validateForm()" readonly><br>
			Change password: <input type="password" name="password" size="40" onchange="validateForm()"><small> minimal 8 karakter, != username dan email</small><br>
			Confirm change password: <input type="password" name="confpassword" size="40" onchange="validateForm()"><small> == password</small><br>
			<button id="submit" type="button" onclick="AJAXedit()" disabled>Save</button>
		</form>
		<script>
			setAccountInfo();
		</script>
		</div>
		</div>
	</body>
</html>