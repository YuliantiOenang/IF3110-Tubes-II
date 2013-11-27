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
 * Servlet implementation class AJAXedit
 */
public class AJAXedit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AJAXedit() {
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
	    
	      Connection conn = null;
	  	  Statement stmt = null;

	      PrintWriter out = response.getWriter();
	      
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
		  sql = "UPDATE user SET nama = '"+nama1+"',  nohp = '"+ nohp1 +"',"
		   		+ "alamat = '"+ alamat1 +"', provinsi = '"+ provinsi1 +"', kota = '"+ kota1 +"',"
		   				+ "kodepos = '"+ kodepos1 +"', email = '"+ email1 +"', "
		   						+ "password = '"+ password1 +" 'WHERE username = '" + username1 +"'" ; 
		   
	      try {
	    	// Register JDBC driver
	          Class.forName(JDBC_DRIVER);

	          // Open a connection
	          conn = DriverManager.getConnection(DB_URL,USER,PASS);
	          stmt = conn.createStatement();
	          stmt.executeUpdate(sql);
	          out.print("true");
	          
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