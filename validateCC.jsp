<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>

<%
	Connection con = null;
	
	try {
		try { 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}catch(ClassNotFoundException ce){out.println(ce);} 
   
		con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
		
		PreparedStatement st;
		String query = "SELECT nomorkartu, namakartu FROM creditcard WHERE nomorkartu=? AND namakartu=?";
		st = con.prepareStatement(query);
		st.setString(1, request.getParameter("nomor_kartu"));
		st.setString(2, request.getParameter("nama"));
		
		ResultSet rs;
		rs = st.executeQuery();
		
		boolean success = false;
		if (rs.next()) {
			success = true;
			response.getWriter().print(1);
		} else response.getWriter().print(0);
		
		if (success) {
			Connection con2;
			try {
				try { 
					Class.forName("com.mysql.jdbc.Driver").newInstance(); 
				}catch(ClassNotFoundException ce){out.println(ce);}
				con2 = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
				
				PreparedStatement st2;
				String query2 = "INSERT INTO have(username, nomorkartu) VALUES(?, ?)";
				st2 = con2.prepareStatement(query2);
				st2.setString(1, request.getParameter("username"));
				st2.setString(2, rs.getString(1));
				
				st2.executeUpdate();
				st2.clearParameters();
				con2.close();
			} catch (Exception e) {out.println(e.toString());}
		}
		
		st.clearParameters();
		con.close();
	} catch (Exception e) {out.println(e.toString()); };

%>