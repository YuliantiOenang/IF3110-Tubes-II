<%@ page import="javaModel.Barang" %>
<script src="/ruserba/js/deleteBarang.js" type="text/javascript"></script>
<h2> Selamat datang admin</h2>
<hr>
	<a href="/ruserba/admin/addbarang">Tambah Barang</a><br>
	<a href="/ruserba/admin/logout">Logout</a>
<hr>
Silahkan pilih kategori : <br>
<%
	java.sql.ResultSet RS = (java.sql.ResultSet) request.getAttribute("listKategori");
	while (RS.next())
	{
%>
		<a href = "/ruserba/admin/index?kateg=<%=RS.getObject(1)%>"> <%=RS.getObject(2)%></a><br>
<%
	}
	
	Barang B = (Barang) request.getAttribute("barang");
	if (B!=null)
	{
%>
		<table>
		<tr>
			<th>Nama Barang</th>
			<th>Harga</th>
			<th>Gambar</th>
			<th>Stok</th>
			<th>Aksi</th>
		</tr>		
<%
		int i;
		int size = B.nama.size();
		for (i=0;i<size;i++)
		{
%>
			<tr>
				<td><%=B.nama.get(i)%></td>
				<td><%=B.harga.get(i)%></td>
				<td><img src="/ruserba/images/barang/<%=B.gambar.get(i)%>" width="100" height="100"></td>
				<td><%=B.stok.get(i)%></td>
				<td>
					<a href="/ruserba/admin/editbarang?id=<%=B.id.get(i)%>"> Edit </a>
					<a href="#<%=B.id.get(i)%>" onclick="deleteBarangConfirm(<%=B.id.get(i)%>)"> Delete </a>
				</td>
			</tr>
<% 
		}
		out.println("</table>");
	}
%>