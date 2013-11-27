<%@include file="header.jsp"%>
<html>
<body>
<script type="text/javascript" >
	function emailHint(str,pass) {
		document.getElementById("tombolreg").disabled = false;
		if (str.length==0) { 
			document.getElementById("txtHint").innerHTML="";
			document.getElementById("tombolreg").disabled = true;
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
				if (xmlhttp.responseText=="") {
					document.getElementById("tombolreg").disabled = false;
				} else {
					document.getElementById("tombolreg").disabled = true;
				}
			}
		};
		xmlhttp.open("GET","GetHint?data="+str+"&jenis=email&pass="+pass,true);
		xmlhttp.send();
	}
	
	function userHint(str,pass) {
		if (str.length==0) { 
			document.getElementById("userHint").innerHTML="";
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				document.getElementById("userHint").innerHTML=xmlhttp.responseText;
			}
		};
		xmlhttp.open("GET","GetHint?data="+str+"&jenis=user&pass="+pass,true);
		xmlhttp.send();
	}
	
	function passHint(str,username) {
		if (str.length==0) { 
			document.getElementById("passHint").innerHTML="";
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				document.getElementById("passHint").innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET","GetHint?data="+str+"&jenis=pass&user="+username,true);
		xmlhttp.send();
	}
	function cpassHint(str,password) {
		if (str.length==0) { 
			document.getElementById("cpassHint").innerHTML="";
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				document.getElementById("cpassHint").innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET","GetHint?data="+str+"&jenis=cpass&password="+password,true);
		xmlhttp.send();
	}
	
	function namaHint(str) {
		if (str.length==0) { 
			document.getElementById("namaHint").innerHTML="";
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				document.getElementById("namaHint").innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET","GetHint?data="+str+"&jenis=nama",true);
		xmlhttp.send();
	}
</script>
<% 
	if (user!=null) {
		is_signedin=false;
		%> <script> window.location="index.jsp"; </script><% 
	}
%>
<div id="divreg">
<form id="form1" name="formregistrasi"  method="get" tag="registrasi">
	   Username <input id="username" type="text" name="username" onkeyup="userHint(this.value,password.value)" /> &nbsp;&nbsp;&nbsp; <span id="userHint" ></span>  <br />
	   Password <input id="password" type="password" name="password" onkeyup="passHint(this.value,username.value)" /> &nbsp;&nbsp;&nbsp; <span id="passHint" ></span> <br />
	   Confirm Password   <input id="confirm" type="password" name="cnfrm" onkeyup="cpassHint(this.value,password.value)" /> &nbsp;&nbsp;&nbsp; <span id="cpassHint" ></span> <br />
	   Nama Lengkap       <input id="nama1" type="text" name="namalengkap" onkeyup="namaHint(this.value)" /> &nbsp;&nbsp;&nbsp; <span id="namaHint" > </span> <br />
	   Email              <input id="email" type="email" name="email" onkeyup="emailHint(this.value,password.value)" />&nbsp;&nbsp;&nbsp; <span id="txtHint" ></span> <br />
	   Nomor HP           <input id="hp" type="text" name="hp"/><br />
	   Alamat			  <input id="alamat" type="text" name="almt"/><br />
	   Kabupaten          <input id="kab" type="text" name="kab"/><br />
	   Provinsi           <input id="prov" type="text" name="prov"/> <br/>
	   Kode Pos           <input id="kode" type="text" name="kode" /><br />
	<input id="tombolreg" name="tombolreg" type="submit" value="register" disabled="disabled"/>	
</form>
</div>
<%
	
	if (request.getParameter("tombolreg") != null) {
		Connection conn=null;
		ResultSet result=null;
		Statement stmt=null;
		ResultSetMetaData rsmd=null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}
		catch(Exception e){
			out.write("Error!!!!!!" + e);
		}
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/tubesweb",
			 "root","");
			
			String nama=request.getParameter("username");
			Statement statement = conn.createStatement();
			String sql1="select * from user where username = '"+nama+"'";
			ResultSet resultSet = statement.executeQuery(sql1);
			int jumlah;
			try {
			    resultSet.last();
			    jumlah = resultSet.getRow();
			    resultSet.beforeFirst();
			}
			catch(Exception ex) {
				jumlah=0;
			}		
			String email=request.getParameter("email");
			String sql2="select * from user where email = '"+email+"';";
			ResultSet resultSet2 = statement.executeQuery(sql2);
			int jumlah2;
			try {
			    resultSet.last();
			    jumlah2 = resultSet.getRow();
			    resultSet.beforeFirst();
			}
			catch(Exception ex) {
				jumlah2=0;
			}		
			
			if (jumlah==0 && jumlah2==0) {
				PreparedStatement stmt2 = conn.prepareStatement("insert into user (username,email,fullname,password,alamat,kabupaten,provinsi,kodepos,telepon,nokartukredit,namadikartu,dateexp,cookie_id,cookie_expire)value(?,?,?,?,?,?,?,?,?,null,null,null,null,null)");
				stmt2.setString(1, nama);
				stmt2.setString(2, email);
				stmt2.setString(3, request.getParameter("namalengkap"));
				stmt2.setString(4, request.getParameter("password"));
				stmt2.setString(5, request.getParameter("almt"));
				stmt2.setString(6, request.getParameter("kab"));
				stmt2.setString(7, request.getParameter("prov"));
				stmt2.setString(8, request.getParameter("kode"));
				stmt2.setString(9, request.getParameter("hp"));
				stmt2.executeUpdate();
				ses.setAttribute("user",nama);
				
			   // Create cookies for first and last names.      
			   Cookie cusername = new Cookie("user",nama);
			   Cookie cpassword = new Cookie("pass",request.getParameter("password"));

			   // Set expiry date after 24 Hrs for both the cookies.
			   cusername.setMaxAge(60*60*24*30); 
			   cusername.setMaxAge(60*60*24*30); 

			   // Add both the cookies in the response header.
			   response.addCookie( cusername );
			   response.addCookie( cpassword );
				if (conn != null){
					conn.close();
				}
				%> <script> window.location="registrasikartu.jsp"; </script><% 
			}else {
				%> <script type="text/javascript">
				alert("registrasi gagal, username/email telah digunakan");	
			 </script> <%
			}
		}
		catch(SQLException e) {
			System.out.println("Error!!!!!!" + e);
		}
	}
%>
</body>
</html>