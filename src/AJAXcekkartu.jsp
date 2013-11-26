<%@ page import ="java.sql.*" %>
<%
	// Connect to database
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ruserba","root",""); 
	Statement st= con.createStatement(); 
	
	// Query from database
	ResultSet rs=st.executeQuery("SELECT * FROM user WHERE username='"+request.getParameter("username")+"'");
	rs.next();
	rs.getString();
	if (rs.wasNull()) {
		out.print("true") ;
	}
	else {
		out.print("false") ;
	}
	con.close();
%>