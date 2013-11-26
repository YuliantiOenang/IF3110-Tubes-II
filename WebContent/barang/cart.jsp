<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.frexesc.model.BarangBean"%>
<%@ page import="com.frexesc.model.BarangUserBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="../js/ajaxShop.js"></script>
<title>Shopping Cart</title>
</head>
<body>
	<%
		@SuppressWarnings("unchecked")
		ArrayList<BarangUserBean> barangUserBean = (ArrayList<BarangUserBean>) request
				.getAttribute("user_items");
	%>
	<%
		if (barangUserBean == null)
			barangUserBean = new ArrayList<BarangUserBean>();
	%>

	<%
		@SuppressWarnings("unchecked")
		ArrayList<BarangBean> barangBean = (ArrayList<BarangBean>) request
				.getAttribute("items");
	%>
	<%
		if (barangBean == null)
			barangBean = new ArrayList<BarangBean>();
	%>

	<table cellpadding="0" cellspacing="1">
		<tr bgcolor="blue">
			<td width="100" align="center">No.</td>
			<td width="150" align="center">Nama Barang</td>
			<td width="100" align="center">Kuantitas</td>
			<td width="100" align="center">Harga Total</td>
			<td width="100" align="center">Deskripsi Tambahan</td>
			<td width="100" align="center">Aksi</td>
		</tr>
		<% int totalHarga = 0; %>
		<%
			for (int i = 0; i < barangUserBean.size(); i++) {
		%>
		<%
			BarangUserBean b = barangUserBean.get(i);
		%>
		<tr>
			<td><%=i + 1%></td>
			<%
				for (int j = 0; j < barangBean.size(); j++) {
			%>
			<%
				BarangBean b2 = barangBean.get(j);
			%>
			<%
				if (b2.getId() == b.getId_item()) {
			%>
			<% totalHarga = totalHarga + b.getTotal_item() * b2.getPrice(); %>
			<td><%=b2.getName()%></td>
			<td><input type="text" name="qty" size="8"
				id="qty_<%=b.getId()%>" value="<%=b.getTotal_item()%>"></td>
			<td>
				<div id="harga_<%=b.getId()%>"><%=b.getTotal_item() * b2.getPrice()%>
				</div>
			</td>
			<td><%=b.getDescription()%></td>
			<td><input type="button" value="Update Cart" id="beli"
				onClick="onUpdateCart('http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/barang/updateCart', <%=b.getId()%> ); return false;">
				<a href="./deleteBarang?id=<%=b.getId()%>">Delete</a></td>
			<%
				break;
						}
			%>
			<%
				}
			%>
		</tr>
		<%
			}
		%>
		
		<tr bgcolor="yellow">
		<td></td>
		<td>Total:</td>
		<td></td>
		<td><div id="total_harga"><%= totalHarga %></div></td>
		<td></td>
		<td></td>
		</tr>
		
	</table>
	<br />
	<% if (barangUserBean.size() != 0) { %>
		Klik <a href="./payment">disini</a> untuk melakukan pembayaran <br />
	<% } %>
	Klik <a href="./">disini</a> untuk kembali ke halaman utama barang <br />
</body>
</html>