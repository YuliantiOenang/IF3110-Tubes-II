<%-- 
    Document   : completeTambahBarang
    Created on : Nov 27, 2013, 5:16:39 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%@include file="dbconfig.jsp"%>
<%
	Connection con = null;
	
	try {
		try { 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}catch(ClassNotFoundException ce){out.println(ce);} 
   
		con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");
		
		PreparedStatement st;
		String query = "INSERT INTO Barang(nama_barang, kategori_barang, harga_barang, stok_barang) VALUES (?, ?, ?, ?)";
		
		st = con.prepareStatement(query);
		st.setString(1, request.getParameter("nb"));
		st.setString(2, request.getParameter("kb"));
		st.setString(3, request.getParameter("hb"));
		st.setString(4, request.getParameter("sb"));
		
		response.getWriter().print(st);
		st.executeUpdate();
		
		st.clearParameters();
		con.close();
	} catch (Exception e) {out.println(e.toString()); };

%>