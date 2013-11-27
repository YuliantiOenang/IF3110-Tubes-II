<%@include file="header.jsp"%>
<html>
<head>
<title>Edit Profile </title>
</head>
<body>

<script type="text/javascript" >
	
	function userHint(str,pass) {
		if (str.length==0) { 
			document.getElementById("userHint2").innerHTML="";
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				document.getElementById("userHint2").innerHTML=xmlhttp.responseText;
			}
		};
		xmlhttp.open("GET","GetHint?data="+str+"&jenis=user&pass="+pass,true);
		xmlhttp.send();
	}
	
	function emailHint(str,pass) {
		//document.getElementById("tombolreg").disabled = false;
		if (str.length==0) { 
			document.getElementById("txtHint2").innerHTML="";
			//document.getElementById("tombolreg").disabled = true;
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				document.getElementById("txtHint2").innerHTML=xmlhttp.responseText;
				/*if (xmlhttp.responseText=="") {
					document.getElementById("tombolreg").disabled = false;
				} else {
					document.getElementById("tombolreg").disabled = true;
				}*/
			}
		};
		xmlhttp.open("GET","GetHint?data="+str+"&jenis=email&pass="+pass,true);
		xmlhttp.send();
	}
	
	function passHint(str,username) {
		if (str.length==0) { 
			document.getElementById("passHint2").innerHTML="";
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				document.getElementById("passHint2").innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET","GetHint?data="+str+"&jenis=pass&user="+username,true);
		xmlhttp.send();
	}
	function cpassHint(str,password) {
		if (str.length==0) { 
			document.getElementById("cpassHint2").innerHTML="";
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				document.getElementById("cpassHint2").innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET","GetHint?data="+str+"&jenis=cpass&password="+password,true);
		xmlhttp.send();
	}
	
	function namaHint(str) {
		if (str.length==0) { 
			document.getElementById("namaHint2").innerHTML="";
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				document.getElementById("namaHint2").innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET","GetHint?data="+str+"&jenis=nama",true);
		xmlhttp.send();
	}
</script>


<%
		/************************************* dummy *********************/
		String nama = "";
		String pwd = "";
		String namalengkap =  "";
		String telepon =  "";
		String alamat = "";
		String kabupaten =  "";
		String provinsi =  "";
		String kodepos =  "";
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
			
			nama = ses.getAttribute("user").toString();
			Statement statement = conn.createStatement();
			String sql1="select * from user where username = '"+nama+"'";
			
			ResultSet resultSet = statement.executeQuery(sql1);
			
			try {
			    resultSet.last();
			   	pwd = resultSet.getString("password");
				namalengkap = resultSet.getString("fullname");
				telepon = resultSet.getString("telepon");
				alamat = resultSet.getString("alamat");
				kabupaten = resultSet.getString("kabupaten");
				provinsi = resultSet.getString("provinsi");
				kodepos = resultSet.getString("kodepos");
			
			%>
			
			<div id="divreg">
			<form id="form1" name="formregistrasi"   method="get" tag="registrasi">
				
				Passsword <input id="password" type="password" name="password" onkeyup="passHint(this.value,'<%= nama %>')" /> &nbsp;&nbsp;&nbsp; <span id="passHint2" ></span><br>
				Confirm Passsword <input id="confirm" type="password" name="confirm" onkeyup="cpassHint(this.value,password.value)" /> &nbsp;&nbsp;&nbsp; <span id="cpassHint2" ></span><br>
				Nama Lengkap  &nbsp;     <input id="nama1" type="text" name="namalengkap" value='<%=namalengkap %>' onkeyup="namaHint(this.value)" /> &nbsp;&nbsp;&nbsp; <span id="namaHint2" > </span><br>
				Nomor HP   &nbsp;        <input id="hp" type="text" name="hp" value='<%=telepon %>'/><br>
				Alamat		&nbsp;	 	<input id="alamat" type="text" name="almt" value='<%=alamat%>'/><br>
				Kabupaten   &nbsp;       <input id="kab" type="text" name="kab" value='<%=kabupaten%>'/><br>
				Provinsi    &nbsp;       <input id="prov" type="text" name="prov" value='<%=provinsi %>'/> <br>
				Kode Pos    &nbsp;       <input id="kode" type="text" name="kode" value='<%=kodepos %>'/><br>
				<input id="tombolreg" name="save" type="submit" value="Save" />	
			</form>
			</div>
			
			<%
			 resultSet.beforeFirst();
			}
			catch(Exception ex) {
				
			}	
		}
		catch(SQLException e) {
			System.out.println("Error!!!!!!" + e);
		}
%>
<%
if (request.getParameter("save") != null) {
	System.out.println(request.getParameter("kode"));
	System.out.println(kodepos);
	if (pwd.equals(request.getParameter("password"))
		&& namalengkap.equals(request.getParameter("namalengkap")) 
		&& telepon.equals(request.getParameter("hp")) && alamat.equals(request.getParameter("almt"))
		&& kabupaten.equals(request.getParameter("kab")) && provinsi.equals(request.getParameter("prov"))
		&& kodepos.equals(request.getParameter("kode"))) {
		%> 
		<script type="text/javascript"> alert("Tidak ada perubahan yang disimpan"); window.location="profile.jsp"; </script><%
	}
	else {
		
		conn=null;
		result=null;
		stmt=null;
		rsmd=null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}
		catch(Exception e){
			out.write("Error!!!!!!" + e);
		}
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/tubesweb",
			 "root","");
			
				PreparedStatement stmt2 = conn.prepareStatement("update user set fullname=?,password=?,alamat=?,kabupaten=?,provinsi=?,kodepos=?,telepon=? where username = '"+nama+"'");
				stmt2.setString(1, request.getParameter("namalengkap"));
				stmt2.setString(2, request.getParameter("password"));
				stmt2.setString(3, request.getParameter("almt"));
				stmt2.setString(4, request.getParameter("kab"));
				stmt2.setString(5, request.getParameter("prov"));
				stmt2.setString(6, request.getParameter("kode"));
				stmt2.setString(7, request.getParameter("hp"));

	
				int count = stmt2.executeUpdate();
				if (count==0) {
					%> <script type="text/javascript">
					alert("Failed to Edit Profile");	
				 </script> <%
				}
				%> <script> window.location="profile.jsp"; </script><% 
			
		}

		catch(SQLException e) {
			System.out.println("Error!!!!!!" + e);
		}
	}
}
%>


</body>
</html>