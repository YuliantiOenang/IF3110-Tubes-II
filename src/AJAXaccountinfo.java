

import java.io.IOException;
import java.io.PrintWriter;
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
	      
	      String username = request.getParameter("username");
	    
	      Connection conn = null;
	  	  Statement stmt = null;

	      PrintWriter out = response.getWriter();
	      
	      String query = "SELECT * FROM user WHERE username= '"+ username +"'";
	      
	      try {
	    	// Register JDBC driver
	          Class.forName(JDBC_DRIVER);

	          // Open a connection
	          conn = DriverManager.getConnection(DB_URL,USER,PASS);

	          stmt = conn.createStatement();
	          ResultSet rs = stmt.executeQuery(query);
		      
	          while(rs.next()){
	        	  out.print(rs.getString("username") + "|" +  
	        			  rs.getString("nama") + "|" + 
	        			  rs.getString("nohp") + "|" + 
	        			  rs.getString("alamat") + "|" + 
	        			  rs.getString("provinsi") + "|" + 
	        			  rs.getString("kota") + "|"+
	        			  rs.getString("kodepos") + "|" + 
	        			  rs.getString("email") + "|" + 
	        			  rs.getString("password") + "|" + 
	        			  rs.getString("transaksi")); 
	
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
