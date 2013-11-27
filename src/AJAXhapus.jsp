<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.File"%>
<%
	// Connect to database
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ruserba","root",""); 
	Statement st= con.createStatement(); 
	
	// Query from database
	ResultSet rs=st.executeQuery("SELECT * FROM barang WHERE nama='"+request.getParameter("nama")+"'");
	if (!rs.next()) {
		out.print("false") ;
	}
	else {
		String sql = "DELETE FROM barang "+
		"WHERE nama='"+request.getParameter("nama")+"'";
		st.executeUpdate(sql);
		File gambar=new File("c:\\xampp\\tomcat\\webapps\\tubes2\\images\\"+request.getParameter("nama")+".jpg");
		gambar.delete();
		File deskripsi=new File("c:\\xampp\\tomcat\\webapps\\tubes2\\deskripsi\\"+request.getParameter("nama")+".txt");
		deskripsi.delete();
		out.print("true");
	}
	con.close();
%>