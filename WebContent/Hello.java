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
 * Servlet implementation class Hello
 */
@WebServlet("/Hello")
public class Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Hello() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println("Hello World");
		Connection conn = null;
		Statement stmt = null;
	    ResultSet rs = null;
        try
        {
            String userName = "root";
            String password = "";
            String url = "jdbc:mysql://localhost/ruserba"; 
            Class.forName ("com.mysql.jdbc.Driver").newInstance ();
            conn = DriverManager.getConnection (url, userName, password);
            
//            System.out.println ("Database connection established");
        }
        catch (Exception e)
        {
            System.out.println ("Cannot connect to database server");
        }
        
        try
		{
			stmt = conn.createStatement();
	  	  	rs = stmt.executeQuery("SELECT * FROM barang");
	  	  	while(rs.next()) {
	  	  		System.out.println(rs.getObject(1));
	  	  	}
		}catch (SQLException e){System.out.println(e.getMessage());}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
