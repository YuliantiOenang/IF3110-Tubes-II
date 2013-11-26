<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>

<%
	// Connect to database
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ruserba","root",""); 
	Statement st= con.createStatement(); 
	
	// Query from database
	ResultSet rs=st.executeQuery("SELECT * FROM barang WHERE nama='"+request.getParameter("nama")+"'");
	
	if (rs.next()) {
		out.print("false") ;
	}
	else {
		String sql = "INSERT INTO barang (nama, harga, stok, kategori, terjual) "+
		"VALUES('"+request.getParameter("nama")+"','"+request.getParameter("harga")+"','"+request.getParameter("stok")+"','"+request.getParameter("kategori")+"',0)";
		
		st.executeUpdate(sql);
		
//File creation
String strPath = "c:\\xampp\\tomcat\\webapps\\tubes2\\deskripsi\\"+request.getParameter("nama")+".txt";
File strFile = new File(strPath);
boolean fileCreated = strFile.createNewFile();
//File appending
Writer objWriter = new BufferedWriter(new FileWriter(strFile));
objWriter.write(request.getParameter("deskripsi"));
objWriter.flush();
objWriter.close();

		out.print("true");
	}
	con.close();
%>