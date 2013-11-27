
<%@page import="java.util.Locale.Category"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
	<jsp:include page = 'header.jsp'/>
	<script src="AJAXaddtocart.js"></script>
</head>
<jsp:include page = 'middle.jsp' />
		<h2>Search Result</h2>
		<%
			String keyword = request.getParameter("keyword");
			String kategori= request.getParameter("kategori");
			String harga = request.getParameter("harga");
			String db_url = "jdbc:mysql://localhost/";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			// Check connection

			// Query from database
			if (harga== "<10000") {
				Connection connection = DriverManager.getConnection(db_url, "root", "");
				Statement statement = connection.createStatement();
				String hargakecil = "SELECT * FROM barang WHERE kategori='" + kategori + "' AND nama LIKE '%" + keyword + "%' AND harga < 10000";
				ResultSet categories = statement.executeQuery("hargakecil"); 
			}
			else if (harga == "10000-50000") {
				Connection connection = DriverManager.getConnection(db_url, "root", "");
				Statement statement = connection.createStatement();
				String hargasedang = "SELECT * FROM barang WHERE kategori='" + kategori + "' AND nama LIKE '%" + keyword + "%' AND (harga BETWEEN 10000 AND 50000)";
				ResultSet categories = statement.executeQuery("hargasedang");
			}
			else if (harga ==">50000") {
				Connection connection = DriverManager.getConnection(db_url, "root", "");
				Statement statement = connection.createStatement();
				String hargatinggi = "SELECT * FROM barang WHERE kategori='" + kategori + "' AND nama LIKE '%" + keyword + "%' AND harga > 50000";
				ResultSet categories = statement.executeQuery("hargatinggi");	
			}
			boolean pagenum;
			
			//Cek pagenum ada/tidak
			if (request.getParameter(pagenum) != null) { 
				pagenum = 1;
			}
			// Tentukan halaman last
			int page_rows = 10;
			double last = ceil(row/page_rows);
			// Koreksi jika pagenum di luar range
			if (pagenum < 1) {
				pagenum = 1;
			}
			else if (pagenum > last) {
				pagenum = last; 
			}
			// Range query ke database
			max = "limit"  + (pagenum - 1) * page_rows  + ','  + page_rows;
			// Lakukan query sesuai range
			sql = sql + max;
			
			// Display result
			while (categories.next()) {
				String nama = categories.getString("nama");
				String harga1 = categories.getString("harga");
				out.println( "<img src=\"/tubes1/images/",nama,".jpg\" alt='gambar' width='400' height='300'><br>");
				out.println( "Nama: <a href='detil.jsp?nama=\"", + nama +"\"harga=\"", + harga1 + "\"'>", + nama +"</a><br>");
				out.println( "Harga: ",harga1,"<br>");
				out.println( "Banyak: <input type='text' name='qty' id='",nama,"'>");
				out.println( "<button type='button' onclick='AJAXaddtocart(\"",nama,"\")'>Add to cart</button><br><br>");
			}
			
			// Display Paginasi
			out.println( " --Page pagenum of last-- <p>");
			if (pagenum == 1) {
			}
			else {
				out.println( " <a href='{$_SERVER['PHP_SELF']}?pagenum=1'> <<-First</a> ");
				out.println( " ");
				previous = pagenum-1;
				out.println( " <a href='{$_SERVER['PHP_SELF']}?pagenum=previous'> <-Previous</a> ");
			} 
			out.println(" ---- ");
			if (pagenum == last) {
			}
			else {
				next = pagenum + 1;
				out.println( " <a href='{$_SERVER['PHP_SELF']}?pagenum=next&keyword=\"" + keyword + "\"&kategori=\"" + keyword + "\"&harga=\"" + harga1 + "\"'>Next -></a> ");
				out.println( " ");
				out.println( " <a href='{$_SERVER['PHP_SELF']}?pagenum=last&keyword=\"" + keyword + "\"&kategori=\"" + keyword + "\"&harga=\"" + harga1 + "\"'>Last ->></a> ");
			} 
		%>
	</body>
</html>