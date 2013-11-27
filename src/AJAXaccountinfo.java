

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AJAXaccountinfo
 */
public class AJAXaccountinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AJAXaccountinfo() {
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
		  final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
	      final String DB_URL="jdbc:mysql://localhost/ruserba";

	      //  Database credentials
	      final String USER = "root";
	      final String PASS = "";
	      
	      String username;
	    
	      Connection conn = null;
	  	  Statement stmt = null;

	      
	      if (request.getParameter("username") != null){
	    	  username = request.getParameter("productname");
	      } else {
	    	  username = "0";
	      }
	      if (request.getParameter("nama") != null){
	    	  username = request.getParameter("nama");
	      } else {
	    	  nama = "0";
	      }
	      if (request.getParameter("nohp") != null){
	    	  username = request.getParameter("nohp");
	      } else {
	    	  nohp = "0";
	      }
	      if (request.getParameter("alamat") != null){
	    	  username = request.getParameter("alamat");
	      } else {
	    	  alamat = "0";
	      }
	      if (request.getParameter("provinsi") != null){
	    	  username = request.getParameter("provinsi");
	      } else {
	    	  provinsi = "0";
	      }
	     	
	      String query = "SELECT * FROM user WHERE username= '"+ username +"'";
	      
	      try {
	    	// Register JDBC driver
	          Class.forName("com.mysql.jdbc.Driver");

	          // Open a connection
	          conn = DriverManager.getConnection(DB_URL,USER,PASS);

	          stmt = conn.createStatement();
	          ResultSet rs = stmt.executeQuery(query);
		      
	          while(rs.next()){
	          
	        	 String username1 = rs.getString("username");
	        	 String name = rs.getString("nama");
	        	 String nohp = rs.getString("nohp");
	        	 String alamat = rs.getString("alamat");
	        	 String provinsi = rs.getString("provinsi");
	        	 String kota = rs.getString("kota");
	        	 String kodepos = rs.getString("kodepos");
	        	 String email = rs.getString("email");
	        	 String password = rs.getString("password");
	        	 String transaksi = rs.getString("transaksi");
	        	 
	        	 
	        	 
	        	 
	        	 
	        	 
	        	 
	        	 
	        	 
	         //teuing pokonya masukin aja
	          }
	      } catch (SQLException e ) {
	          //JDBCTutorialUtilities.printSQLException(e);
	      } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
	          if (stmt != null) { try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} }
	      }

	}

}
