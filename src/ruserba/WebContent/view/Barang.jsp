<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javaModel.Barang" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/ruserba/js/generatedContent.js" type="text/javascript"></script>
<script src="/ruserba/js/searchClick.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body onload="init('http://localhost:8080/ruserba/barang','harga','DESC','<%=request.getAttribute("NamaBarang")%>','<%=request.getAttribute("kategori")%>','<%=request.getAttribute("harga")%>','<%=request.getAttribute("OP")%>')">
	<h1> List Barang </h1>
	<h2> Sort berdasarkan</h2>
	Nama (<a href="#" onclick="init('http://localhost:8080/ruserba/barang','nama','ASC','<%=request.getAttribute("NamaBarang")%>','<%=request.getAttribute("kategori")%>','<%=request.getAttribute("harga")%>','<%=request.getAttribute("OP")%>')">ASC</a>,<a href="#" onclick="init('http://localhost:8080/ruserba/barang','nama','DESC','<%=request.getAttribute("NamaBarang")%>','<%=request.getAttribute("kategori")%>','<%=request.getAttribute("harga")%>','<%=request.getAttribute("OP")%>')">DESC</a>) <br>
	Harga (<a href="#" onclick="init('http://localhost:8080/ruserba/barang','harga','ASC','<%=request.getAttribute("NamaBarang")%>','<%=request.getAttribute("kategori")%>','<%=request.getAttribute("harga")%>','<%=request.getAttribute("OP")%>')">ASC</a>,<a href="#" onclick="init('http://localhost:8080/ruserba/barang','harga','DESC','<%=request.getAttribute("NamaBarang")%>','<%=request.getAttribute("kategori")%>','<%=request.getAttribute("harga")%>','<%=request.getAttribute("OP")%>')">DESC</a>) <br>
	Kategori (<a href="#" onclick="init('http://localhost:8080/ruserba/barang','kategori','ASC','<%=request.getAttribute("NamaBarang")%>','<%=request.getAttribute("kategori")%>','<%=request.getAttribute("harga")%>','<%=request.getAttribute("OP")%>')">ASC</a>,<a href="#" onclick="init('http://localhost:8080/ruserba/barang','kategori','DESC','<%=request.getAttribute("NamaBarang")%>','<%=request.getAttribute("kategori")%>','<%=request.getAttribute("harga")%>','<%=request.getAttribute("OP")%>')">DESC</a>) <br> 
	
	<hr>
	<!-- x
	<h2>Search Form</h2>
	Nama barang : <input type="text" name="search" id="search"><br>
	Kategori : <input type="text" name="kategori" id="kategori"><br>
	Harga : <input type="text" name="harga" id="harga"><br>
	<select name="operator" id="operator">
		<option value="">--Pilih--</option>
		<option value="L">Less than</option>
		<option value="E">Equal </option>
		<option value="G">Greater </option> 
	</select><br>
	<button id="cari" onclick="searchClick()">Cari</button>
	<hr>
	-->
	<table id="ISI">
	</table>
</body>
</html>