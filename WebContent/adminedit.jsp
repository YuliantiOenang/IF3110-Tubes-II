<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.frexesc.model.*, java.util.*"
    %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="js/admin.js"></script>
</head>
<body>
<%
@SuppressWarnings("unchecked")
ArrayList<BarangBean> barangs = (ArrayList<BarangBean>)request.getAttribute("barangs");
%>
<table border="1">
	<tr>
		<th>id</th>
		<th>kategori</th>
		<th>nama</th>
		<th>harga</th>
		<th>deskripsi</th>
		<th>gambar</th>
		<th>jumlah</th>
		<th>edit</th>
		<th>hapus</th>
	</tr>
	<%
	String[] categories = {"Ladies Dress", "Ladies Shoes", "Men Shirt", "Men Shoes", "Men Hat"};
	for (int i = 0; i < barangs.size(); i++) {
		BarangBean b = barangs.get(i);
	%>
	<tr id="<%= "r"+b.getId() %>">
		<td id="<%= "id"+b.getId() %>"><%= b.getId() %></td>
		<td id="<%= "cat"+b.getId() %>"><%= categories[(int)(b.getId_category())-1] %></td>
		<td id="<%= "name"+b.getId() %>"><%= b.getName() %></td>
		<td id="<%= "pri"+b.getId() %>"><%= b.getPrice() %></td>
		<td id="<%= "desc"+b.getId() %>"><%= b.getDescription() %></td>
		<td id="<%= "pic"+b.getId() %>"><%= b.getPicture() %></td>
		<td id="<%= "total"+b.getId() %>"><%= b.getTotal_item() %></td>
		<td id="<%= "edit"+b.getId() %>"><button onclick="editbarang(<%= b.getId() %>)">edit</button></td>
		<td>
			<form method="post" action="admin" onsubmit='return confirmdelete("<%=b.getName()%>")'>
				<input type="hidden" name="id" value="<%= b.getId() %>" />
				<input type="hidden" name="action" value="delete" />
				<button>hapus</button>
			</form>
		</td>
	</tr>
	<%
	}
	%>
</table>
</body>
</html>