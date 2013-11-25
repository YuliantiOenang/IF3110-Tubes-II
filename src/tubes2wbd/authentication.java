package tubes2wbd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class authentication
 */
public class authentication extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
	final String DB_URL="jdbc:mysql://localhost/wbd1";
	//  Database credentials
	final String USER = "root";
	final String PASS = "";    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public authentication() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.print("Dor!");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    PrintWriter out = response.getWriter();
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    try{
			// Register JDBC driver
		    Class.forName("com.mysql.jdbc.Driver");
	       	// Open a connection
		    Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
	        // Execute SQL query
	        Statement stmt = conn.createStatement();
	        String sql = "SELECT * FROM anggota where username='"+username+"' and password='"+password+"'";
	        ResultSet rs = stmt.executeQuery(sql);
	        int size = 0;
	        if(rs!=null){
	        	rs.beforeFirst();  
	        	rs.last();  
	        	size = rs.getRow();
	        }
	        if(size==1){
	        	out.print(0);
	        }else{
	        	out.print(1);
	        }
	        // Clean-up environment
	        rs.close();
	        stmt.close();
	        conn.close();
      	}catch(SQLException se){
         	//Handle errors for JDBC
         	out.println(se.toString());
      	}catch(Exception e){
       	//Handle errors for Class.forName
         	out.println(e.toString());
      	}//end try
	    try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
