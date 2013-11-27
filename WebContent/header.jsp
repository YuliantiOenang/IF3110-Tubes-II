<%@ page import = "javax.servlet.*"%>
<%@ page import = "javax.servlet.http.*"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "javax.sql.*"%>
<%@ page import = "javax.servlet.http.Cookie"%>

<% HttpSession ses = request.getSession(true);  %>
<%
boolean is_signedin=false;
boolean is_admin=false;
Cookie cookie = null;
Cookie[] cookies = null;
// Get an array of Cookies associated with this domain
cookies = request.getCookies();
if( cookies != null ){
	String usernamecookie;
   for (int i = 0; i < cookies.length; i++){
      cookie = cookies[i];
      if (cookie.getName().equals("cusername")) {
    	  usernamecookie=cookie.getValue();
    	  ses.setAttribute("user", usernamecookie);
      } 
   }
}
String user = (String)ses.getAttribute("user");
//ses.invalidate();
if (user==null) {
	is_signedin=false;
}else {
	is_signedin=true;
	if (user.equals("admin")) {
		is_admin=true;
	}
}
%>

<html>
<script language="javascript">

		function hideLoginForm() {
			document.getElementById("page-wrapper").style.display = "none";
		}

		function showLoginForm() {
			document.getElementById("page-wrapper").style.display = "block";
		}

		
	</script>
<head>
	<script language="javascript">
		function hideLoginForm() {
			document.getElementById("page-wrapper").style.display = "none";
		}

		function showLoginForm() {
			document.getElementById("page-wrapper").style.display = "block";
		}
	</script>
	</body>
	</html>
	
	
    <div id="light" class="white_content">
	<form name="login" method="post">
			Username: <input type="text" name="username"/><br/>
			Password: <input type="password" name="password"/><br/>
			<input type="submit" value="Login" name="submit"/>
		</form>
	<a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">Close</a></div>
    <div id="fade" class="black_overlay"></div>
	
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="styledetail.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="stylekartu.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="stylereg.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="stylesearch.css" rel="stylesheet" type="text/css" media="screen" />
	
	<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
	<div id="divsearch" >
		<form id="formuser" name="formsearch" action="search.jsp" method="get" tag="registrasi">
			<span id="tabuser">
				<% if (is_signedin==false) {%>
					<a href="registrasi.jsp" style="text-decoration:none;" > <span id="menuuser1" > <b>REGISTER &nbsp; &nbsp;  </b> </span> </a> &nbsp; &nbsp; 
					<a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'" style="text-decoration:none;"> <span id="menuuser2" > <b>LOGIN  &nbsp; &nbsp;   </b> </span> </a>  &nbsp; &nbsp					
				<%} else {
				%>
					<span id="welcome" > <b>&nbsp; &nbsp; Welcome , &nbsp; <%= user %> ! &nbsp; &nbsp;  </b> </span> </a> 
					<a id="menuuser2" style="text-decoration:none;" href="logout.jsp" ><b> LOG OUT </b></a> &nbsp; &nbsp; 
					<a href="profile.jsp" style="text-decoration:none;"> <span id="menuuser3" > <b>PROFIL  &nbsp; &nbsp;  </b> </span> </a>  &nbsp; &nbsp; 
					
				
					<span> <a href="cart.jsp" style="text-decoration:none;" ><img id="logotroli" src="images/cartlogo.png" height="22" width="22" > </span> &nbsp;
					
				<%} %> 
				
				
			</span>
			
		</form> 
		<form id="formsearch" name="formsearch" action="search.jsp" method="get" tag="registrasi">
			<a href="index.jsp"> <img id="logo" src="images/logo11.gif" height="60" width=auto > <br/>  <br/>
			<span id="tabkategori">
			<% if (is_admin==true) {%>
			<a href="admin.jsp?&kat=beras" style="text-decoration:none;" > <span id="menukategori1" > <b>BERAS &nbsp; &nbsp;  |</b> </span> </a> &nbsp; &nbsp; 
			<a href="admin.jsp?&kat=roti" style="text-decoration:none;"> <span id="menukategori2" > <b>ROTI  &nbsp; &nbsp;  | </b> </span> </a>  &nbsp; &nbsp;
			<a href="admin.jsp?&kat=daging segar" style="text-decoration:none;"> <span id="menukategori3" > <b>DAGING SEGAR   &nbsp; &nbsp;  |</b> </span> </a>  &nbsp; &nbsp; 
			<a href="admin.jsp?&kat=daging olahan" style="text-decoration:none;"> <span id="menukategori4" > <b>DAGING OLAHAN  &nbsp; &nbsp;  |</b> </span> </a>  &nbsp; &nbsp; 
			<a href="admin.jsp?&kat=sayur" style="text-decoration:none;"> <span id="menukategori5" > <b>SAYUR  &nbsp; &nbsp;  |</b> </span> </a>  &nbsp; &nbsp; 
			<a href="admin.jsp?&kat=buah" style="text-decoration:none;"> <span id="menukategori6" > <b>BUAH </b> </span> </a>  &nbsp; &nbsp;
			<%}else { %>
			<a href="barang.jsp?&kat=beras" style="text-decoration:none;" > <span id="menukategori1" > <b>BERAS &nbsp; &nbsp;  |</b> </span> </a> &nbsp; &nbsp; 
			<a href="barang.jsp?&kat=roti" style="text-decoration:none;"> <span id="menukategori2" > <b>ROTI  &nbsp; &nbsp;  | </b> </span> </a>  &nbsp; &nbsp;
			<a href="barang.jsp?&kat=daging segar" style="text-decoration:none;"> <span id="menukategori3" > <b>DAGING SEGAR   &nbsp; &nbsp;  |</b> </span> </a>  &nbsp; &nbsp; 
			<a href="barang.jsp?&kat=daging olahan" style="text-decoration:none;"> <span id="menukategori4" > <b>DAGING OLAHAN  &nbsp; &nbsp;  |</b> </span> </a>  &nbsp; &nbsp; 
			<a href="barang.jsp?&kat=sayur" style="text-decoration:none;"> <span id="menukategori5" > <b>SAYUR  &nbsp; &nbsp;  |</b> </span> </a>  &nbsp; &nbsp; 
			<a href="barang.jsp?&kat=buah" style="text-decoration:none;"> <span id="menukategori6" > <b>BUAH </b> </span> </a>  &nbsp; &nbsp;
			<%} %>
			
			
			</span> </br><br/>
			<input id="namasearch" name="namabarang" placeholder="Nama Barang" type="text"  /> 
			<select  id="kat" value="Kategori" name="kategori">
				<option value="" >Kategori</option>
				<option value="beras">Beras</option>
				<option value="roti">Roti</option>
				<option value="daging segar">Daging Segar</option>
				<option value="daging olahan">Daging Olahan</option>
				<option value="buah">Buah</option>
				<option value="sayur">Sayur</option>
			</select>
			<select id="harga" value="harga" name="harga">
				<option value="0" >Harga</option>
				<option value="1">< Rp 10.000</option>
				<option value="2">Rp 10.000 <= harga < Rp 25.000 </option>
				<option value="3">Rp 25.000 <= harga <  Rp 50.000 </option>
				<option value="4">Rp 50.000 <= harga <  Rp 75.000 </option>
				<option value="5">>= Rp 75.000</option>
			</select>
			<input id="tombol2" name="search" type="submit" value="search" /> 
		</form>
	</div>

