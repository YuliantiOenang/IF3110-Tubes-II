
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
<input type="submit" name="submit" value="Tambah Barang">
</form>