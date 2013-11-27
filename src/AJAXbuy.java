

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import java.sql.*;

/**
 * Servlet implementation class AJAXbuy
 */
public class AJAXbuy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AJAXbuy() {
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
	      
	      String productname = request.getParameter("productname");
	      int qty = Integer.parseInt(request.getParameter("qty"));
	      String sql;
	      sql = "SELECT * FROM barang WHERE nama = '" + productname + "'";
	      
	      try {
		    	// Register JDBC driver
		          Class.forName("com.mysql.jdbc.Driver");

		          // Open a connection
		          conn = DriverManager.getConnection(DB_URL,USER,PASS);

		          stmt = conn.createStatement();
		          ResultSet rs = stmt.executeQuery(sql);
		          
		          int sisa = 0;
		          int terjual = 0;
		          String query;
		          query = "UPDATE barang SET stok = '" + sisa + "', terjual = '" + terjual + "' WHERE nama = 'productname'"; 
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


