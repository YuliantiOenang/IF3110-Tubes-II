package tubes.wbd;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class Searching
 */
@WebServlet("/Searching")
public class Searching extends HttpServlet {
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
    public Searching() {
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
	      
	    String name = request.getParameter("nama_barang");
	    String category = request.getParameter("kategori");
	    int price = Integer.parseInt(request.getParameter("harga"));
	    
	    ArrayList<Integer> list_id = new ArrayList<Integer>();
	    ArrayList<String> list_nama = new ArrayList<String>();
	    ArrayList<String> list_gambar = new ArrayList<String>();
	    
	    try{
	       // Register JDBC driver
	       Class.forName("com.mysql.jdbc.Driver");

	         // Open a connection
	       conn = DriverManager.getConnection(DB_URL,USER,PASS);

	       // Execute SQL query
	       stmt = conn.createStatement();
	       String sql;
	       sql = "SELECT * FROM product";
	       ResultSet rs = stmt.executeQuery(sql);

	       // Extract data from result set
	       int flag = 0;
	         
	       while(rs.next()){
	    	   //Retrieve by column name
	           String _name = rs.getString("name");
	           int _price = rs.getInt("price");
	           String _category = rs.getString("category");
	           String _picture = rs.getString("picture");
	           int _id = rs.getInt("id");
	           
	           if (price == 0 && _price >= 50000) continue;
	           if (price == 1 && _price < 50000) continue;
	           if (!_category.equals(category)) continue;	           
	           if (name.length() != 0 && !_name.toLowerCase().equals(name.toLowerCase())) continue;
	           
	           list_id.add(_id);
	           list_nama.add(_name);
	           list_gambar.add(_picture);
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
	    request.setAttribute("list_nama", list_nama);
	    request.setAttribute("list_gambar", list_gambar);
		request.getRequestDispatcher("/search.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
