 <%-- 
    Document   : product
    Created on : Nov 26, 2013, 3:18:02 PM
    Author     : Muhammad Ikhsan
    
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%--@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>--%>
<%--@ page import="java.string.*"--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RuSerBa</title>
        <jsp:include page = "header.jsp" />
	<script src="AJAXaddtocart.js"></script>
    </head>
    <body>
		<jsp:include page = "middle.jsp" />
		<%--<h2><% print ucfirst(GET['kategori']); %></h2>--%>
		<form id="sort" action="product.jsp" method="get">
			Sort : <select name="sort">
				<option value="namaasc" selected>Nama (a-z)</option>
				<option value="namadsc">Nama (z-a)</option>
				<option value="hargaasc">Harga (a-z)</option>
				<option value="hargadsc">Harga (z-a)</option>
			</select>
			<input type="hidden" name="kategori" value="<?php print GET['kategori']; ?>">
			<input type="submit" value="Sort"><br><br>
		</form>
		<%@ page import="java.sql.*" %>
		<%
		String db_url = "jdbc:mysql://localhost/";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		%>
        <%
            String kategori = request.getParameter("kategori");
			String sort = request.getParameter("sort");
			
			//Query from database
			String sql = null;
			if (sort =="namaasc") {
				Connection connection = DriverManager.getConnection(db_url, "root", "");
				Statement statement = connection.createStatement();
				String QueryNama = "SELECT * FROM barang WHERE kategori= \"" + Kategori + "\"ORDER BY nama";
				ResultSet categories = statement.executeQuery("QueryNama");
            }
			else if (sort == "namadsc") {
				Connection connection = DriverManager.getConnection(db_url, "root", "");
				Statement statement = connection.createStatement();
				String QueryNamaDESC = "SELECT * FROM barang WHERE kategori= \"" + Kategori + "\"ORDER BY nama DESC";
				ResultSet categories = statement.executeQuery("QueryNamaDESC");
            }
			else if (sort == "hargaasc") {
				Connection connection = DriverManager.getConnection(db_url, "root", "");
				Statement statement = connection.createStatement();
				String QueryHarga = "SELECT * FROM barang WHERE kategori= \"" + Kategori + "\"ORDER BY harga";
				ResultSet categories = statement.executeQuery("QueryHarga");	
			}
			else if (sort == "hargadsc") {
				Connection connection = DriverManager.getConnection(db_url, "root", "");
				Statement statement = connection.createStatement();
				String QueryHarga = "SELECT * FROM barang WHERE kategori= \"" + Kategori + "\"ORDER BY harga DESC";
				ResultSet categories = statement.executeQuery("QueryHargaDESC");
			}
			                        
			//Cek pagenum ada/tidak
            if (not ((pagenum))) { 
				pagenum = 1;
			}
			else {
				pagenum = request.getParameter("pagenum");
			}
			
            //Tentukan halaman last
			page_rows = 2;
			last = ceil(rows/page_rows);
                        
			//Koreksi jika pagenum di luar range
			if (pagenum < 1) {
            	pagenum = 1;
			}
			else if (pagenum > last) {
				pagenum = last; 
			}
			
			
			//Range query ke database
			String max = "'limit ' + (pagenum - 1) * page_rows + ','  + page_rows";
			
            //Lakukan query sesuai range
			sql = sql + max;

			//Display result
			while (categories.next()) {
				String nama = categories.getString('nama');
				String harga = categories.getString('harga');
				out.println ("<img src=\"/images/Apel_Fuji.jpg\" + alt='gambar' + width='400' + height='300'/><br>");
				out.println ("Nama: <a href='detil.jsp?nama=nama&harga=harga'>",nama,"</a><br>");
				out.println ("Harga: ",row,"<br>");
				out.println ("Banyak: <input type='text' name='qty' id='",nama,"'>");
				out.println ("<button type='button' onclick='AJAXaddtocart(\"",nama,"\")'> Add to cart </button> <br>");
			}
			
           //Display Paginasi
			out.println (" --Page pagenum of last-- <p>");
			if (pagenum == 1) {
			}
			else {
				out.println ("<a href='{_SERVER['PHP_SELF']}?pagenum=1'> <<-First</a>");
				out.println (" ");
				previous = pagenum-1;
				out.println("<a href='{_SERVER['PHP_SELF']}?pagenum=previous'> <-Previous</a> ");
			} 
			out.println " ---- ";
			if (pagenum == last) {
			}
			else {
				next = pagenum+1;
				out.println("<a href='{_SERVER['PHP_SELF']}?pagenum=next&kategori=kategori&sort=sort'>Next -></a> ") ;
				out.println(" ") ;
				out.println (" <a href='{_SERVER['PHP_SELF']}?pagenum=last&kategori=kategori&sort=sort'>Last ->></a> ");
			}   
        %>
        </body>
</html>
