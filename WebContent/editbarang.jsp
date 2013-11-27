<%@page import="java.util.ArrayList"%>
<%@page import="bean.Barang"%>

<jsp:include page="header.jsp" />

<% 
	if (session.getAttribute("role")!= null) {
	if (session.getAttribute("role").equals("admin")){
		out.println("OKE");
%>
<div id="content" class="float_l">
	<h2>Edit Barang</h2>
		<form name="edit" action="EditBarangKategori" method="post">
			<input type="hidden" name="page" value="1">
			<input type="hidden" name="order" value="nama_barang">
			Kategori Barang : <br>
			<select name="id">
				<option value="1">Pangan</option>
				<option value="2">Pakaian</option>
				<option value="3">Elektronik</option>
				<option value="4">Rumah Tangga</option>
				<option value="5">Olah Raga</option>
			</select><br><br>
			<input type="submit" id="subedit" value="Pilih Kategori">
		</form>
</div>
<% 	if (request.getAttribute("barang") != null) { %>
	<h3>Daftar barang :</h3>
	<% 
	ArrayList<Barang> barang = (ArrayList<Barang>)request.getAttribute("barang");
	for (int i = 0; i < barang.size(); i++){
		out.println("Nama : "+barang.get(i).getNama_barang());	
	}
	%>
<%	} %>
<%
		} else {
			out.println("<h1>You must logged on as Admin</h1>");
		}
	} else {
		out.println("<h1>403 Forbidden</h1>");
	}
%>
<jsp:include page="footer.jsp" />