</head>
<body>

<% if (request.getParameter("submit") != null) {
	boolean berhasil=false;
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	Connection conn=null;
	ResultSet result=null;
	Statement stmt=null;
	String loginmessage=null;
	ResultSetMetaData rsmd=null;
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	}
	catch(Exception e){
		System.out.println("Error!!!!!!" + e);
	}
	
	
	try {
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/tubesweb",
		 "root","");
		PreparedStatement stmt2 = conn.prepareStatement("select * from user where username='"+username+"' and password='"+password+"'");
		result=stmt2.executeQuery();
		int jumlah;
		try {
			result.last();
		    jumlah = result.getRow();
		    result.beforeFirst();
		}
		catch(Exception ex) {
			jumlah=0;
		}
		
		if (jumlah==1) {
			ses.setAttribute("user", username);
			
		   // Create cookies for first and last names.      
		   Cookie cusername = new Cookie("user",username);
		   Cookie cpassword = new Cookie("pass",password);

		   // Set expiry date after 24 Hrs for both the cookies.
		   cusername.setMaxAge(60*60*24*30); 
		   cusername.setMaxAge(60*60*24*30); 

		   // Add both the cookies in the response header.
		   response.addCookie( cusername );
		   response.addCookie( cpassword );

			berhasil=true;
		}
	}
	catch(SQLException e) {
		System.out.println("Error!!!!!!" + e);
	}
	
	if (berhasil==false) {
		%> <script type="text/javascript">
		alert("Could not login with username and password. Please try again.");	
	 </script><%
	} else {
		%> <script type="text/javascript">
		alert("login berhasil");
		window.location="index.jsp";
	 </script> <%
	}
} %>

