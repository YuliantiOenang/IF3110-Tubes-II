<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->

   <%
        Cookie cookiesCheck[] = null;
        cookiesCheck = request.getCookies();
        boolean adaCookies = false;
        
        for(int i = 0;i<cookiesCheck.length;i++){
            if(cookiesCheck[i].getName().equals("IdCustomer")){
                adaCookies = true;
                break;
            }
        }
        if(adaCookies){
    %>
			<script type="text/javascript">
						window.alert("Anda Sudah terdaftar");
						window.location="index.jsp";
						</script>
   <%
            }
   %>

<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>
<script type="text/javascript">

function checkSubmit(){
			
			
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var confirm_password = document.getElementById("confirm_password").value;
	var nama_lengkap = document.getElementById("nama_lengkap").value;
	var email = document.getElementById("email").value;
	
	

	//document.getElementById("pesan").innerHTML = "sadf";
	
	http.onreadystatechange=function(){
		if(http.readystate=4 && http.status == 200){
			
			var decodeJSON = JSON.parse(http.responseText);
			var boolUser = decodeJSON.boolUser;
			var boolPass = decodeJSON.boolPass;
			var bool = decodeJSON.bool;
			var boolNama = decodeJSON.boolNama;
			var boolUsedUser=decodeJSON.boolUsedUser;
			var boolUsedEmail=decodeJSON.boolUsedEmail;
			 
			var echo = http.responseText;
			var response = echo.substr(0,4);
			document.getElementById("nama_label").innerHTML = echo;
			//document.getElementById("pesan").innerHTML = echo;
			//response = "true";
			
			//document.getElementById("pesan").innerHTML = response;
			
			if(boolUser && boolPass && bool && boolNama){
				document.getElementById("user_error").innerHTML = "";
				document.getElementById("pass_label").innerHTML = "";
				document.getElementById("conf_pass_label").innerHTML = "";
				document.getElementById("nama_label").innerHTML = "";
				document.getElementById("email_label").innerHTML = "";
				document.getElementById("submit").disabled = false;
				//document.getElementById("pesan").innerHTML = "sadf"
			}else{
				document.getElementById("submit").disabled = true;
				var errorMessage = "";
				if(!boolNama){
					document.getElementById("user_error").innerHTML = "ERROR PADA USERNAME";
				}else{
					document.getElementById("user_error").innerHTML = "";
				}
				if(!boolPass){
					document.getElementById("conf_pass_label").innerHTML = "PASSWORD TIDAK SAMA ATAU DI BAWAH 8 KARAKTER";
				}else{
					document.getElementById("conf_pass_label").innerHTML = "";
				}
				if(!boolUser){
					document.getElementById("nama_label").innerHTML = "ERROR PADA NAMA";
				}else{
					document.getElementById("nama_label").innerHTML = "";
				}
				if(!bool){
					document.getElementById("email_label").innerHTML = "Kesalahan Pada Email";
				}else{
					document.getElementById("email_label").innerHTML = "";
				}
 				if(!boolUsedUser)
				{
					document.getElementById("user_error").innerHTML = "USERNAME SUDAH DIPAKAI";
				}
				if(!boolUsedEmail)
				{
					document.getElementById("email_label").innerHTML = "EMAIL SUDAH DIPAKAI";
				}  
			}
		}
	}
	http.open("GET","Registrasi/validasi.jsp?username=" + username + "&password=" + password
		+"&confirm_password=" + confirm_password + "&nama_lengkap=" + nama_lengkap
		+ "&email=" + email,true);
	http.send();
}
</script>
</head>
<body>
    <%@include file="header.jsp" %>
<div class = "bodymain">
    <%@include file="sidebar.jsp" %>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> BECOME A COLDPLAYER!</p></br></br>
		</div>
		
			<div class = "registerspace">
			<form action="signup.jsp" method="POST">
			<label>Username </label> <input type="text"  name ="username" id="username" onkeyup="checkSubmit()" required placeholder = "e.g. cmartin" /><label id="user_error"></label></br></br>
			
			<label>Nama Lengkap</label> <input type="text" id="nama_lengkap" name="nama_lengkap" onkeyup="checkSubmit()" required placeholder = "Chris Martin" /><label id="nama_label"></label></br></br>
			
			<label>Nomor Handphone</label> <input type="text" id="handphone" name="handphone" onkeyup="checkSubmit()" placeholder = "083820666910" /></br></br>
			
			<label>Alamat </label> <input type="text" id="alamat" name="alamat" onkeyup="checkSubmit()" placeholder = "Jl. Jend. Katamso Gg. Sukadamai No. 1" /></br></br>
			
			<label>Provinsi </label> <input type="text" id="provinsi" name="provinsi" onkeyup="checkSubmit()" placeholder = "Jawa Barat" /></br></br>
			
			<label>Kota/Kabupaten</label> <input type="text" id="kobupaten" name="kobupaten" onkeyup="checkSubmit()" placeholder = "Bandung" /></br></br>
			
			<label>Kodepos </label> <input type="text" id="kodepos" name="kodepos" onkeyup="checkSubmit()"  placeholder = "14045" /></br></br>
			
			<label>Password</label> <input type="password" id="password" name="password" onkeyup="checkSubmit()" required placeholder = "1234" /><label id="pass_label"></label></br></br>
			
			<label>Confirm Password</label> <input type="password" id="confirm_password" onkeyup="checkSubmit()" required placeholder = "1234" /><label id="conf_pass_label"></label></br></br>
			
			<label>Email</label> <input type="text" id="email" name="email" onkeyup="checkSubmit()" required placeholder = "cmartin@coldplay.com" /><label id="email_label"></label></br></br>
		
			<input type="submit" id="submit" value = "Register!" disabled></br></br>
			</div>
			</form>
			 
			  
			</div>
			
			</div>
			
			
			
	
	<div class = "footer">
		<div class = "info">

		</div>
		
				
		
	</div>
</div>
</body>
</html>