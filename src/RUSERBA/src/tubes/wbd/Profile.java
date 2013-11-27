package tubes.wbd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Profile
 */
@WebServlet("/Profile")
public class Profile extends HttpServlet {
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
    public Profile() {
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
	    String pass = "";
	    String nama = "";
	    String email = "";
	    String hp = "";
	    String alamat = "";
	    String provinsi = "";
	    String kota = "";
	    String kodepos = "";
	     
	    try{
	       // Register JDBC driver
	       Class.forName("com.mysql.jdbc.Driver");

	         // Open a connection
	       conn = DriverManager.getConnection(DB_URL,USER,PASS);

	       // Execute SQL query
	       stmt = conn.createStatement();
	       String sql;
	       sql = "SELECT * FROM user";
	       ResultSet rs = stmt.executeQuery(sql);

	       // Extract data from result set	         
	       while(rs.next()){
	    	   //Retrieve by column name
	           String _username = rs.getString("username");
	            
	           if (_username.equals(username))
	           {
	        	   	pass = ""+rs.getString("password");
	       	    	nama = ""+rs.getString("nama");
	       	    	email = ""+rs.getString("email");
	       	    	hp = ""+rs.getString("hp");
	       	    	alamat = ""+rs.getString("alamat");
	       	    	provinsi = ""+rs.getString("provinsi");
	       	    	kota = ""+rs.getString("kota");
	       	    	kodepos = ""+rs.getString("kodepos");
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
		
	    request.setAttribute("username", username);
	    request.setAttribute("pass", pass);
	    request.setAttribute("nama", nama);
	    request.setAttribute("email", email);
	    request.setAttribute("hp", hp);
	    request.setAttribute("provinsi", provinsi);
	    request.setAttribute("kota", kota);
	    request.setAttribute("alamat", alamat);
	    request.setAttribute("kodepos", kodepos);
	      
	    request.getRequestDispatcher("/profile.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		  
	    String username = request.getParameter("username");
	    String pass = request.getParameter("pass");
	    String nama = request.getParameter("nama");
	    String email = request.getParameter("email");
	    String hp = request.getParameter("hp");
	    String alamat = request.getParameter("alamat");
	    String provinsi = request.getParameter("provinsi");
	    String kota = request.getParameter("kota");
	    String kodepos = request.getParameter("kodepos");
	    
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
	         sql = "UPDATE creditcard SET  pass=?, nama=?, email=?, hp=?, alamat=?, provinsi=?, kota=?, kodepos=? WHERE username=?";
	         PreparedStatement ps = conn.prepareStatement(sql);

	         ps.setString(1, pass);
	         ps.setString(2, nama);
	         ps.setString(3, email);
	         ps.setString(4, hp);
	         ps.setString(5, alamat);
	         ps.setString(6, provinsi);
	         ps.setString(7, kota);
	         ps.setString(8, kodepos);
	         ps.setString(9, username);
	         
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
		
	      request.setAttribute("username", username);
		  request.setAttribute("pass", pass);
		  request.setAttribute("nama", nama);
		  request.setAttribute("email", email);
		  request.setAttribute("hp", hp);
		  request.setAttribute("provinsi", provinsi);
		  request.setAttribute("kota", kota);
		  request.setAttribute("alamat", alamat);
		  request.setAttribute("kodepos", kodepos);
		request.getRequestDispatcher("/profile.jsp").forward(request, response);
	}

}
