<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>

<%
	// Connect to database
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ruserba","root",""); 
	Statement st= con.createStatement(); 
	
	// Query from database
	ResultSet rs=st.executeQuery("SELECT * FROM barang WHERE nama='"+request.getParameter("namanew")+"'");
	
	if (rs.next()) {
		out.print("false") ;
	}
	
	else {
		rs=st.executeQuery("SELECT * FROM barang WHERE nama='"+request.getParameter("nama")+"'");
	
		if (!rs.next()) {
			out.print("false") ;
		}
		else {
			String sql = 	"UPDATE barang SET "+
							"nama='"+request.getParameter("namanew")+
							"' WHERE nama='"+request.getParameter("nama")+"'";
			st.executeUpdate(sql);
			File oldgambar =new File("c:\\xampp\\tomcat\\webapps\\tubes2\\images\\"+request.getParameter("nama")+".jpg");
			File newgambar =new File("c:\\xampp\\tomcat\\webapps\\tubes2\\images\\"+request.getParameter("namanew")+".jpg");
 
			if(oldgambar.renameTo(newgambar)){
				System.out.println("Rename succesful");
			}else{
				System.out.println("Rename failed");
			}
			File olddeskripsi =new File("c:\\xampp\\tomcat\\webapps\\tubes2\\deskripsi\\"+request.getParameter("nama")+".txt");
			File newdeskripsi =new File("c:\\xampp\\tomcat\\webapps\\tubes2\\deskripsi\\"+request.getParameter("namanew")+".txt");
 
			if(olddeskripsi.renameTo(newdeskripsi)){
				System.out.println("Rename succesful");
			}else{
				System.out.println("Rename failed");
			}
			out.print("true");
		}
	}
	con.close();
%>