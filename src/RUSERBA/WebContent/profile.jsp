<%@include file="header.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript" src="js/profile.js"></script>   

<%

String pass = (String)request.getAttribute("pass");
String nama = (String)request.getAttribute("nama");
String email = (String)request.getAttribute("email");
String hp = (String)request.getAttribute("hp");
String provinsi = (String)request.getAttribute("provinsi");
String kota = (String)request.getAttribute("kota");
String alamat = (String)request.getAttribute("alamat");
String kodepos = (String)request.getAttribute("kodepos");

%>

<html> 
<head><title>Registrasi User</title></head> 
<body>

<form method="post" action="Profile">
	<h1>Pendaftaran Anggota Baru Ruserba</h1><br>
	<pre><span>(*) Data harus diisi</span></pre> 
	<pre>Username*			<input type="text" name=username id="username" disabled="true">
	<script>
		document.getElementById("username").value = localStorage.wbdusername;
	</script></pre>	
	<pre>Password*			<input type="password" name="pass" id="pass" value="<%=pass%>">
	<span id="passErr"></span></pre>
	<pre>Re-enter Password*	<input type="password" name="pass2"id="pass2" value="<%=pass%>">
	<span id="pass2Err"></span></pre>
	<pre>Nama Lengkap*		<input type="text" name="nama" id="nama" value="<%=nama%>">
	<span id="namaErr"></span></pre>
	<pre>Email*				<input type="text" name="email"id="email" value="<%=email%>">
	<span id="emailErr"></span></pre>
	<pre>Nomor HP			<input type="text" name="hp" value="<%=hp%>"></pre>
	<pre>Alamat				<br><textarea class="text_input" cols="50" rows="4" name="alamat" id="alamat">
	<%=alamat%>
	</textarea></pre>
	<pre>Provinsi			<input type="text" name="provinsi" value="<%=provinsi%>"></pre>
	<pre>Kota				<input type="text" name="kota" value="<%=kota%>"></pre>
	<pre>Kode Pos			<input type="text" name="kodepos" value="<%=kodepos%>"></pre>
		
	<input type="submit" value="ubah profile!" id="submit_btn"> 
</form>
</body> 
</html> 

