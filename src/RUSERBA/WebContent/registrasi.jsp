<%@include file="header.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript" src="js/registrasi.js"></script>   

<html> 
<head><title>Registrasi User</title></head> 
<body>

<form method="post" action="Registrasi">
	<h1>Pendaftaran Anggota Baru Ruserba</h1><br>
	<pre><span>(*) Data harus diisi</span></pre> 
	<pre>Username*			<input type="text" name=username id="username"/><span id="usernameErr"></span></pre>	
	<pre>Password*			<input type="password" name="pass" id="pass"/><span id="passErr"></span></pre>
	<pre>Re-enter Password*	<input type="password" name="pass2"id="pass2"/><span id="pass2Err"></span></pre>
	<pre>Nama Lengkap*		<input type="text" name="nama" id="nama"/><span id="namaErr"></span></pre>
	<pre>Email*				<input type="text" name="email"id="email"/><span id="emailErr"></span></pre>
	<pre>Nomor HP			<input type="text" name="hp" /></pre>
	<pre>Alamat				<br><textarea class="text_input" cols="50" rows="4" name="alamat" id="alamat"></textarea></pre>
	<pre>Provinsi			<input type="text" name="provinsi"></pre>
	<pre>Kota				<input type="text" name="kota"></pre>
	<pre>Kode Pos			<input type="text" name="kodepos"></pre>
		
	<input type="submit" value="Daftar!" id="submit_btn"> 
</form>
</body> 
</html> 

