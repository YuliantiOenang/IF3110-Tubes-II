<%@page import="java.util.*"%>
<%@page import="kelas.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>KLK STORE</title>
</head>
<body>
	<%@ include file="template/template.jsp" %>
	<br/><br/><br/> 
	<%
		out.println("<h1>BARANG POPULER</h1>");
		out.println("<hr>");	
		for(int i=0;i<5;i++){
			out.println("<h1>Kategori: " + request.getAttribute("namaKategori" + i) + "<br/></h1>");
			ArrayList<Barang> barangs = (ArrayList<Barang>) request.getAttribute("barangKategori" + i);
			%>
			<div class="pull_left">
			<%
			for(Barang b: barangs){
				%>
				<div class="list_barang">
					<div class="gambar">
						<img src="res/<%= b.getGambar() %>" width="150px" height="150px">
					</div>
					<div class="list_desc">
						<strong>Nama:</strong> <a href="detail?gid=<%= b.getId_inven() %>"><%= b.getNama() %></a><br/>
						<strong>Harga:</strong> <%= b.getHarga() %><br/>
					</div>
				</div>
				<%
			}
			
			%>
			</div>
			<% 
			out.println("<hr>");
		}
		
	%>
</body>
</html>