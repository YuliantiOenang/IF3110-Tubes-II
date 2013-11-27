<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
	Connection con = null;
	String[] data = new String[8];
	
	try {
		try { 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}catch(ClassNotFoundException ce){out.println(ce);} 
   
		con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
		
		PreparedStatement st;
		String query = "SELECT * FROM barang WHERE nama=?";
		st = con.prepareStatement(query);
		st.setString(1, request.getParameter("nama"));
		
		ResultSet rs;
		rs = st.executeQuery();
		
		if (rs.next()) {

	
%>
<script src="validator.js"></script>
<!DOCTYPE html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="letoy.css">
	<link rel="stylesheet" type="text/css" href="detail.css">
	<script src="header.js"></script>
	<script src="ajaxLoader.js"></script>
</head>

<body>
	<div id="topBorder"></div>
	<div id='contentArea'>
		<div class='division'>
			<img src="resource\\<%=rs.getString(1)%>.jpg" class="image">
			<div id='description'>
				<h1><%= rs.getString(1)%></h1>
				<h2><%= rs.getString(2)%></h2>
			</div>
		</div>
		<div class='division'>
			<h2 id='textPermintaan'>permintaan khusus</h2>
			<textarea class="textInput" id='request' type="text" name="request"></textarea>
			<div id='statistic'>
				<h2>harga: Rp.<%= rs.getString(3)%><BR>
				jumlah pembelian <input class="textInput" id='quantity' type="text" name="jumlah" value="0"> </br>
				</h2>
				<input class="button" type="submit" value="tambahkan ke tas!">
			</div>
		</div>
	</div>
	<div id="header">
		<script>drawHeaderContent();</script>
	</div>
</body>
<% 	}
		
		st.clearParameters();
		con.close();
	} catch (Exception e) {out.println(e.toString()); };
%>
</html>