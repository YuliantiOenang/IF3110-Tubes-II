<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>

<%
	Connection con = null;
	
	try {
		try { 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}catch(ClassNotFoundException ce){out.println(ce);} 
   
		con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
		
		PreparedStatement st;
		String query = "INSERT INTO user(username, password, fullname, alamat, provinsi, kota, kodepos, nohp, tipe, transaksi, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		st = con.prepareStatement(query);
		st.setString(1, request.getParameter("un"));
		st.setString(2, request.getParameter("pass"));
		st.setString(3, request.getParameter("nl"));
		st.setString(4, request.getParameter("nh"));
		st.setString(5, request.getParameter("al"));
		st.setString(6, request.getParameter("prov"));
		st.setString(7, request.getParameter("kab"));
		st.setString(8, request.getParameter("kp"));
		st.setString(9, "pembeli");
		st.setInt(10, 0);
		st.setString(11, request.getParameter("ema"));
		
		response.getWriter().print(st);
		st.executeUpdate();
		
		st.clearParameters();
		con.close();
	} catch (Exception e) {out.println(e.toString()); };

%>