<%@ page import ="java.sql.*" %>
<%
	// Connect to database
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ruserba","root",""); 
	Statement st= con.createStatement(); 

	// Query from database
	ResultSet rs=st.executeQuery("SELECT * FROM user WHERE username='"+request.getParameter("username")+"'");
	rs.next();
	int transaksi = rs.getInt("transaksi") + 1;
	String sql = "UPDATE user SET transaksi="+transaksi+" WHERE username='"+request.getParameter("username")+"'";
	st.executeUpdate(sql);
	con.close();
%>