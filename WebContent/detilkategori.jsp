<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="middle.jsp"></jsp:include>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
final String DB_URL="jdbc:mysql://localhost/ruserba";

Class.forName(JDBC_DRIVER).newInstance();
Connection conn = DriverManager.getConnection(DB_URL,"root","");
Statement stmt = conn.createStatement();

String katagori = request.getParameter("kategori");
	
String sql = "SELECT * FROM barang WHERE kategori = '" + katagori + "'" ;

ResultSet rs = stmt.executeQuery(sql);

	while(rs.next()) {
			
			out.print("<img src = 'images/"+rs.getObject("nama")+".jpg' width='300' height='300'>");
			
			out.print("<p>Nama : <a href = 'detil.jsp?nama=" + rs.getObject("nama") + "'>" + rs.getObject("nama") + "</a></p>");
			out.print("<p>Harga : " + rs.getObject("harga") + "</p>");
			out.print("<p>Deskripsi : " + rs.getObject("deskripsi")+ "</p>");
			%>
			
			<p>Banyak: <input type='text' name='qty' id='",$row['nama'],"'>";<p>
			<button type='button' onclick='AJAXaddtocart(\"",$row['nama'],"\")'>Add to cart</button><br><br>";
			<%
		 
		}
	
	rs.close();
	conn.close();
	stmt.close();
	%>
</body>
</html>