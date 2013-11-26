<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.frexesc.model.BarangBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="../js/ajaxShop.js"></script>
<title>Gallery</title>
</head>
<body>
	<%
		@SuppressWarnings("unchecked")
		ArrayList<BarangBean> barangBean = (ArrayList<BarangBean>) request
				.getAttribute("items");
	%>
	<%
		if (barangBean == null)
			barangBean = new ArrayList<BarangBean>();
	%>

	<table align="left" cellpadding="0" cellspacing="1">
		<tr bgcolor="blue">
			<td width="150" align="center">Nama Barang</td>
			<td style="table-layout: fixed; width: 200px;" align="center">Gambar
				Barang</td>
			<td width="100" align="center">Harga</td>
			<td width="100" align="center">Stok</td>
			<td width="100" align="center">Jumlah Beli</td>
			<td width="100" align="center">Aksi</td>
		</tr>
		<%
			for (int i = 0; i < barangBean.size(); i++) {
		%>
		<%
			BarangBean b = barangBean.get(i);
		%>
		<tr>
			<td align="center"><a href="./detail?id=<%=b.getId()%>"><%=b.getName()%></a>
			</td>
			<td align="center" style="table-layout: fixed; width: 200px;">
				<center>
					<img src="../img/barang/<%=b.getPicture()%>" width="20%"
						height="20%">
				</center>
			</td>
			<td align="center"><%=b.getPrice()%></td>
			<td align="center"><%=b.getTotal_item()%></td>
			<td align="center"><input type="text" name="qty" size="8"
				id="qty_<%=b.getId()%>" value="0"></td>
			<input type="hidden" name="deskripsi_tambahan" id="deskripsi_tambahan"></input>
			<td align="center"><input type="button" value="Tambah ke Cart"
				id="beli"
				onClick="onAddToCart('http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/barang/addCart', <%=b.getId()%> ); return false;"></td>
		</tr>
		<%
			}
		%>
	</table>

</body>
</html>