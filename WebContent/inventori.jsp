<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="kelas.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrasi Inventori</title>
</head>
<body>

<div class="page_container">
	<%@ include file="template/template.jsp" %>
	<link rel="stylesheet" href="css/details.css" type="text/css"> 
	<br/><br/><br/>
	<% 
		Barang b = (Barang) request.getAttribute("barang");
		String action = (String) request.getAttribute("action");
		
		boolean add = action.equals("add");
	%>
		
	<form action="inventori" method="POST">
	<input type="hidden" name="id" value='<%= (String) request.getAttribute("gid") %>' />
	<input type="hidden" name="action" value='<%= action %>' />
	
	Nama: <input type="text" name="nama" value='<%= add ? "" : b.getNama() %>' /><br/>
	Harga: <input type="text" name="harga" value='<%= add ? "" : b.getHarga() %>' /><br/>
	Jumlah: <input type="text" name="jumlah" value='<%= add ? "" : b.getJumlah() %>' /><br/>
	Deskripsi: <br/>
	<textarea name="desc"><%= add ? "" : b.getDesc() %></textarea><br/><br/>
	Gambar:<br/>
	<img src='res/<%= add ? "barang/default.jpg" : b.getGambar() %>' width="100px" height="100px" /><br/>
	<input type="file" name="gambar" />
	<br/><br/>
	<%
		if(add){
	%>
		<input type="button" value="add" />	
	<%
		}else{
	%>
		<input type="button" value="edit" /> <input type="button" value="delete" />
	<%
		}
	%>
	</form>
</div>

</body>

</html>