

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
	      
	      PrintWriter out = response.getWriter();
	      
	      String username1 = request.getParameter("username");
	      String cardno1 = request.getParameter("cardno");
	      String nameoncard1 = request.getParameter("nameoncard");
	      String expdate1 = request.getParameter("expdate");
	      
	      String sql;
	      sql = "SELECT * FROM user WHERE cardno = '" + cardno1 + "'";    
	      try {
		    	// Register JDBC driver
		          Class.forName(JDBC_DRIVER);
		          boolean boleh = true;
		          // Open a connection
		          conn = DriverManager.getConnection(DB_URL,USER,PASS);

		          stmt = conn.createStatement();
		          ResultSet rs = stmt.executeQuery(sql);
		          				
		          while (rs.next()){
		        	  boleh = false;
		          }
		          if(boleh){
		        	  String query = "SELECT * FROM user WHERE nameoncard = '" + nameoncard1 + "'";
		        	  ResultSet ra = stmt.executeQuery(query);
		        	  
		        	  while (ra.next()){
		        		  boleh = false;
		        	  }
		        	  	if (boleh){
		        		  out.print("true");
		        		  String sql1 = "UPDATE user SET cardno = '"+cardno1+"', nameoncard = '"+nameoncard1+"'"
			        		  		+ ", expdate = '"+expdate1+"' WHERE username = '" + username1 + "'";
			        		  stmt.executeUpdate(sql1);
		        	  } else{
		        		  out.print("false");
		        	  }
		          }
	      
	      }catch (ClassNotFoundException e) {
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
