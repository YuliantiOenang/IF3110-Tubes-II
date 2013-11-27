<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
	Connection con = null;
	String[] data = new String[8];
	
	try {
		try { 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}catch(ClassNotFoundException ce){out.println(ce);} 
   
		con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
		
		PreparedStatement st;
		String query = "SELECT * FROM user WHERE username=?";
			
		st = con.prepareStatement(query);
		st.setString(1, request.getParameter("username"));
		
		ResultSet rs;
		rs = st.executeQuery();
		
		if (rs.next()) {

	
%>

<script src="validator.js"></script>
<!DOCTYPE html>
<script>
	function validasi(){
		p = document.forms['dataForm']['pass'].value;
		cp = document.forms['dataForm']['cpass'].value;
		nl = document.forms['dataForm']['nl'].value;
		e = document.forms['dataForm']['ema'].value;
		alert(cp);
		valp(p);
		valcp(cp);
		valnl(nl);
		valemail(e);
		button();
	}
	
	function button(){
		hp = document.forms['dataForm']['nh'].value;
		al = document.forms['dataForm']['al'].value;
		pr = document.forms['dataForm']['prov'].value;
		kab = document.forms['dataForm']['kab'].value;
		kp = document.forms['dataForm']['kp'].value;
		if (ulength && elength && vun && vp && vcp && vnl && vemail && (hp.length>0) && (al.length>0) && (pr.length>0) && (kab.length>0) && (kp.length>0))
		{
			if (!buttonon) {
				document.getElementById('buttonRegister').innerHTML="<button class=\"button\" onclick=\"clicked()\" >daftar</button>";
				buttonon = true;
			}
		}
		else
		{
			document.getElementById('buttonRegister').innerHTML="<button class=\"buttonFake\" disabled>daftar</button>";
			buttonon = false;
		}
	}
	
	function editProfile() {
		var s = "<h1>Profile</h1><form id='dataForm'>";
		s+="<h2>Password: <BR><input type='password' name='pass' class='textInput'></input><div id='vp'></h2>";
		s+="<h2>Confirm Password: <BR><input type='password' name='cpass' class='textInput'></input> <div id='vcp'></div></h2>";
		s+="<h2>Nama Lengkap: <BR><input type='text' name='nl' class='textInput'></input><div id='vnl'></div></h2>";
		s+="<h2>Email: <BR><input type='text' name='ema' class='textInput'></input><div id='vemail'></div><div id='vemail2'></div></h2>";
		s+="<h2>Alamat: <BR><input type='text' name='al' class='textInput'></input></h2>";
		s+="<h2>Provinsi: <BR><input type='text' name='prov' class='textInput'></input></h2>";
		s+="<h2>Kota: <BR><input type='text' name='kab' class='textInput'></input></h2>";
		s+="<h2>Kode Pos: <BR><input type='text' name='kp' class='textInput'></input></h2>";
		s+="<h2>No Hp: <BR><input type='text' name='nh' class='textInput'></input></h2>";
		s+="</form><button id='editableButton' class=' button' onclick='submitData()'>Submit</button>";
		s+="<button class='button' onclick='cancelEdit()'>Cancel</button>";		
		document.getElementById("profileView").innerHTML = s;
		
		window.setInterval("validasi()",200);
	}
	
	function submitData() {
		postForm("editProfile.jsp?username="+localStorage.getItem('activeUser'), function()
			{
				if (xmlhttp.readyState==4) {
					alert(xmlhttp.responseText);
					alert("profil berhasil diedit!");
					document.location.href = "profile.jsp?username="+localStorage.getItem('activeUser');
				}
			}, document.forms["dataForm"]
		);
	}
	
	function cancelEdit() {
		document.location.href = "profile.jsp?username="+localStorage.getItem('activeUser');
	}
	
</script>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="letoy.css">
	<link rel="stylesheet" type="text/css" href="profile.css">
	<script src="header.js"></script>
	<script src="ajaxLoader.js"></script>
</head>

<body>
	<div id="topBorder"></div>
	<div id="contentArea">
		<div id='profileView'>
			<h1>Profile</h1>
			<h2>Username : <%= rs.getString(1) %></h2>
			<h2>Nama Lengkap: <%= rs.getString(3) %></h2>
			<h2>Email : <%= rs.getString(10) %></h2>
			<h2>Alamat : <%= rs.getString(4) %></h2>
			<h2>Provinsi: <%= rs.getString(5) %></h2>
			<h2>Kota : <%= rs.getString(6) %></h2>
			<h2>Kode Pos : <%= rs.getString(7) %></h2>
			<h2>No Hp: <%= rs.getString(8) %></h2>
			<h2>Jumlah Transaksi: <%= rs.getString(11)%></h2>
			<button id="editableButton" class="button" onclick="editProfile()">Edit Profile</button>
		</div>
	</div>
	<div id="header">
		<script>drawHeaderContent();</script>
	</div>
</body>
<% 	}
		
		st.clearParameters();
		con.close();
	} catch (Exception e) {out.println(e.toString()); };
%>
</html>