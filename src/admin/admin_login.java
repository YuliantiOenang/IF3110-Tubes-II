package admin;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;
import java.util.List;

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
		
		
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		List ids=null,namas=null,hargas=null,solds=null,stoks=null,images=null,kategoris=null;
		try{
	         // Register JDBC driver
			 
	         Class.forName("com.mysql.jdbc.Driver").newInstance();

	         // Open a connection
	         Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
	         
	         // Execute SQL query
	         Statement stmt = conn.createStatement();
	         String sql;
	         sql = "SELECT username,password FROM user WHERE username=\'"+username+"\' AND password=\'"+password+"\'";
	         ResultSet rs = stmt.executeQuery(sql);
	         
	         //out.println("Test");
	         // Extract data from result set
	         //out.println("<h1>NAMA BARANG INI BOR #Hmif48<br></h1><ul>");
	         if(rs.next()){ // kalau false berarti nextnya kosong
	        	 response.setStatus(response.SC_MOVED_TEMPORARILY);
	             response.setHeader("Location", "/warung/list_barang?username="+username); 
	         }else{
	        	 response.setStatus(response.SC_MOVED_TEMPORARILY);
	             response.setHeader("Location", "login.jsp"); 
	         }
	         out.print("TEST");
	         while(rs.next()){
	            //Retrieve by column name
	        	
	        	out.print("<li> id : "+rs.getObject(1).toString()+"</li>");
	        	out.print("<li> nama :"+rs.getObject(2).toString()+"</li>");
	        	//out.print("<li> harga :"+rs.getObject(3).toString()+"</li>");
	        	//out.print("<img src=\""+rs.getString("image")+"\">");
	        	//out.print("<li> sold :"+rs.getInt("sold")+"</li>");
	        	//out.print("<li> stok :"+rs.getInt("stok")+"</li>");
	        	//out.print("<li> image :"+rs.getString("image")+"</li>");
	        	//out.print("<li> kategori :"+rs.getString("kategori")+"</li>");
	        	
	        	//out.print("<li> harga :"+rs.getInt("harga")+"</li>");
	        	//out.print("<li> sold :"+rs.getInt("sold")+"</li>");
	        	//out.print("<li> stok :"+rs.getInt("stok")+"</li>");
	        	//out.print("<li> image :"+rs.getString("image")+"</li>");
	        	//out.print("<li> kategori :"+rs.getString("kategori")+"</li>");
	        	 /*
	            ids.add(rs.getInt("id"));
	            namas.add(rs.getString("nama"));
	            hargas.add(rs.getInt("harga"));
	            solds.add(rs.getInt("sold"));
	            stoks.add(rs.getInt("stok"));
	            images.add(rs.getString("image"));
	            kategoris.add(rs.getString("kategori"));
	            */
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
		//out.print("Kosong gak : " + ids.isEmpty());
		//request.setAttribute("listid", ids);
        //RequestDispatcher view = request.getRequestDispatcher("apa.jsp");
        //view.forward(request, response);
	}
	
	
}