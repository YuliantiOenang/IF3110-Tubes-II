<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.frexesc.model.KategoriBean"%>
<%@ page import="com.frexesc.model.BarangBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="../js/ajaxShop.js"></script>
<title>Detail Barang</title>
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

	<%
		@SuppressWarnings("unchecked")
		ArrayList<KategoriBean> kategoriBean = (ArrayList<KategoriBean>) request
				.getAttribute("categories");
	%>
	<%
		if (kategoriBean == null)
			kategoriBean = new ArrayList<KategoriBean>();
	%>

	<%
		for (int i = 0; i < barangBean.size(); i++) {
	%>
	<%
		BarangBean b = barangBean.get(i);
	%>
	<img src="../img/barang/<%=b.getPicture()%>" width="20%" height="20%">
	<br />
	<b>Nama Barang:</b>
	<%=b.getName()%>
	<br />
	<b>Keterangan:</b>
	<%=b.getDescription()%>
	<br />
	<b>Harga Barang:</b>
	<%=b.getPrice()%>
	<br />
	<%
		for (int j = 0; j < kategoriBean.size(); j++) {
	%>
	<%
		if (kategoriBean.get(j).getId() == b.getId_category()) {
	%>
	<b>Kategori:</b>
	<%=kategoriBean.get(j).getName()%>
	<br />
	<%
		}
	%>
	<%
		}
	%>

	<%
		if (b.getTotal_item() > 0) {
	%>
	<b>Stok :</b>
	<div id="jumlah_barang_<%=b.getId()%>">
		<%=b.getTotal_item()%>
	</div>
	<br />
	<b>Jumlah Barang:</b>
	<input type="text" name="qty" size="8" id="qty_<%=b.getId()%>"
		value="0">
	<br />
	<b>Deskripsi Tambahan:</b>
	<textarea name="deskripsi_tambahan" id="deskripsi_tambahan"></textarea>
	<br />
	<%
		} else {
	%>
	<b>Stok :</b> Habis
	<br />
	<%
		}
	%>

	<input type="button" value="Tambah ke Cart" id="beli"
		onClick="onAddToCart('http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/barang/addCart', <%=b.getId()%> ); return false;">

	<%
		}
	%>
	<br />
	Klik <a href="./cart">disini</a> untuk masuk ke shopping cart <br />
	Klik <a href="./">disini</a> untuk kembali <br />
</body>
</html>