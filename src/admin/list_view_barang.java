package admin;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class list_view_barang extends HttpServlet{
	
	//private String message;
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
	    final String DB_URL="jdbc:mysql://localhost/warung";
	    
	    //  Database credentials
	    final String USER = "root";
	    final String PASS = "";
		response.setContentType("text/html");
	 
      // Actual logic goes here.
		PrintWriter out = response.getWriter();
		//out.print("Usernamenya ini " + request.getParameter("username"));
		
		
		String username = request.getParameter("username");
		
		ArrayList<String> ids = new ArrayList<>();
        ArrayList<String> namas = new ArrayList<>();
        ArrayList<String> hargas = new ArrayList<>();
        ArrayList<String> solds = new ArrayList<>();
        ArrayList<String> stoks = new ArrayList<>();
        ArrayList<String> images = new ArrayList<>();
        ArrayList<String> kategoris = new ArrayList<>();
	
		try{
	         // Register JDBC driver
			 
	         Class.forName("com.mysql.jdbc.Driver").newInstance();

	         // Open a connection
	         Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
	         
	         // Execute SQL query
	         Statement stmt = conn.createStatement();
	         String sql;
	         sql = "SELECT * FROM produk";
	         ResultSet rs = stmt.executeQuery(sql);
	         
	         //out.println("Test");
	         // Extract data from result set
	         //out.println("<h1>NAMA BARANG INI BOR #Hmif48<br></h1><ul>");
	         
	         
	         
	         while(rs.next()){
	        	 ids.add(rs.getObject(1).toString());
	        	 namas.add(rs.getObject(2).toString());
	        	 hargas.add(rs.getObject(3).toString());
	        	 solds.add(rs.getObject(4).toString());
	        	 stoks.add(rs.getObject(5).toString());
	        	 images.add(rs.getObject(6).toString());
	        	 kategoris.add(rs.getObject(7).toString());
	         }
	         out.println("</ul>");
	         
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
		request.setAttribute("listid", ids);
		request.setAttribute("listnama", namas);
		request.setAttribute("listharga", hargas);
		request.setAttribute("listsold", solds);
		request.setAttribute("liststok", stoks);
		request.setAttribute("listimage", images);
		request.setAttribute("listkategori", kategoris);
		request.setAttribute("username", request.getParameter("username"));	
        RequestDispatcher view = request.getRequestDispatcher("apa.jsp");
        view.forward(request, response);
	}
	
	
}