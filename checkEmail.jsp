<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
	Connection con = null;
	
	try {
		try { 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}catch(ClassNotFoundException ce){out.println(ce);} 
   
		con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
		
		String email = request.getParameter("e");
		
		PreparedStatement st;
		
		st = con.prepareStatement("SELECT email FROM user WHERE email=?");
		st.setString(1, email);
		
		ResultSet rs;
		rs  = st.executeQuery();
		
		if(rs.next()) {
			response.getWriter().print(rs.getString(1) + " sudah terpakai");
		} else response.getWriter().print(1);
		
		st.clearParameters();
		con.close();
	} catch (Exception e) {out.println("Unable to connect to database."); };

%>