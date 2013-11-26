<%
	Connection con = null;
				
	try {
		try { 
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}catch(ClassNotFoundException ce){out.println(ce);} 
    
		con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
		
		PreparedStatement st = con.prepareStatement("SELECT password FROM user where username=?");
		st.setString(1, request.getParameter("username"));
		
		ResultSet rs;
		rs = st.executeQuery();
		
		response.getWriter().write("AFSASDASD");
		
		st.clearParameters();
		con.close();
	} catch (Exception e) {out.println("Unable to connect to database."); };
%>