package admin;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class edit_barang extends HttpServlet{
	
	//private String message;
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {

		String id = request.getParameter("id");
		String nama = request.getParameter("nama");
		String harga = request.getParameter("harga");
		String sold = request.getParameter("sold");
		String stok = request.getParameter("stok");
		String image = request.getParameter("image");
		String kategori = request.getParameter("kategori");
		
		final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
	    final String DB_URL="jdbc:mysql://localhost/warung";
	    
	    //  Database credentials
	    final String USER = "root";
	    final String PASS = "";
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		try{
	         // Register JDBC driver
			
	         Class.forName("com.mysql.jdbc.Driver").newInstance();
	         
	         try{
		         // Open a connection
		         Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
		         
		         // Execute SQL query
		         PreparedStatement preparedstatemen = null;
		         String sql = "UPDATE user SET nama = ? , harga = ? , sold = ? . stok = ? , image = ? , kategori = ? WHERE id = ?";
		         preparedstatemen = conn.prepareStatement(sql);
		         preparedstatemen.setString(1, nama);
		         preparedstatemen.setString(2, harga);
		         preparedstatemen.setString(3, sold);
		         preparedstatemen.setString(4, stok);
		         preparedstatemen.setString(5, image);
		         preparedstatemen.setString(6, kategori);
		         preparedstatemen.setString(7, id);
		         
		         preparedstatemen.executeUpdate();
		         
		         out.print("<h1>SET </h1>");
	         }catch (SQLException e){
	        	 out.print(e.getMessage());
	         }finally{
	        	 
	         }
	         
	        
	         out.println("</body></html>");

	         // Clean-up environment
	      }catch(Exception e){
	         //Handle errors for Class.forName
	         e.printStackTrace();
	         e.getMessage();
	         
	      }
	}
}