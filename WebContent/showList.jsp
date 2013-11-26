<%@page import="java.util.ArrayList"%>
<%@page import="kelas.*"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><% out.println("Kategori: " + request.getAttribute("kategori")); %></title>
</head>
<body>
	<%@ include file="template/template.jsp" %> 
	<br/><br/><br/>
	<% 
		out.println("<h1>Kategori: " + request.getAttribute("kategori") + "</h1>");
	
		ArrayList<Barang> barangs = (ArrayList<Barang>) request.getAttribute("barangs");
		int no = 1;
		for(Barang b: barangs){
			out.println("<strong>Nama:</strong> <a href=\"detail?gid=" + b.getId_inven() + "\">"+b.getNama() + "</a><br/>");
			out.println("<strong>Harga:</strong> "+b.getHarga() + "<br/>");
			out.println("<strong>Jumlah:</strong> "+b.getJumlah() + "<br/>");
			out.println("<img src=\"res/addtocart.png\" width=125 onclick='validate(" + b.getId_inven() + ", " + no + ")' >");
			out.println("<div id='notif"+no+"'></div>");
			out.println("<hr>");
			no++;
		}

	%>
</body>
	<script src="transaction.js"></script>
</html>