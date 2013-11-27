// Loading required libraries
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;
 
public class DatabaseAccesses extends HttpServlet{
    
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

public void doGet(HttpServletRequest request,
                  HttpServletResponse response)
            throws ServletException, IOException
  {
      // JDBC driver name and database URL
      final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
      final String DB_URL="jdbc:mysql://localhost/ruserba";

      //  Database credentials
      final String USER = "root";
      final String PASS = "";

      // Set response content type
      response.setContentType("text/html");
      PrintWriter out = response.getWriter();
      String title = "Database Result";
      String docType =
        "<!doctype html public \"-//w3c//dtd html 4.0 " +
         "transitional//en\">\n";
         out.println(docType +
         "<html>\n" +
         "<head><title>" + title + "</title></head>\n" +
         "<body bgcolor=\"#f0f0f0\">\n" +
         "<h1 align=\"center\">" + title + "</h1>\n");
      Connection conn = null;
	Statement stmt = null;
	try{
         // Register JDBC driver
         Class.forName("com.mysql.jdbc.Driver");

         // Open a connection
         conn = DriverManager.getConnection(DB_URL,USER,PASS);

         // Execute SQL query
         stmt = conn.createStatement();
         String sql;
         sql = "SELECT kategori, nama, harga FROM barang";
         ResultSet rs = stmt.executeQuery(sql);

         // Extract data from result set
         while(rs.next()){
            //Retrieve by column name
            String kategori  = rs.getString("kategori");
            String nama = rs.getString("nama");
            int harga = rs.getInt("harga");
            
            //Display values
            out.println("Kategori: " + kategori + "<br>");
            out.println(", Nama: " + nama + "<br>");
            out.println(", Harga: " + harga + "<br>");
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
   }
} 