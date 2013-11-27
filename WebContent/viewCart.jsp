<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="kelas.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		ArrayList<Barang> barangs = (ArrayList<Barang>) request.getAttribute("barangs");
		int awal = (request.getParameter("start") == null ? 0 : Integer.parseInt(request.getParameter("start")));
		int no = 0;
		for(Barang b: barangs){
		%>
	
		<% 
		}
	%>
</body>
</html>