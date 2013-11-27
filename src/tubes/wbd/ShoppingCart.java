package tubes.wbd;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShoppingCart
 */
@WebServlet("/ShoppingCart")
public class ShoppingCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// JDBC driver name and database URL
    static final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
    static final String DB_URL="jdbc:mysql://localhost/ruserba";

    //  Database credentials
    static final String USER = "root";
    static final String PASS = "";
            
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username = request.getParameter("username");
		ArrayList<Integer> list_id = new ArrayList<Integer>();
		ArrayList<Integer> list_kuantitas = new ArrayList<Integer>();
		
		if (username.length() == 0)
		{
			response.sendRedirect("registrasi.jsp");
			return;
		}
		
		  Connection conn = null;
		    Statement stmt = null;
		    try{
		       // Register JDBC driver
		       Class.forName("com.mysql.jdbc.Driver");

		         // Open a connection
		       conn = DriverManager.getConnection(DB_URL,USER,PASS);

		       // Execute SQL query
		       stmt = conn.createStatement();
		       String sql;
		       sql = "SELECT * FROM cart WHERE username="+username;
		       ResultSet rs = stmt.executeQuery(sql);

		       // Extract data from result set
		       int flag = 0;
		         
		       while(rs.next()){
		    	   //Retrieve by column name
		    	   int id_barang = rs.getInt("id_barang");
		    	   int kuantitas = rs.getInt("kuantitas");
		           
		    	   list_id.add(id_barang);
		    	   list_kuantitas.add(kuantitas);
		       }
		       
		       // Clean-up environment
		       rs.close();
		       stmt.close();
		       conn.close();
		    }catch(SQLException se){
		    	//Handle errors for JDBC
		        se.printStackTrace();
		    }catch(Exception e){
		         //Handle errors for Class.forName
		         e.printStackTrace();
		    }finally{
		         //finally block used to close resources
		         try{
		            if(stmt!=null)
		               stmt.close();
		         }catch(SQLException se2){
		         }// nothing we can do
		         try{
		            if(conn!=null)
		            conn.close();
		         }catch(SQLException se){
		            se.printStackTrace();
		         }//end finally try
		      } //end try
		
		    request.setAttribute("list_id", list_id);
		    request.setAttribute("list_kuantitas", list_kuantitas);
		    request.getRequestDispatcher("/shoppingcart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
