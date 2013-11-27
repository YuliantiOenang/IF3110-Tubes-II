package tubes.wbd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
 * Servlet implementation class Beli
 */
@WebServlet("/Beli")
public class Beli extends HttpServlet {
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
    public Beli() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/plain");	
		PrintWriter out = response.getWriter();
				
		Connection conn = null;
		Statement stmt = null;
			      
		String username = request.getParameter("username");
			
		ArrayList<Integer> list_barang = new ArrayList<Integer>();
		ArrayList<Integer> list_kuantitas = new ArrayList<Integer>();
		
		int total_harga = 0;
		
		try{
			// Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			         // Open a connection
			       conn = DriverManager.getConnection(DB_URL,USER,PASS);

			       // Execute SQL query
			       stmt = conn.createStatement();
			       String sql;
			       sql = "SELECT * FROM cart";
			       ResultSet rs = stmt.executeQuery(sql);

			       // Extract data from result set			         
			       while(rs.next()){
			    	   //Retrieve by column name
			           String _username = rs.getString("username");
			           int _id_barang = rs.getInt("id_barang");
			           int _kuantitas = rs.getInt("kuantitas");
			           
			           if (_username.equals(username))
			           {
			        	   list_barang.add(_id_barang);
			        	   list_kuantitas.add(_kuantitas);
			           }
			        			   
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
		
		/* CHECK & UPDATE ON DB */
		conn = null;
		stmt = null;
		try{
			// Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			         // Open a connection
			       conn = DriverManager.getConnection(DB_URL,USER,PASS);

			       // Execute SQL query
			       stmt = conn.createStatement();
			       String sql;
			       sql = "SELECT id, quantity, sold, price FROM product";
			       ResultSet rs = stmt.executeQuery(sql);

			       // Extract data from result set			         
			       while(rs.next()){
			    	   //Retrieve by column name
			           int _id_barang = rs.getInt("id");
			           int _kuantitas = rs.getInt("quantity");
			           int _sold = rs.getInt("sold");
			           int _price = rs.getInt("price");
			           
			           for (int i = 0; i < list_barang.size(); ++i)
			           {
			        	   if (list_barang.get(i) == _id_barang)
			        	   {
			        		   total_harga += _price * list_kuantitas.get(i);
			        		   
			        			Statement stmt2 = null;
			        			stmt2 = conn.createStatement();
			        			String sql2;
			 			       sql2 = "UPDATE product SET  quantity=?, sold=? WHERE id=?";
				 		         PreparedStatement ps = conn.prepareStatement(sql2);
	
				 		         ps.setInt(1, _kuantitas - list_kuantitas.get(i));
				 		         ps.setInt(2, _sold + list_kuantitas.get(i));
				 		         ps.setInt(3, list_barang.get(i));
				 		         
				 		         ps.executeUpdate();

			        	   }
			           }
			        			   
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
		
		
		
		
		/* DELETE OLD DATA */
		conn = null;
		stmt = null;
		try{
			// Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			         // Open a connection
			       conn = DriverManager.getConnection(DB_URL,USER,PASS);

			       // Execute SQL query
			       stmt = conn.createStatement();
			       String sql;
			       sql = "DELETE FROM cart WHERE username=?";
			         PreparedStatement ps = conn.prepareStatement(sql);

			         ps.setString(1, username);
			         ps.executeUpdate();

			       // Clean-up environment
			       
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
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
