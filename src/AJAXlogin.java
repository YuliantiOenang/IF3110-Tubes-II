

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Servlet implementation class AJAXlogin
 */
public class AJAXlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AJAXlogin() {
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
		// Query from database
		final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
		final String DB_URL="jdbc:mysql://localhost/ruserba";
		
		Connection conn = null;
	    Statement stmt = null;
		
		PrintWriter out = response.getWriter();
		
		String user = request.getParameter("username");
		String pass = request.getParameter("password");
	      
		String sql = "SELECT * FROM user WHERE username='" + user + "'";
		
		try{
			// Register JDBC driver
	          Class.forName(JDBC_DRIVER);
	        // Open a connection
	          conn = DriverManager.getConnection(DB_URL,"root","");

	          stmt = conn.createStatement();
	          ResultSet categories = stmt.executeQuery(sql);
			
	          while (categories.next()){
				
				if(categories.getString("username").equals(user) && 
				   categories.getString("password").equals(pass)){
						
					out.print("true");
						}
					else {
						
					out.print("false");
				}
			}
				
		
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

