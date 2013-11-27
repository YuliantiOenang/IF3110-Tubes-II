<%@include file="header.jsp"%>
<html>
<head>
<title>barang </title>
</head>
<body>

    
<% 
	/******************* dummy ******************/
	String kategori = request.getParameter("kat");
	
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
		
		String sql1="select * from barang where kategori = '"+kategori+"'";
		
		ResultSet resultSet = statement.executeQuery(sql1);
				int i=0;
			    while (resultSet.next()) {
			    	String path=resultSet.getString("path");
		           		int id=resultSet.getInt("id");
		           		String namabrg= resultSet.getString("namabarang");
		           		int hargab=resultSet.getInt("harga");
		           		if (i%2==0) {
		           		%> 
		           		
		           		<%
		           		%>
		           			<div id="divresult">
							<form id="formresult" name="formregistrasi" >
							<img src='<%= path%>' height="100" width="100" > </br>
							<span id="resultnama"> <a href="detailProduct.php?id=',$result['id'] ,'"> <b> <%= namabrg%></b> </a>   </span> 
							<span id=resultharga> <%= hargab%> IDR</span> </br>
							<input id="tomboldelete" name="tomboldelete" type="submit" value="delete" />	
							<input id="tomboledit" name="tomboledit" type="submit" value="edit" />	
							</form>
							</div>'
		           		<%} else {
		           		%>
		           			<div id="divresult">
		    				<form id="formresult2" name="formregistrasi" >
		    				<img src='<%= path%>' height="100" width="100" > </br>
		    				<span id="resultnama"> <a href="detailProduct.php?id=',$result['id'] ,'"> <b> <%= namabrg%></b> </a>   </span>
							<span id=resultharga> <%= hargab%> IDR</span> </br>
							<input id="tomboldelete" name="tomboldelete" type="submit" value="delete" />	
							<input id="tomboledit" name="tomboledit" type="submit" value="edit" />	
		    				</form>
		    				</div>	
		           		<%	
		           		}
		           		i++;
			    	
			    }
		    }
		catch(SQLException e) {
			System.out.println("Error!!!!!!" + e);
		}
%>

<% if (request.getParameter("tomboledit")!=null) {
	%> <script> window.location="editbarang.jsp"; </script><%
	
} %>

</body>
</html>