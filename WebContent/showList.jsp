<%@page import="java.util.ArrayList"%>
<%@page import="kelas.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	Ini adalah list.jsp. Dapet dari database: <br/>
	<% 
		ArrayList<Barang> barangs = (ArrayList<Barang>) request.getAttribute("barangs");
		for(Barang b: barangs){
			out.println("<strong>"+b.getNama() + "</strong><br/>");
		}

	%>
</body>
</html>