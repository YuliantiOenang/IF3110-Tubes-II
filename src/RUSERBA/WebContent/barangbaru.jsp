<%@include file="header.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript" src="js/barangbaru.js"></script> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Barang Baru</title>
</head>
<body>

<form method="post" action="UploadServlet" enctype="multipart/form-data">
	<h1>Data Barang Baru</h1><br>
	<pre><span>(*) Data harus diisi</span></pre> 
	<pre>Nama*			<input type="text" name="nama" id="nama"/><span id="namaErr"></span></pre>
	Kategori barang: 
              <pre> <select name="kategori">
                  	<% try {
			       		// Register JDBC driver
			       		Class.forName("com.mysql.jdbc.Driver");
			    		// Open a connection
			    		Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
	        			// Execute SQL query
	        			Statement stmt = conn.createStatement();
	        			String sql;
	        			sql = "SELECT DISTINCT category FROM product";
	        			ResultSet rs = stmt.executeQuery(sql);
		
	        			// Extract data from result set
	        			while(rs.next()){ 
	        				//Retrieve by column name
			        		String category = rs.getString("category");
	       			%>
					<option value= <%= category %>>	        			
		        		<%
		        		//Display values
			        	out.print(category); %>
			        </option>
			       		<%	}
		
			        	// Clean-up environment
			        	rs.close();
			        	stmt.close();
			        	conn.close();
			        } catch(SQLException se) {
			        	//Handle errors for JDBC
			        	out.println("Not connected to SQL database");
			        	se.printStackTrace();
			        } catch(Exception e) {
			        	//Handle errors for Class.forName
			        	out.println("Exception");
			        	e.printStackTrace();
			        } %>
				</select> </pre>
	
		
	<pre>Deskripsi		<br><textarea class="text_input" cols="50" rows="4" name="deskripsi" id="deskripsi"></textarea></pre>
	<pre>Harga*			<input type="text" name="harga"id="harga"/><span id="hargaErr"></span></pre>
	<pre>Gambar*		<input type="file" name="gambar" id="gambar"/><span id="gambarErr"></span></pre>
		
	<input type="submit" value="Barang baru!" id="submit_btn"> 
</form>

</body>
</html>