package tubes.wbd;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IndexController
 */
//@WebServlet("/IndexController")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	// JDBC driver name and database URL
    static final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
    static final String DB_URL="jdbc:mysql://localhost/ruserba";

    //  Database credentials
    static final String USER = "root";
    static final String PASS = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
        
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		 response.setContentType("text/plain");	
		  Connection conn = null;
	      Statement stmt = null;
	      
	      ArrayList<String> list_kategori = new ArrayList<String>();
	      ArrayList<ArrayList<String>> list_nama = new ArrayList<ArrayList<String>>();
	      ArrayList<ArrayList<String>> list_gambar = new ArrayList<ArrayList<String>>();
	      
	      
	      try{
	         // Register JDBC driver
	         Class.forName("com.mysql.jdbc.Driver");

	         // Open a connection
	         conn = DriverManager.getConnection(DB_URL,USER,PASS);

	         // Execute SQL query
	         stmt = conn.createStatement();
	         String sql;
	         sql = "SELECT DISTINCT category FROM product";
	         ResultSet rs1 = stmt.executeQuery(sql);

	         int i = 0;
	         
	         // Extract data from result set
	         while(rs1.next()){
	            //Retrieve by column name
	        	 String category = rs1.getString("category");
	             
	        	 list_kategori.add(category);
	        	 
	        	 Statement stmt2 = null;
	        	 stmt2 = conn.createStatement();
	        	 String sql2;
	        	 sql2 = "SELECT DISTINCT name, picture FROM product WHERE category='" + category + "' ORDER BY sold DESC";
		        
	        	 ResultSet rs2 = stmt2.executeQuery(sql2);
	        	 
	        	 list_nama.add(new ArrayList<String>());
	        	 list_gambar.add(new ArrayList<String>());
	        	 while (rs2.next())
	        	 {
	        		 String name = rs2.getString("name");
	        		 String picture = "img/" + rs2.getString("picture");
	        		 
	        		 list_nama.get(i).add(name);
	        		 list_gambar.get(i).add(picture);
	        	 }
	        	 
	        	 i++;
	        	 rs2.close();
	        	 stmt2.close();
	         }
	         
	         // Clean-up environment
	         rs1.close();
	         stmt.close();
	         conn.close();
	      }catch(SQLException se){
	         //Handle errors for JDBC
	         se.printStackTrace();
	      }catch(Exception e){
	         //Handle errors for Class.forName
	         e.printStackTrace();
	      }finally{
	         //finally block used to close resources
	         try{
	            if(stmt!=null)
	               stmt.close();
	         }catch(SQLException se2){
	         }// nothing we can do
	         try{
	            if(conn!=null)
	            conn.close();
	         }catch(SQLException se){
	            se.printStackTrace();
	         }//end finally try
	      } //end try
	      
	      int it = 0;
	      
	      request.setAttribute("list_kategori", list_kategori);
	      request.setAttribute("list_nama", list_nama);
	      request.setAttribute("list_gambar", list_gambar);
	      request.setAttribute("it", it);
	      
	      request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
