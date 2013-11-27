

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Servlet implementation class AJAXbuy
 */
public class AJAXregister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AJAXregister() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		  final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
	      final String DB_URL="jdbc:mysql://localhost/ruserba";

	      //  Database credentials
	      final String USER = "root";
	      final String PASS = "";
	      
	      PrintWriter out = response.getWriter();
	      
	      Connection conn = null;
	      Statement stmt = null;
	      
	      
	      String username1 = request.getParameter("username");
	      String nama1 = request.getParameter("nama");
	      String nohp1 = request.getParameter("nohp");
	      String alamat1 = request.getParameter("alamat");
	      String provinsi1 = request.getParameter("provinsi");
	      String kota1 = request.getParameter("kota");
	      String kodepos1 = request.getParameter("kodepos");
	      String email1 = request.getParameter("email");
	      String password1 = request.getParameter("password");
	      
	      String sql;
	      sql = "SELECT * FROM user WHERE username = '" + username1 + "'";
	      
	      try {
		    	// Register JDBC driver
		          Class.forName(JDBC_DRIVER);
		          boolean usname = true;

		          // Open a connection
		          conn = DriverManager.getConnection(DB_URL,USER,PASS);

		          stmt = conn.createStatement();
		          ResultSet rs = stmt.executeQuery(sql);
		          
		          while(rs.next()){
		        	  usname = false;
		          }
		          
		          if (usname){
		        	 out.print("true");
		        	 String sql1 = "INSERT INTO user (username, nama, nohp, alamat, provinsi,"
		        	 		+ "kota, kodepos, email, password, transaksi)"
		        	 		+ "VALUES ('"+ username1 +"', '"+ nama1 +"','"+ nohp1 +"',"
		        	 				+ "'"+ alamat1 +"','"+ provinsi1 +"','"+ kota1 +"',"
		        	 						+ "'"+ kodepos1 +"','"+ email1 +"','"+ password1 +"',0)";
		        	  stmt.executeUpdate(sql1);
		          } else{
		        	  out.print("false");
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


