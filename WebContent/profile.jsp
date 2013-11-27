<%@include file="header.jsp"%>
<html>
<head>
<title>profile </title>
</head>
<body>

<%
		/************************** dummy ***********************/
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
			
			String nama = ses.getAttribute("user").toString();
			Statement statement = conn.createStatement();
			String sql1="select * from user where username = '"+nama+"'";
			
			ResultSet resultSet = statement.executeQuery(sql1);
			
			try {
			    resultSet.last();
			   
			   
			
			%>
			
<div id="divpetunjuk2">
<form id="formpetunjuk2" name="formregistrasi">
			Username  &nbsp; : <br><%= resultSet.getString("username") %><br> <br>
			Email  &nbsp; : <br><%= resultSet.getString("email") %><br><br>
			Nama Lengkap  &nbsp; :<br> <%= resultSet.getString("fullname") %><br> <br>
			Alamat  &nbsp; : <br><%= resultSet.getString("alamat") %><br><br>
			Kota/Kabupaten &nbsp; :<br> <%= resultSet.getString("kabupaten") %><br> <br>
			Provinsi  &nbsp; : <br><%= resultSet.getString("provinsi") %><br><br>
			Kodepos  &nbsp; : <br><%= resultSet.getString("kodepos") %><br><br>
			No HP  &nbsp; :<br> <%= resultSet.getString("telepon") %><br><br>
			Jumlah Transaksi  &nbsp; : <br><% %><br>
			</form>
			<button id="tombolreg" type="button" onclick="edit()">Edit Profile  </button>
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


<script> function edit() {
	window.location="editprofile.jsp";
	}
</script>


</body>
</html>