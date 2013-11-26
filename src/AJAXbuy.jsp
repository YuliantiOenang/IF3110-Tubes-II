<%@ page import ="java.sql.*" %>
<%
	// Connect to database
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ruserba","root",""); 
	Statement st= con.createStatement();

	// Query from database
	ResultSet rs=st.executeQuery("SELECT * FROM barang WHERE nama='"+request.getParameter("productname")+"'");
	rs.next();
	int sisa = rs.getInt("stok") - Integer.parseInt(request.getParameter("qty"));
	int terjual = rs.getInt("terjual") + Integer.parseInt(request.getParameter("qty"));
	String sql = "UPDATE barang SET stok="+sisa+", terjual="+terjual+" WHERE nama='"+request.getParameter("productname")+"'";
	st.executeUpdate(sql);
	con.close();
%>