<!DOCTYPE html>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="letoy.css">
	<link rel="stylesheet" type="text/css" href="index.css">
	<script src="header.js"></script>
</head>
<body>
	<div id='topBorder'></div>
	
	<div class='contentArea'>
		<%
			Connection con = null;
						
			try {
				try { 
					Class.forName("com.mysql.jdbc.Driver").newInstance(); 
				}catch(ClassNotFoundException ce){out.println(ce);} 

				con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
				
				PreparedStatement st = con.prepareStatement("SELECT nama FROM barang ORDER BY kategori DESC");
				
				ResultSet rs;
				rs = st.executeQuery();
				
				while (rs.next()) {
					String s = "<img src='resource\\"+rs.getString(1)+".jpg'>";
					out.println(s);
				}
				st.clearParameters();
				con.close();
			} catch (Exception e) {out.println("Unable to connect to database."); };
		%>
	</div>
	
	<div id='header' >
		<script>drawHeaderContent();</script>
	</div>
</body>
</html>