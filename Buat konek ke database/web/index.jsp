<%-- 
    Document   : index
    Created on : Nov 23, 2013, 7:54:11 PM
    Author     : dimas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html> 
<head> 
<title>Connection with mysql database</title> 
</head> 
<body>
<h1>Connection status </h1>
<% 
try {
 
String connectionURL = "jdbc:mysql://localhost/test1"; //isi dengan server dan nama database


Connection connection = null; 

Class.forName("com.mysql.jdbc.Driver").newInstance(); 

 
connection = DriverManager.getConnection(connectionURL, "root", ""); //username dan password database


if(!connection.isClosed())
%>
<font size="+3" color="green"></b>
<% 
out.println("Successfully connected to " + "MySQL server using TCP/IP...");
connection.close();
}
catch(Exception ex){
%>
</font>
<font size="+3" color="red"></b>
<%
out.println("Unable to connect to database.");
}
%>
</font>
</body> 
</html>
