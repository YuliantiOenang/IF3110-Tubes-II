<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title></title>
</head>
<body>
<%
	String nama=(String) request.getAttribute("harga");
	Integer harga=(Integer) request.getAttribute("harga");
	Integer stok=(Integer) request.getAttribute("harga");
	String image=(String) request.getAttribute("harga");
	String kategori=(String) request.getAttribute("harga");
%>
<form action="edit" method="GET">
	Nama Barang : <input type="text" name="nama" value="<% if(nama!=null){ out.print(nama);} %>"><br>
	Harga : <input type="text" name="harga" value="<% if(harga!=null){out.print(harga);} %>"><br>
	Stok : <input type="text" name="stok" value="<% if(stok!=null){out.print(stok);} %>"><br>
	Image :<input type="text" name="image" value="<% if(image!=null){out.print(image);} %>"><br>
	Kategori <input type="text" name="kategori" value="<% if(kategori!=null){out.print(kategori);} %>"><br>
	<input type="submit" value="Update"><br>
</form>
</body>
</html>