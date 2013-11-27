

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Servlet implementation class AJAXaddtochart
 */
public class AJAXaddtochart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AJAXaddtochart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, 
						HttpServletResponse response) 
					throws ServletException, IOException {
		
			      
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
	      String productname;
	      
	      Connection conn = null;
	  	  Statement stmt = null;

	      
	      String nama = request.getParameter("nama");
	      String qty = request.getParameter("qty");
	      
	      String sql = "SELECT * FROM barang WHERE nama = '" + nama + "'";
	       
	      try {
	    	// Register JDBC driver
	          Class.forName(JDBC_DRIVER);

	          // Open a connection
	          conn = DriverManager.getConnection(DB_URL,USER,PASS);

	          stmt = conn.createStatement();
	          ResultSet rs = stmt.executeQuery(sql);
	        
		   
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
