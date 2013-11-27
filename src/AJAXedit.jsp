<%@ page import ="java.sql.*" %>
<%
	// Connect to database
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ruserba","root",""); 
	Statement st= con.createStatement(); 

	// Query from database
	String sql = 	"UPDATE user SET "+
					"username='"+request.getParameter("username")+
					"',nama='"+request.getParameter("nama")+
					"',nohp='"+request.getParameter("nohp")+
					"',alamat='"+request.getParameter("alamat")+
					"',provinsi='"+request.getParameter("provinsi")+
					"',kota='"+request.getParameter("kota")+
					"',kodepos='"+request.getParameter("kodepos")+
					"',email='"+request.getParameter("email")+
					"',password='"+request.getParameter("password")+
					"' WHERE username='"+request.getParameter("username")+"'";
	st.executeUpdate(sql);
	out.print("true");
	con.close();
%>