<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Barang</title>
</head>
<body>
<h2>Edit Barang</h2>
<hr>
<% 
java.sql.ResultSet RS = (java.sql.ResultSet) request.getAttribute("edit");
while (RS.next())
{
%>

<form action="/ruserba/admin/editbarang?id=<%=request.getAttribute("id")%>" method="POST" enctype="multipart/form-data">
Nama : <input type="text" name="nama_barang" value="<%=RS.getObject(3)%>"><br>
Harga : <input type="text" name="harga_barang" value="<%=RS.getObject(4)%>"><br>
<img src="/ruserba/images/barang/<%=RS.getObject(5)%>" width="100" height="100"><br>
Gambar : <input type="file" name="file" value="<%=RS.getObject(5)%>"><br>
<input type="submit" name="submit" value="Edit">
</form>
<%
}
%>
</body>
</html>