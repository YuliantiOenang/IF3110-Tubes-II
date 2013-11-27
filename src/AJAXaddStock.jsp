<%@ page import ="java.sql.*" %>
<%
	// Connect to database
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ruserba","root",""); 
	Statement st= con.createStatement(); 
	
	// Query barang
	
		ResultSet rs=st.executeQuery("SELECT * FROM barang WHERE nama='"+request.getParameter("namabarang")+"'");
		if (rs.next()) {
			//int add = Integer.parseInt(request.getParameter("jumlah"));
			String sql = "UPDATE barang SET "+
					"stok=(stok+"+request.getParameter("jumlah")+
					
					") WHERE nama='"+request.getParameter("namabarang")+"'";
			st.executeUpdate(sql);
			out.print("true") ;
		}
		else {
			out.print("false") ;
		}
	
	con.close();
%>