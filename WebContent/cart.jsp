<%@include file="header.jsp"%>
<html>
<head>
<title>cart </title>
</head>
<body>
	
<% 
	/************************************* dummy *********************/
	String nama = ses.getAttribute("user").toString();
	Connection conn=null;
	ResultSet result=null;
	Statement stmt=null;
	ResultSetMetaData rsmd=null;
	int i = 0;
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
		String sql1="select * from cart where user = '"+nama+"'";
		int total= 0;
		ResultSet resultSet = statement.executeQuery(sql1);
		
			    while (resultSet.next()) {
			    	String jml = resultSet.getString("jumlah");
			    	int id = resultSet.getInt("id");
			    	Statement statement2 = conn.createStatement();
			    	String sql2 = "select * from barang where id='"+resultSet.getString("idbarang")+"'";
			    	ResultSet resultSet2 = statement2.executeQuery(sql2);
			    	String idx = Integer.toString(i);
			    	while (resultSet2.next()) {
			    		if (resultSet.getInt("beli")==0) {
					    	total += resultSet2.getInt("harga") * resultSet.getInt("jumlah");
					    	%> <div id="divpetunjuk2">
					    	<form id="formpetunjuk2" name="formbeli"  method="get" >
					    	<img src="<%= resultSet2.getString("path")%>" width="150" height="150"/><br>
					    	<input type="hidden" name="<%= idx %>" value="<%= id %>"/>
					    	Nama : <a href="detail.jsp"><%= resultSet2.getString("namabarang")%></a> <br>
					    	Harga : <%= resultSet2.getString("harga")%><br>
					    	Jumlah : <input id="jumlah<%= i%>" name="jumlah<%=i%>" type="text" value="<%= jml %>"/>
					    	
					    	<br><br><br><%
			    		}
			    		
			    	}
			    	i++;
			    }
			    %>Harga Total = <%= total%><br>
			    </div>
			    <input id="tombolreg" type="submit"  name="beli" value="beli"/>
			    <input id="tombolreg" type="submit"  name="update" value="update"/>
			    </form><%
		    }
		catch(SQLException e) {
			System.out.println("Error!!!!!!" + e);
		}
		
	
	if (request.getParameter("beli") != null) {
		
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
			Statement statement = conn.createStatement();
			PreparedStatement statement2 = conn.prepareStatement("update cart set beli=1 where user = '"+nama+"'");
			statement2.executeUpdate();
			String sql1="select * from cart where user = '"+nama+"'";
			ResultSet resultSet = statement.executeQuery(sql1);
			while (resultSet.next()) {
				Statement statement4 = conn.createStatement();
				String sql2="select * from barang where id = '"+resultSet.getString("idbarang")+"'";
				ResultSet resultSet2 = statement4.executeQuery(sql2);
				
				while (resultSet2.next()) {
					PreparedStatement statement3 = conn.prepareStatement("update barang set stok=? where id = '"+resultSet.getString("idbarang")+"'");
					statement3.setInt(1, resultSet2.getInt("stok") - resultSet.getInt("jumlah"));
					statement3.executeUpdate();
				}
				
			}
			%><script> alert("Transaksi Sukses"); window.location="index.jsp"</script><%
		}
		catch(SQLException e) {
			System.out.println("Error!!!!!!" + e);
		}
		
	}
	else if (request.getParameter("update") != null) {
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
			for (int j=0; j<i; j++) {
				String s = request.getParameter(Integer.toString(j));
				PreparedStatement statement3 = conn.prepareStatement("update cart set jumlah=? where id = '"+s+"'");
				statement3.setString(1, request.getParameter(("jumlah").concat(Integer.toString(j))));
				statement3.executeUpdate();
			}
			%><script> window.location="cart.jsp"</script><%
		}
		catch(SQLException e) {
			System.out.println("Error!!!!!!" + e);
		}
	}
	
%>

</body>
</html>