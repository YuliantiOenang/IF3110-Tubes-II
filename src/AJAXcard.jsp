<%@ page import ="java.sql.*" %>
<%
	// Connect to database
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ruserba","root",""); 
	Statement st= con.createStatement();

	// Query from database
	ResultSet rs=st.executeQuery("SELECT * FROM user WHERE cardno='"+request.getParameter("cardno")+"' OR nameoncard='"+request.getParameter("nameoncard")+"'");
	if (rs.next()) {
		out.print("false") ;
	}
	else {
		String sql = "UPDATE user SET cardno='"+request.getParameter("cardno")+"',nameoncard='"+request.getParameter("nameoncard")+"',expdate='"+request.getParameter("expdate")+"' WHERE username='"+request.getParameter("username")+"'";
		st.executeUpdate(sql);
		out.print("true");
	}
	con.close();
%>