<%@ page import ="java.sql.*" %>
<%
	// Connect to database
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ruserba","root",""); 
	Statement st= con.createStatement(); 

	// Query from database
	ResultSet rs=st.executeQuery("SELECT * FROM user WHERE username='"+request.getParameter("username")+"'");
	rs.next();
	out.print(rs.getString("username")+"`"+rs.getString("nama")+"`"+rs.getString("nohp")+"`"+rs.getString("alamat")+"`"+rs.getString("provinsi")+"`"+rs.getString("kota")+"`"+rs.getString("kodepos")+"`"+rs.getString("email")+"`"+rs.getString("password")+"`"+rs.getString("transaksi"));
	con.close();
%>