<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
	Connection con = null;	
	try {
		try { 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}catch(ClassNotFoundException ce){out.println(ce);} 
   
		con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
		String query = "SELECT jumlah FROM cart WHERE username=? AND namabarang=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, request.getParameter("username"));
		st.setString(2, request.getParameter("namabarang"));
				
		ResultSet rs = st.executeQuery();
		if (rs.next()) {
			query = "UPDATE cart SET jumlah=? WHERE username=? AND namabarang=?";
			PreparedStatement st2 = con.prepareStatement(query);
			st2.setInt(1, Integer.parseInt(request.getParameter("jumlahBarang")) + rs.getInt(1));
			st2.setString(2, request.getParameter("username"));
			st2.setString(3, request.getParameter("namabarang"));
			
			st2.executeUpdate();
			st2.clearParameters();
			out.println("<script>document.location.href='shoppingbag.jsp'</script>");
		} else {
			query = "INSERT INTO cart(namabarang, jumlah, keterangan, username) VALUES(?, ?, '', ?)";
			PreparedStatement st2 = con.prepareStatement(query);
			st2.setString(1, request.getParameter("namabarang"));
			st2.setInt(2, Integer.parseInt(request.getParameter("jumlahBarang")));
			st2.setString(3, request.getParameter("username"));
			
			st2.executeUpdate();
			st2.clearParameters();
			out.println("<script>document.location.href='shoppingbag.jsp'</script>");
		} 
		
		st.clearParameters();
		con.close();
	} catch (Exception e) {out.println(e.toString()); };
%>