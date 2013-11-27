

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

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
		final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
		final String DB_URL="jdbc:mysql://localhost/TEST";

		//  Database credentials
		final String USER = "root";
		final String PASS = "password";


		Connection conn = null;
		Statement stmt = null;

		try{
		   // Register JDBC driver
		   Class.forName("com.mysql.jdbc.Driver");

		   // Open a connection
		   conn = (Connection) DriverManager.getConnection(DB_URL,USER,PASS);

		   // Execute SQL query
		   stmt = conn.createStatement();
		   String sql;
		   sql = "SELECT * FROM barang";
		   ResultSet rs = stmt.executeQuery(sql);

		   // Extract data from result set
		   while(rs.next()){
		      //Retrieve by column name
			  String kategori = rs.getString("kategori");
		      String nama  = rs.getString("nama");
		      String harga = rs.getString("harga");

		      //Display values
		      System.out.println(" Kategori: " + kategori + "<br>");
		      System.out.println(", Nama: " + nama + "<br>");
		      System.out.println(", Harga: " + harga + "<br>");
		     
		   }
		   System.out.println("</body></html>");

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

	}
	}

}
