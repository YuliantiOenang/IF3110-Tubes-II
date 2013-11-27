<%@include file="header.jsp"%>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<html>
<head>
<title>detail </title>
</head>
<body>


	
<%
	/****************** dummy ********************///
	String idbarang = request.getParameter("idbarang");
	idbarang="11";
	/************************************* dummy *********************/
	String namabrg = "";
	int hrg = 0;
	int stock =  0;
	String path;
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
		
		Statement statement = conn.createStatement();
		String sql1="select * from barang where id = '"+idbarang+"'";
		
		ResultSet resultSet = statement.executeQuery(sql1);
		
		try {
		    resultSet.last();
		   	namabrg = resultSet.getString("namabarang");
			hrg= resultSet.getInt("harga");
			stock= resultSet.getInt("stok");
			path=resultSet.getString("path");
		
		%>
		<%
		 resultSet.beforeFirst();
		}
		catch(Exception ex) {
			
		}	
	}
	catch(SQLException e) {
		System.out.println("Error!!!!!!" + e);
	}
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	}
	catch(Exception e){
		out.write("Error!!!!!!" + e);
	}
	try {
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/tubesweb",
		 "root","");
		
		Statement statement = conn.createStatement();
		String sql1="select * from barang where id = '"+idbarang+"'";
		
		ResultSet resultSet = statement.executeQuery(sql1);
		
			    while (resultSet.next()) { %>
				<form id="form1" name="formregistrasi"  method="get" tag="registrasi">
				   Nama Barang <input id="namabarang" value="<%=namabrg %>" type="text" name="namabarang" /> <br />
				   Harga <input id="hargabarang"  value="<%=hrg %>" type="text" name="hargabarang" /> <br />
				   Stok  <input id="stokbarang"  value="<%=stock%>" type="number" min="1" name="stokbarang" /> &nbsp;&nbsp;&nbsp; 
			    	<input id="tomboleditbrg" name="tomboleditbrg" type="submit" value="Edit Barang"/>	
			   <form action="FileUploadServlet" method="post" enctype="multipart/form-data">
					Select File to Upload:<input type="file" name="fileName">
					<br>
					<input type="submit" value="Upload">
					</form>
			    
			    <%
			    }
		    }
		catch(SQLException e) {
			System.out.println("Error!!!!!!" + e);
		}

%>

<%
	
	if (request.getParameter("tomboleditbrg") != null) {
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
			
			String namabarang=request.getParameter("namabarang");
			Statement statement = conn.createStatement();
			String sql1="select * from barang where namabarang = '"+namabarang+"'";
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
			
			System.out.println(jumlah);
	
			if (jumlah==0 || (jumlah==1 && namabarang.equals(namabrg)==true)) {
				System.out.println(namabarang);
				System.out.println(request.getParameter("hargabarang"));
				System.out.println(request.getParameter("stokbarang"));
				PreparedStatement stmt2 = conn.prepareStatement("update barang set namabarang=?,harga=?,stok=? where id = '"+idbarang+"'");
				stmt2.setString(1, request.getParameter("namabarang"));
				stmt2.setInt(2, Integer.parseInt(request.getParameter("hargabarang")));
				stmt2.setInt(3, Integer.parseInt(request.getParameter("stokbarang")));
	
				int count = stmt2.executeUpdate();
				if (count==0) {
					%> <script type="text/javascript">
					alert("gagal Merubah Barang");	
				 </script> <%
				} else {
					%> <script type="text/javascript">
					alert("berhasil Merubah Barang");	
				 </script> <%
				}
				%> <script> window.location="admin.jsp"; </script><% 
			} else {
				%> <script type="text/javascript">
				alert("gagal Merubah Barang");	
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