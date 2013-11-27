

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
 * Servlet implementation class AJAXcekkartu
 */
public class AJAXcekkartu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AJAXcekkartu() {
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
		  final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
	      final String DB_URL="jdbc:mysql://localhost/ruserba";

	      //  Database credentials
	      final String USER = "root";
	      final String PASS = "";
	      String username;
	      String cardno;
	      
	      Connection conn = null;
	  	  Statement stmt = null;

	      
	      if (request.getParameter("username") != null){
	    	  username = request.getParameter("username");
	      } else {
	    	  username = "0";
	      }
	      if (request.getParameter("cardno") != null){
	    	  cardno = request.getParameter("cardno");
	      } else {
	    	  cardno = "0";
	      }
	    
	    	      
	      String query = "SELECT * FROM user WHERE username =' " +
	    		  username + "'";
	      	      
	      try {
	    	// Register JDBC driver
	          Class.forName("com.mysql.jdbc.Driver");

	          // Open a connection
	          conn = DriverManager.getConnection(DB_URL,USER,PASS);

	          stmt = conn.createStatement();
	          ResultSet rs = stmt.executeQuery(query);
		      
	         if (!is_null(cardno)) {
	        	 return true;
	         }
	         else{
	        	 return false;
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
			} 
	          }
	      }
	}

}
