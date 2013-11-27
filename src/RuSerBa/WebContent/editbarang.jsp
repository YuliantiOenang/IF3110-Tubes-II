<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head><title>Edit Barang</title>
<link rel="stylesheet" href="css/editbarang.css" type="text/css" />
</head>
<div class="index">
<body>
<%@ include file="headeradmin.jsp" %>
<article id="featured" class="body">
	<%
	String ID = request.getParameter("id");
	Connection conn = null;
    Statement stmt = null;
	try{
	    Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL,USER,PASS);
		stmt = conn.createStatement();
		String sql;			
		sql = "select * from barang where id='"+ID+"'";
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()){ 
			out.println("<h3> Edit Barang > "+rs.getString("nama")+"</h3><hr>");
			out.println("<div class='view'>");
				out.println("<div class='img'><img src="+rs.getString("gambar")+" width='360' height=400'/></div>");
				out.println("<div class='attribute'>");
					out.println("ID : "+rs.getString("id")+"<br>");
					out.println(rs.getString("nama")+"<br>");
					out.println("Rp "+rs.getString("harga")+"<br>");
					out.println("Jml "+rs.getString("jumlah"));
				out.println("</div>");
				out.println(rs.getString("keterangan"));
			out.println("</div>");
		}
	} catch (ClassNotFoundException e) {	
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
	<center id="indikator"></center>
</article>
<%@ include file="footer.jsp" %>
</div>
</body>
</html>