<%@include file="header.jsp"%>
<html>
<head>
<title>detail </title>
</head>
<body>
	
<%
	/****************** dummy ********************/
	String idbarang = request.getParameter("idb");
	
	Connection conn=null;
	ResultSet result=null;
	Statement stmt=null;
	ResultSetMetaData rsmd=null;
	String nama = ses.getAttribute("user").toString();
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
		
			    while (resultSet.next()) {
			    	%> <div id="divdetail">
			    	<form id="formdetail" name="formaddcart"  method="post" ></br>
			    	<img src="<%= resultSet.getString("path")%>" width="150" height="150"/><br>
			    	Nama : <%= resultSet.getString("namabarang")%> <br>
			    	Harga : <%= resultSet.getString("harga")%><br>
			    	Keterangan : <%= resultSet.getString("keterangan")%><br>
			    	Permintaan : <input type="text"/><br>
			    	Jumlah : <input type="text"  id="jumlah" name="jumlah" />
			    	<input type="submit" value="add to cart" id="addcart" name="addcart"/>
			    	<br><br><br></form></div><%
			    }
		    }
		catch(SQLException e) {
			System.out.println("Error!!!!!!" + e);
		}
	
	if (request.getParameter("addcart") != null) {
		idbarang = request.getParameter("idb");
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
			String sql2 = "select * from barang where id='"+idbarang+"'";
			
			ResultSet resultSet2 = stat2.executeQuery(sql2);
			int stok = 0;
			while (resultSet2.next()) {
				stok = resultSet2.getInt("stok");
			}
			int jml = Integer.parseInt(request.getParameter("jumlah"));
			
			if (stok==0) {
				%>Maaf, stok habis<br><%
			}
			else if (jml > stok) {
				%>Maaf, stok tidak mencukupi, sisa stok : <%= stok %><br><%
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
				String idn = Integer.toString(idnext);
    			PreparedStatement stat1 = conn.prepareStatement("insert into cart (id,user,idbarang,jumlah,beli)value(?,?,?,?,?)");
    			stat1.setInt(1, a);
    			stat1.setString(2, nama);
    			stat1.setString(3, idbarang);
    			stat1.setString(4, request.getParameter("jumlah"));
    			stat1.setString(5, "0");
    			
    			stat1.executeUpdate();
    			%><script>window.location("detail.jsp?&idb='"+idbarang+"'");</script><%
			}
			
			
		}
		catch(SQLException e) {
			System.out.println("Error!!!!!!" + e);
		}
	}
	
	
	

	
	
%>

</body>
</html>