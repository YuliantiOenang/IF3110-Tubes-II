<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
	Connection con = null;
	
	try {
		try { 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}catch(ClassNotFoundException ce){out.println(ce);} 
   
		con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
		
		String usr = request.getParameter("username");
		String pass = request.getParameter("password");
		
		PreparedStatement st;
		
		st = con.prepareStatement("SELECT username FROM user WHERE username=? AND password=?");
		st.setString(1, usr);
		st.setString(2, pass);
		
		ResultSet rs;
		rs  = st.executeQuery();
		
		if (rs.next())
			response.getWriter().print(rs.getString(1));
		else response.getWriter().print(0);
		
		st.clearParameters();
		con.close();
	} catch (Exception e) {out.println("Unable to connect to database."); };

%>