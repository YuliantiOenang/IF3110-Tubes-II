package tubes.wbd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckKartu
 */
@WebServlet("/CheckKartu")
public class CheckKartu extends HttpServlet {
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
    public CheckKartu() {
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
	      
	    String name = request.getParameter("name");
	    String number = request.getParameter("number");
	    String date1 = request.getParameter("date1");
	     
	    try{
	       // Register JDBC driver
	       Class.forName("com.mysql.jdbc.Driver");

	         // Open a connection
	       conn = DriverManager.getConnection(DB_URL,USER,PASS);

	       // Execute SQL query
	       stmt = conn.createStatement();
	       String sql;
	       sql = "SELECT * FROM creditcard";
	       ResultSet rs = stmt.executeQuery(sql);

	       // Extract data from result set
	       int flag = 0;
	         
	       while(rs.next()){
	    	   //Retrieve by column name
	           String _name = rs.getString("name");
	           String _number = rs.getString("number");
	           String _date = rs.getString("date");
	           String _username = rs.getString("username");
	           
	           if (_name.equals(name) && _number.equals(number) && _date.equals(date1))
	           {
	        	   if (_username == null)
	        	   {
	        		   flag = 1; break;
	        	   }
	        	   else
	        	   {
	        		   flag = 2;
	        	   }
	           }
	        			   
	       }
	       if (flag == 1) out.print("OK");
	       else if (flag == 2) out.print("USED"); 
	       else out.print("FAIL");
	       
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
