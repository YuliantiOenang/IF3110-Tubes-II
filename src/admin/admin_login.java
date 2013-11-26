package admin;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class admin_login extends HttpServlet{
	
	//private String message;
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
	    final String DB_URL="jdbc:mysql://localhost/warung";
	    
	    //  Database credentials
	    final String USER = "root";
	    final String PASS = "";
		response.setContentType("text/html");
	 
      // Actual logic goes here.
		PrintWriter out = response.getWriter();
		out.println("<h1>" + "admin form" + "</h1>");
		out.println("Test");
		try{
	         // Register JDBC driver
			 
	         Class.forName("com.mysql.jdbc.Driver").newInstance();

	         // Open a connection
	         Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
	         
	         // Execute SQL query
	         Statement stmt = conn.createStatement();
	         String sql;
	         sql = "SELECT * FROM user";
	         ResultSet rs = stmt.executeQuery(sql);
	         out.println("Test");
	         // Extract data from result set
	         while(rs.next()){
	            //Retrieve by column name
	            int id  = rs.getInt("id");
	            //int age = rs.getInt("age");
	            //String first = rs.getString("first");
	            //String last = rs.getString("last");
	            
	            //Display values
	            out.println("ID: " + id + "<br>");
	            out.println(", Username: " + rs.getString("username")+ "<br>");
	            out.println(", Alamat: " + rs.getString("alamat") + "<br>");
	            out.println(", Provinsi: " + rs.getString("provinsi") + "<br>");
	         }
	         out.println("</body></html>");

	         // Clean-up environment
	         rs.close();
	         stmt.close();
	         conn.close();
	      }catch(SQLException se){
	         //Handle errors for JDBC
	         se.printStackTrace();
	         
	      }catch(Exception e){
	         //Handle errors for Class.forName
	         e.printStackTrace();
	         e.getMessage();
	         
	      }
	}
	
	
}