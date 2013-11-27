<%-- 
    Document   : checkBarang
    Created on : Nov 27, 2013, 5:10:11 PM
    Author     : Administrator
--%>

<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
	Connection con = null;
	try {
		try { 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}catch(ClassNotFoundException ce){out.println(ce);} 
   
		con = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");
		
		String namab = request.getParameter("nb");
		
		PreparedStatement st;
		
		st = con.prepareStatement("SELECT nama_barang FROM Barang WHERE nama_barang=?");
		st.setString(1, namab);
		
		ResultSet rs;
		rs  = st.executeQuery();
		
		if(rs.next()) {
			response.getWriter().print(rs.getString(1) + " sudah terpakai");
		} else response.getWriter().print(1);
		
		st.clearParameters();
		con.close();
	} catch (Exception e) {out.println("Unable to connect to database."); };

%>