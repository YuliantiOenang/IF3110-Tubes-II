<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
	Connection con = null;
	
	try {
		try { 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}catch(ClassNotFoundException ce){out.println(ce);} 
   
		con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
		
		PreparedStatement st;
		String query = "UPDATE user SET fullname=?, password=?, alamat=?, provinsi=?, kota=?, kodepos=?, nohp=?, email=? WHERE username=?";
		st = con.prepareStatement(query);
		st.setString(1, request.getParameter("nl"));
		st.setString(2, request.getParameter("pass"));
		st.setString(3, request.getParameter("al"));
		st.setString(4, request.getParameter("prov"));
		st.setString(5, request.getParameter("kab"));
		st.setString(6, request.getParameter("kp"));
		st.setString(7, request.getParameter("nh"));
		st.setString(8, request.getParameter("ema"));
		st.setString(9, request.getParameter("username"));
		out.println(st);
		st.executeUpdate();
		
		st.clearParameters();
		con.close();
	} catch (Exception e) {out.println(e.toString()); };

%>