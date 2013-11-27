<%@ page import = "java.sql.*"%>
<%@ page import = "javax.sql.*"%>
<%@ page import = "java.util.regex.Matcher"%>
<%@ page import = "java.util.regex.Pattern"%>
<%@ page import = "java.util.Date.*"%>

<%@include file="header.jsp"%>
<html>
<body>

<div id="divkartu">
<form  id="form2" name="formkartukredit" method="GET" ">
	Card Number <input id="nomor" name="nomorkartu" type="text"  />   <br />
	Name on Card <input id="namakartu" name="namakartu" type="text"  />  <br />
	Date Expired  <input id="tanggal" name="tanggalexp" type="date" /> <br />
	<input id="tombolkartu" name="register" type="submit" value="register"   /> 
	<input id="tombolskip" name="skip" type="submit" value="skip" onclick="window.location='index.jsp'; return false;"   />
	
</form>
</div>
</body>
</html>

<%	
	if (request.getParameter("register") != null) {
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
			String nomor=request.getParameter("nomorkartu");
			String nama=request.getParameter("namakartu");
			String username=(String) ses.getAttribute("user");

			Pattern pattern1= Pattern.compile("^[_0-9]{10,}$");
			Pattern pattern2= Pattern.compile("^[_A-Za-z0-9]* [_A-Za-z0-9]*$");
			
			Matcher m=(pattern1).matcher(nomor);
			Matcher m2=(pattern2).matcher(nama);
	    	if (m.matches()==true && m2.matches()==true) {
	    		
	    		Statement statement = conn.createStatement();
	    		PreparedStatement stmt2 = conn.prepareStatement("UPDATE user SET nokartukredit=?,namadikartu=?,dateexp=? WHERE username='"+username+"'");
				stmt2.setString(1,nomor);
				stmt2.setString(2,nama);
				stmt2.setString(3,request.getParameter("tanggalexp"));
				int row=stmt2.executeUpdate();
				if (row==0) {
					%><script type="text/javascript">
					alert("Data yang dimasikkan tidak valid");		
					 </script><%
				}else {
					if (conn != null){
						conn.close();
					}
					%><script> window.location="index.jsp"; </script> <%
				}
	    	} else {
	    		%><script type="text/javascript">
				alert("Registrasi Gagal, Silahkan Ulangi");		
				 </script><%
	    	}		
		}
		catch(SQLException e) {
			System.out.println("Error!!!!!!" + e);
		}
	}
%>