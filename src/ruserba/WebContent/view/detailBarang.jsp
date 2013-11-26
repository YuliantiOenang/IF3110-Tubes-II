<%@ page import="javaModel.Barang" %>
<strong>Detail : </strong><br>
<%
	Barang B = (Barang) request.getAttribute("barang");
%>
<img src="/ruserba/images/barang/<%=B.gambar.get(0)%>" width=200 height=200><br>
<b>Nama Barang </b> : <%=B.nama.get(0)%><br>
<b>Keterangan </b>: <%=B.keterangan.get(0)%><br>
<b>Harga Barang </b>: <%=B.harga.get(0)%><br>
<b>Stok </b>: <%=B.stok.get(0)%><br>
<hr>

<button onclick='pertanyaan(<%=B.id.get(0)%>)'> Beli </button>


