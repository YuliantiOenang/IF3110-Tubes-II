<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="kelas.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrasi Inventori</title>
<script src="inventori.js"></script>
</head>
<body>

<div class="page_container">
	<%@ include file="template/template.jsp" %>
	<link rel="stylesheet" href="css/details.css" type="text/css"> 
	<br/><br/><br/>
	<% 
		Barang b = (Barang) request.getAttribute("barang");
		String action = (String) request.getAttribute("action");
		
		boolean add = action.equals("add");
	%>
		
	<form action="inventori" id="invform" method="POST">
	<input type="hidden" name="gid" value='<%= add ? "-1" : (String) request.getAttribute("gid") %>' />
	<input type="hidden" id="actionval" name="action" value='<%= action %>' />
	
	Nama: <input type="text" name="nama" value='<%= add ? "" : b.getNama() %>' /><br/>
	Harga: <input type="text" name="harga" value='<%= add ? "" : b.getHarga() %>' /><br/>
	Jumlah: <input type="text" name="jumlah" value='<%= add ? "" : b.getJumlah() %>' /><br/>
	Kategori: <select name="kategori">
		<%
			String[] kat = {"Roti", "Minuman", "Kalengan", "Segar", "Peralatan"};
			for (int i = 0; i < kat.length; i++){
				int k = i+1;
				%>
				<option value='<%=k%>' <%= !add && (k == b.getId_cat()) ? "selected" : "" %>><%=kat[i]%></option>
				<%
			}
		%>	
	</select><br/>
	Deskripsi: <br/>
	<textarea name="desc"><%= add ? "" : b.getDesc() %></textarea><br/><br/>
	Gambar:<br/>
	<img src='res/<%= add ? "barang/default.jpg" : b.getGambar() %>' width="100px" height="100px" /><br/>
	<input type="file" name="gambar" />
	<br/><br/>
	<%
		if(add){
	%>
		<input type="submit" value="add" />	
	<%
		}else{
	%>
		<input type="button" onclick="editsubmit()" value="edit" /> <input type="button" onclick="delsubmit()" value="delete" />
	<%
		}
	%>
	</form>
</div>

</body>

</html>