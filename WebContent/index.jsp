<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<link rel="stylesheet" href="style.css" type="text/css">

<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="middle.jsp"></jsp:include>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String[] kategori;
kategori = new String[5];
kategori[0] = "beras";
kategori[1] = "daging";
kategori[2] = "ikan";
kategori[3] = "sayur";
kategori[4] = "buah";
 

final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
final String DB_URL="jdbc:mysql://localhost/ruserba";


Class.forName(JDBC_DRIVER).newInstance();
Connection conn = DriverManager.getConnection(DB_URL,"root","");
Statement stmt = conn.createStatement();

for (int j=0; j<5; j++){
	
String sql = "SELECT * FROM barang WHERE kategori = '" + kategori[j] + "' ORDER BY 'terjual' DESC" ;

ResultSet rs = stmt.executeQuery(sql);
%>
	<% for(int i=0; i<3; i++) {
		if(rs.next()) { %>
			<img src = "images/<%out.print(rs.getObject("nama"));%>.jpg" width='300' height='300'>
			
			<p>Nama : <a href = "detil.jsp?nama=<% out.print(rs.getObject("nama")); %>"><% out.print(rs.getObject("nama")); %></a></p>
			<p>Harga : <% out.print(rs.getObject("harga")); %></p>
			<p>Banyak: <input type='text' name='qty' id='",$row['nama'],"'>";<p>
			<button type='button' onclick='AJAXaddtocart(\"",$row['nama'],"\")'>Add to cart</button><br><br>";
			
			
		<% }
	} 
	rs.close();
}

stmt.close();
conn.close();
%>

</body>
</html>