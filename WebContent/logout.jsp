<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	if(session.getAttribute("username")!=null){
		System.out.println("emang udah login nih");
		session.invalidate();		
	}
	response.sendRedirect("/ruko/");
%>
