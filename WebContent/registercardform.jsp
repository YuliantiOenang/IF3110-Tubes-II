<!DOCTYPE html>
<html>
<head>
	<title>Registrasi Kartu Kredit</title>
	<link rel="stylesheet" href="css/main.css" type="text/css"/> 
	<link rel="stylesheet" href="css/register.css" type="text/css"/>
</head>
<body id="index" class="home">
	<div id="container">
		<%@include file="header.jsp" %>
		
		<article id="contentfull" class="body">
			<h2>Registrasi Kartu Kredit</h2>
			
			<form id="registerform" class="rounded" method="post" action="">
			<p>Bisa mendaftarkan sekarang atau nanti</p>
			
			<div class="field">
				<label for="cardno">Card Number</label>
				<input type="text" class="input" name="cardno" id="cardno"/>
				<p class="hint">Masukkan nama kartu kredit Anda.</p>
			</div>
			
			<div class="field">
				<label for="cardname">Name On Card</label>
				<input type="text" class="input" name="cardname" id="cardname"/>
				<p class="hint">Masukkan nama pada kartu kredit Anda.</p>
			</div>
			
			<div class="field">
				<label for="expdate">Expired Date</label>
				<input type="text" class="input" name="expdate" id="expdate"/>
				<p class="hint">Masukkan masa berlaku kartu kredit Anda.</p>
			</div>
			
			<input type="submit" class="button" value="Submit"/>
			<input type="button" class="button" value="Skip"/>
			</form>
		</article>
		
		<%@include file="footer.jsp" %>
	</div>	
</body>
</html>