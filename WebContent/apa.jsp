<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String username = (String) request.getAttribute("username"); %>
<h1>Selamat datang, <% out.print(username); %> !</h1>
<ul>
<%

ArrayList<String> ids = (ArrayList<String>) request.getAttribute("listid");
ArrayList<String> namas = (ArrayList<String>) request.getAttribute("listnama");
ArrayList<String> hargas = (ArrayList<String>) request.getAttribute("listharga");
ArrayList<String> solds = (ArrayList<String>) request.getAttribute("listsold");
ArrayList<String> stoks = (ArrayList<String>) request.getAttribute("liststok");
ArrayList<String> images = (ArrayList<String>) request.getAttribute("listimage");
ArrayList<String> kategoris = (ArrayList<String>) request.getAttribute("listkategori");

Iterator iid = ids.iterator();
Iterator inama = namas.iterator();
Iterator iharga = hargas.iterator();
Iterator isold = solds.iterator();
Iterator istok = stoks.iterator();
Iterator iimage = images.iterator();
Iterator ikategori = kategoris.iterator();
// List ids = (List) request.getAttribute("listid");


 
 while(iid.hasNext()){
%>
	<% String a = (String)iid.next(); %>
	<li>	
		<ul>
			<li> Id : <% out.print(a); %></li>
			<li> Nama : <% out.print(inama.next()); %></li>
			<li> Harga : <% out.print(iharga.next()); %></li>
			<li> Sold : <% out.print(isold.next()); %></li>
			<li> Stok : <% out.print(istok.next()); %></li>
			<li> Image : <% out.print(ikategori.next()); %></li>
			<li> <a href="/warung/edit_barang?id=<% out.print(a); %>"><h3>Edit</h3></a></li>
			<li> <img src="<% out.print(iimage.next()); %>" width="20%"></li>
		</ul>
	</li>
<% } %>
</ul>
</body>
</html>