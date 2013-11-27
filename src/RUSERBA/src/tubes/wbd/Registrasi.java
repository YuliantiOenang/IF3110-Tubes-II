package tubes.wbd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Registrasi
 */
@WebServlet("/Registrasi")
public class Registrasi extends HttpServlet {
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
    public Registrasi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
	         sql = "INSERT INTO user VALUES (?,?,?,?,?,?,?,?,?,?)";
	         PreparedStatement ps = conn.prepareStatement(sql);

	         ps.setString(1, request.getParameter("username"));
	         ps.setString(2, request.getParameter("pass"));
	         ps.setString(3, request.getParameter("nama"));
	         ps.setString(4, request.getParameter("email"));
	         ps.setString(5, request.getParameter("hp"));
	         ps.setString(6, request.getParameter("alamat"));
	         ps.setString(7, request.getParameter("provinsi"));
	         ps.setString(8, request.getParameter("kota"));
	         ps.setString(9, request.getParameter("kodepos"));
	         ps.setString(10, "biasa");
	         ps.executeUpdate();
	         // Clean-up environment
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
	      
	      int flag = 0;
	      
	      // Check kartu kredit
	      conn = null;
	      try{
	         // Register JDBC driver
	         Class.forName("com.mysql.jdbc.Driver");

	         // Open a connection
	         conn = DriverManager.getConnection(DB_URL,USER,PASS);

	         // Execute SQL query
	         stmt = conn.createStatement();
	         String sql;
	         sql = "SELECT username FROM creditcard";
	         ResultSet rs = stmt.executeQuery(sql);

	         // Extract data from result set
	         String username = request.getParameter("username");
	         
	         while(rs.next()){
	            //Retrieve by column name
	            String _username = rs.getString("username");
	            
	            if (_username.matches(username)) 
	            	flag = 1;	            
	         }
	         
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
	      
	      
	      request.setAttribute("from_register", "YES");
		      
		  request.getRequestDispatcher("/registerkartu.jsp").forward(request, response);
	}
}
