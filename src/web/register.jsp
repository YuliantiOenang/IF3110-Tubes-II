<%@ page import="com.ruserba.web.WebUtil" %>
<%@ page import="com.ruserba.model.Database" %>
<%@ page import="com.ruserba.model.Category" %>
<%@ page import="com.ruserba.model.Product" %>
<%@ page import="com.ruserba.model.SearchAttribute" %>
<%@ page import="java.util.ArrayList" %>

<% request.setAttribute("page_title", "RuSerBa - Registrasi"); %>
<% request.setAttribute("css_file", "styles/register.css"); %>
<% request.setAttribute("js_file", "scripts/register.js"); %>
<jsp:include page="/WEB-INF/jsp/begin.jsp" />

<p>
Silakan registrasi. bagian yang berlabel bintang (*) wajib diisi.
<button id="button_right">Register Me!</button>
</p>
<div id="register_form">
	<label>Username *</label>
	<input type="text" id="username" onblur="cekUsername()" required>
	<div id=responseUsername> </div>
	<br>
	<label>Email *</label>
	<input type="email" id="email" onblur="cekEmail()" required>
	<div id=responseEmail> </div>
	<br>
	<label>Password *</label>
	<input type="password" id="password" required>
	<br>
	<label>Confirm Password *</label>
	<input type="password" id="confirm_pwd" onblur="cekPasswordMatch()" required>
	<div id=responsePassword> </div>
	<br>
	<label>Full Name *</label>
	<input type="text" id="fullname" onblur="cekFullname()" required>
	<div id=responseFullname> </div>
	<br>
	<label>Provinsi</label>
	<input type="text" id="provinsi">
	<br>
	<label>Kota/Kabupaten</label>
	<input type="text" id="kota">
	<br>
	<label>Alamat</label>
	<input type="text" id="alamat">
	<br>
	<label>Kode Pos</label>
	<input type="text" id="kodepos" onblur="cekAngka(document.getElementById('kodepos').value)">
	<div id=responseAngka> </div>
	<br>
	<label>Telepon</label>
	<input type="text" id="telepon" onblur="cekAngka(document.getElementById('telepon').value)">
	<div id=responseAngka> </div>
</div>