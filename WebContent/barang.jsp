<%@include file="header.jsp"%>
<html>
<head>
<title>barang </title>
</head>
<body>
	<form id="sorting" name="sorting" method="get">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;<select  name="sorting" id="sorting">
				<option value="">Sorting...</option>
				<option value="nama" >Nama</option>
				<option value="harga">Harga</option>
	</select></form>
<% 
	/******************* dummy ******************/
	String kategori = request.getParameter("kat");
	Connection conn=null;
	ResultSet result=null;
	Statement stmt=null;
	ResultSetMetaData rsmd=null;
	String id = "0";
	String nama = "";
	String urut = request.getParameter("sorting");
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
		String sql1="";
		if (urut==null) {
			sql1="select * from barang where kategori = '"+kategori+"'";
		}
		else if (urut.compareTo("nama")==0) {
			sql1="select * from barang where kategori = '"+kategori+"' order by namabarang";
		}else if (urut.compareTo("harga")==0) {
			sql1="select * from barang where kategori = '"+kategori+"' order by harga";
		}
		
		
		
		ResultSet resultSet = statement.executeQuery(sql1);
		nama = ses.getAttribute("user").toString();
				int i=0;
			    while (resultSet.next()) {
			    	id = resultSet.getString("id");
			    	if (i%2==0) {
				    	%> <div id="divproduct">
				    	<form id="formproduct1" name="formaddcart"  method="post" >
				    	<img src="<%= resultSet.getString("path")%>" width="150" height="150"/><br>
				    	Nama : <a href="detail.jsp?&idb=<%= id %>" ><%= resultSet.getString("namabarang")%></a> <br>
				    	Harga : <%= resultSet.getString("harga")%><br>
				    	Jumlah : <input type="text" id="jumlah" name="jumlah"/>
				    	<input type="submit" value="add to cart" id="addcart" name="addcart"/>
				    	<br><br><br></form></div><%
			    	} else {
			    		%> <div id="divproduct">
				    	<form id="formproduct2" name="formaddcart"  method="post" >
				    	<img src="<%= resultSet.getString("path")%>" width="150" height="150"/><br>
				    	Nama : <a href="detail.jsp?&idb=<%= id %>" ><%= resultSet.getString("namabarang")%></a> <br>
				    	Harga : <%= resultSet.getString("harga")%><br>
				    	Jumlah : <input type="text" id="jumlah" name="jumlah"/>
				    	<input type="submit" value="add to cart" id="addcart" name="addcart"/>
				    	<br><br><br></form></div><%
			    		
			    	}
			    
			    	
			    	i++;
			    		
			    	
			    }
		    }
		catch(SQLException e) {
			System.out.println("Error!!!!!!" + e);
		}
	
	if (request.getParameter("addcart") != null) {
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
			
			Statement stat2 = conn.createStatement();
			String sql2 = "select * from barang where id='"+id+"'";
			ResultSet resultSet2 = stat2.executeQuery(sql2);
			int stok = 0;
			while (resultSet2.next()) {
				stok = resultSet2.getInt("stok");
			}
			int jml = Integer.parseInt(request.getParameter("jumlah"));
			if (stok==0) {
				%><br> Maaf, stok habis<%
			}
			else if (jml > stok) {
				%><br> Maaf, stok tidak mencukupi, sisa stok : <%= stok %><%
			}
			else {
				int idnext = 0;
				Statement stat3 = conn.createStatement();
				String sql3 = "select * from cart";
				int a = 1;
				ResultSet rs = stat3.executeQuery(sql3);
				while (rs.next()) {
					a++;
				}
				id = request.getParameter("idba");
				String idn = Integer.toString(idnext);
    			PreparedStatement stat1 = conn.prepareStatement("insert into cart (id,user,idbarang,jumlah,beli)value(?,?,?,?,?)");
    			stat1.setInt(1, a);
    			stat1.setString(2, nama);
    			stat1.setString(3, "7");
    			stat1.setString(4, request.getParameter("jumlah"));
    			stat1.setString(5, "0");
    			
    			stat1.executeUpdate();
    			%><script>window.location("barang.jsp?&kat='"+kategori+"'");</script><%
				
			}
			
			
		}
		catch(SQLException e) {
			System.out.println("Error!!!!!!" + e);
		}
	}
	

%>

</body>
</html>