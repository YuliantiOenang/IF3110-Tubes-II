<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp" />
<%@page import="bean.DatabaseAccess"%>
<%@page import="java.sql.ResultSet"%>

<script type="text/javascript">
	function confirmAll() {
		var password = document.forms['edit']['password'].value;
		var repassword = document.forms['edit']['repassword'].value;
		var namalengkap = document.forms['edit']['fullname'].value;
		var hpnum = document.forms['edit']['hpnum'].value;
		var address = document.forms['edit']['address'].value;
		var province = document.forms['edit']['province'].value;
		var kecamatan = document.forms['edit']['kecamatan'].value;
		var postcode = document.forms['edit']['postalcode'].value;
		var numRegex = /^\d+$/;
		var isNum = numRegex.test(hpnum);
		var fullNameRegexStr = /^[A-Z][a-z]+([\ ][A-Za-z]+)+$/;
		var isNameValid = fullNameRegexStr.test(namalengkap);
		var isValid = true;
		var button = document.getElementById('subedit');
		if (password.length < 8) {
			isValid = false;
		} else if (password != repassword) {
			isValid = false;
		} else if (!isNameValid) {
			isValid = false;
		} else if (!isNum){
			isValid = false;
		}
		if (isValid) {
			button.disabled = false;
		} else {
			button.disabled = true;
		}
	}
	function verifRegis() {
		var password = document.forms['edit']['password'].value;
		var repassword = document.forms['edit']['repassword'].value;
		var namalengkap = document.forms['edit']['fullname'].value;
		var hpnum = document.forms['edit']['hpnum'].value;
		var address = document.forms['edit']['address'].value;
		var province = document.forms['edit']['province'].value;
		var kecamatan = document.forms['edit']['kecamatan'].value;
		var postcode = document.forms['edit']['postalcode'].value;
		var reg_error = document.getElementById('edit_error');
		var data = "password=" + password + "&repassword=" + repassword
				+ "&namalengkap=" + namalengkap + "&hpnum=" + hpnum
				+ "&address=" + address + "&province=" + province
				+ "&kecamatan=" + kecamatan + "&postcode=" + postcode;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				reg_error.innerHTML = xmlhttp.responseText;
				if (reg_error == "") {
					//Handle SESSION & LOCAL STORAGE
				}
			}
		}
		xmlhttp.open("POST", "veredit.php", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send(data);
	}
	function checkFullName(fld) {
		var err_fullname = document.getElementById("err_fullname");
		var fullNameStr = fld.value;
		var fullNameRegexStr = /^[A-Z][a-z]+([\ ][A-Za-z]+)+$/;
		var isValid = fullNameRegexStr.test(fullNameStr);
		confirmAll();
		if (!isValid) {
			err_fullname.innerHTML = "The Full Name must be 2 words and only alphabets";
			return false;
		} else {
			err_fullname.innerHTML = "";
			return true;
		}
	}
	function checkPass(fld) {
		var err_pass = document.getElementById("err_pass");
		confirmAll();
		if (fld.value.length < 8) {
			err_pass.innerHTML = "Password must be longer than 8 characters";
			return false;
		} else {
			err_pass.innerHTML = "";
			return true;
		}
	}
	function confirmPassword(fld) {
		var err_repass = document.getElementById("err_repass");
		var firstPass = document.forms['edit']['password'].value;
		var nowPass = fld.value;
		confirmAll();
		if (firstPass != nowPass) {
			err_repass.innerHTML = "The Second Password is Different";
			return false;
		} else {
			err_repass.innerHTML = "";
			return true;
		}
	}
	function checkNum(fld){
		var err_phonenum = document.getElementById("err_phonenum");
		var isAllNum = /^\d+$/;
		var isValid = isAllNum.test(fld.value);
		confirmAll();
		if (!isValid){
			err_phonenum.innerHTML = "Phone number must only contains 0-9";
			return false;
		} else {
			err_phonenum.innerHTML = "";
			return true;
		}
	}
	function enableButton(){
		var button = document.getElementById('subedit');
		button.disabled = false;
	}
</script>
<% // Validasi SESSION
if (session.getAttribute("username") == null){
	out.println("<h3>Login dulu bos</h3>");
} else {
	String fullname = null;
	String password = null;
	String phonenum = null;
	String address = null;
	String province = null;
	String state = null;
	String postalcode = null;
	
	DatabaseAccess dbAccess = new DatabaseAccess();
	String SQL = "SELECT * FROM `user` WHERE username = '" + session.getAttribute("username") + "'";
	System.out.println(SQL);
	ResultSet rs = dbAccess.doQuery(SQL);
	while (rs.next()) {
		fullname = rs.getObject(2).toString();
		password = rs.getObject(3).toString();
		phonenum = rs.getObject(5).toString();
		address = rs.getObject(6).toString();
		province = rs.getObject(7).toString();
		state = rs.getObject(8).toString();
		postalcode = rs.getObject(9).toString();
	}
%>
<form name="edit" action="EditProfile" method="post">
	Change Password: <input type="password" onkeyup="checkPass(this)"
		name="password" value="<% out.print(password);%>" onkeydown="enableButton()">
	<div id="err_pass"></div>
	<br> Confirm Password: <input type="password"
		onkeyup="confirmPassword(this)" name="repassword" value="<% out.print(password);%>" onkeydown="enableButton()">
	<div id="err_repass"></div>
	<br> Nama Lengkap: <input type="text" name="fullname"
		onkeyup="checkFullName(this)" value="<% out.print(fullname);%>" onkeydown="enableButton()">
	<div id="err_fullname"></div>
	<br> Nomor Hand Phone: <input type="text" name="hpnum"
		onkeyup="checkNum(this)"value="<% out.print(phonenum);%>" onkeydown="enableButton()">
	<div id="err_phonenum"></div>
	<br> Alamat : <input type="text" name="address" value="<% out.print(address);%>" onkeydown="enableButton()">
	<br> Provinsi :	<input type="text" name="province" value="<% out.print(province);%>" onkeydown="enableButton()">
	<br> Kecamatan : <input	type="text" name="kecamatan" value="<% out.print(state);%>" onkeydown="enableButton()">
	<br> Kode Pos : <input type="text" name="postalcode" value="<% out.print(postalcode);%>" onkeydown="enableButton()">
	<br> <input type="submit"
		id="subedit" value="Edit" disabled>
	<div id="edit_error"></div>
</form>
<% } %>

<jsp:include page="footer.jsp" />