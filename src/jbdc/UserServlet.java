package jbdc;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Set the MIME type for the response message
		response.setContentType("text/html");
		
		// Get a output writer to write the response message into the network socket
		PrintWriter out = response.getWriter();
		
		Connection conn = null;
		Statement stmt = null;
		
		try {
			// Step 1: Create a database "Connection" object (For MySQL)
			conn = DriverManager.getConnection("jdbc:mysql://localhost:8080/ruserba", "root", "");
			
			// Step 2: Create a "Statement" object inside the "Connection"
			stmt = conn.createStatement();
			
			// Step 3: Execute a SQL SELECT query
			String sqlStr = "SELECT * FROM anggota WHERE username = " + "'" + request.getParameter("username") + "'";
			
			// Print an HTML page as output of query
			out.println("<html><head><title>Query Results</title></head><body>");
			out.println("<h2>Thank you for your query.</h2>");
			out.println("<p>You query is: " + sqlStr + "</p>"); // Echo for debugging
			
			// Send the query to the server
			ResultSet rset = stmt.executeQuery(sqlStr);
			
			// Step 4: Process the query result
			int count = 0;
			while(rset.next()) {
				// Print a paragraph <p>...</p> for each row
	            out.println("<p>" + rset.getString("username") + ", " + rset.getString("password") + ", " + rset.getString("tipe") + "</p>");
	            count++;
	        }
			
	         out.println("<p>==== " + count + " records found ====</p>");
	         out.println("</body></html>");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			out.close();
			try {
				// Step 5: Close the Statement and Connection
	            if (stmt != null) stmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
