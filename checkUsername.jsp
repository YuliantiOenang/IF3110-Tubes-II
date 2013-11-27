<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
	Connection con = null;
	
	try {
		try { 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}catch(ClassNotFoundException ce){out.println(ce);} 
   
		con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
		
		String usr = request.getParameter("u");
		
		PreparedStatement st;
		
		st = con.prepareStatement("SELECT username FROM user WHERE username=?");
		st.setString(1, usr);
		
		ResultSet rs;
		rs  = st.executeQuery();
		
		if(rs.next()) {
			response.getWriter().print(rs.getString(1) + " sudah terpakai");
		} else response.getWriter().print(1);
		
		st.clearParameters();
		con.close();
	} catch (Exception e) {out.println("Unable to connect to database."); };

%>