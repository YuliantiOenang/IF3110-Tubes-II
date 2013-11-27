

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
 * Servlet implementation class AJAXcard
 */
public class AJAXcard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AJAXcard() {
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
	      
	      Connection conn = null;
	      Statement stmt = null;
	      
	      String username = request.getParameter("username");
	      String cardno = request.getParameter("cardno");
	      String nameoncard = request.getParameter("nameoncard");
	      String expdate = request.getParameter("expdate");
	      
	      String sql;
	      sql = "SELECT * FROM user WHERE cardno = '" + cardno + "'";    
	      try {
		    	// Register JDBC driver
		          Class.forName("com.mysql.jdbc.Driver");

		          // Open a connection
		          conn = DriverManager.getConnection(DB_URL,USER,PASS);

		          stmt = conn.createStatement();
		          ResultSet rs = stmt.executeQuery(sql);
		          
		          String query;
		          query = "INSERT INTO user (username, nama, nohp, alamat, "
		          		+ "provinsi, kota, kodepos, email, password, transaksi) "
		          		+ "VALUES(username, nama, nohp, alamat, provinsi, kota, kodepos"
		          		+ "email, password,0)";
		        					
		        		ResultSet ra = stmt.executeQuery(query);
	      
	      } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      finally {
	          if (stmt != null) { 
	        	  try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
	          }
	}

}
}