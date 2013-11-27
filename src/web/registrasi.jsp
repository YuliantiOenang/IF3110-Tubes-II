<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->

</head>
<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>

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