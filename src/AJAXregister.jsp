<%@ page import ="java.sql.*" %>
<%
	// Connect to database
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ruserba","root",""); 
	Statement st= con.createStatement(); 
	
	// Query from database
	ResultSet rs=st.executeQuery("SELECT * FROM user WHERE username='"+request.getParameter("username")+"' OR password='"+request.getParameter("password")+"'");
	if (rs.next()) {
		out.print("false") ;
	}
	else {
		String sql = "INSERT INTO user (username, nama, nohp, alamat, provinsi, kota, kodepos, email, password, transaksi)"+
		"VALUES('"+request.getParameter("username")+"','"+request.getParameter("nama")+"','"+request.getParameter("nohp")+"','"+request.getParameter("alamat")+"','"+request.getParameter("provinsi")+"','"+request.getParameter("kota")+"','"+request.getParameter("kodepos")+"','"+request.getParameter("email")+"','"+request.getParameter("password")+"',0)";
		st.executeUpdate(sql);
		out.print("true");
	}
	con.close();
%>