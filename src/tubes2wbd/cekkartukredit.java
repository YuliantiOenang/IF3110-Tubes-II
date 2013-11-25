package tubes2wbd;

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
 * Servlet implementation class cekkartukredit
 */
public class cekkartukredit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
	final String DB_URL="jdbc:mysql://localhost/wbd1";
	//  Database credentials
	final String USER = "root";
	final String PASS = "";      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cekkartukredit() {
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
		PrintWriter out = response.getWriter();
	    String username = request.getParameter("username");
	    if(username==null){
	    	out.print("Gagal mengambil data user!");;
	    }else{
	    	try{
				// Register JDBC driver
			    Class.forName("com.mysql.jdbc.Driver");
		       	// Open a connection
			    Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
		        // Execute SQL query
		        Statement stmt = conn.createStatement();
		        String sql = "SELECT * FROM kartu_kredit where owner='"+username+"'";
		        ResultSet rs = stmt.executeQuery(sql);
		        while(rs.next()){
		        	out.print(rs.getString("card_number"));		        }
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
	    }
	}

}
