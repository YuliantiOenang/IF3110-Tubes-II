<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tambah Barang</title>
</head>
<body>
<form action="/ruserba/admin/addbarang" method="POST" enctype="multipart/form-data">
Nama : <input type="text" name="nama_barang"><br>
Kategori : 
<select name="kategori">
<option value="">--Pilih Kategori--</option>
<%
java.sql.ResultSet RS = (java.sql.ResultSet) request.getAttribute("listK");
while (RS.next())
{
%>
	<option value="<%=RS.getObject(1)%>"> <%=RS.getObject(2)%></option>
<%
}
%>
</select><br>
Harga : <input type="text" name="harga_barang"><br>
Stok : <input type="text" name="stok"><br>
Keterangan : <input type="text" name="keterangan"><br>
Gambar : <input type="file" name="file"><br>
<input type="submit" name="submit" value="Tambah">
</form>
</body>
</html>