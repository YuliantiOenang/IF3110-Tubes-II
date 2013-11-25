package tubes2wbd;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class test
 */
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String message;
    // JDBC driver name and database URL
    static final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
    static final String DB_URL="jdbc:mysql://localhost/wbd2";

    //  Database credentials
    static final String USER = "root";
    static final String PASS = "";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test() {
        super();
        // TODO Auto-generated constructor stub
        message = "Hello!";
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");

	      // Actual logic goes here.
	      PrintWriter out = response.getWriter();
	      out.println("<h1>" + message + "</h1>");
	      out.println("<h2>"+request.getParameter("id") +"</h2>" );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Set response content type
	      response.setContentType("text/html");

	      // Actual logic goes here.
	      PrintWriter out = response.getWriter();
	      out.println("<h1>" + message + "</h1>");
	      out.println("<h2>"+request.getParameter("nama") +"</h2>" );
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
	          sql = "SELECT * FROM kartu_kredit where owner='"+request.getParameter("nama")+"'";
	          ResultSet rs = stmt.executeQuery(sql);

	          // Extract data from result set
	          while(rs.next()){
	             //Retrieve by column name
	             String username = rs.getString("owner");
	             String nama = rs.getString("nama");
	             String nomor = rs.getString("card_number");

	             //Display values
	             out.println("Username\t: " + username + "<br>");
	             out.println("Nama: " + nama + "<br>");
	             out.println("Nomor Kartu : "+nomor+"<hr>");
	          }
	          out.println("</body></html>");

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

}
