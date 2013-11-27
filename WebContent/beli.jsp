<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%	
	String kartu=(String)request.getParameter("kartuTerpilih");
	System.out.println(kartu);
	out.print("kartu yang terpilih = "+kartu);
%>