package tubes2wbd;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * Servlet implementation class buyprocess
 */
public class buyprocess extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
	final String DB_URL="jdbc:mysql://localhost/wbd1";
	//  Database credentials
	final String USER = "root";
	final String PASS = "";  
    
	private JSONArray tabel;
	private String username;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public buyprocess() {
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
		if (request.getParameter("data") != null) {
			tabel = new JSONArray();
			JSONParser parser = new JSONParser();
			Object obj = null;
			try {
				obj = parser.parse(request.getParameter("data"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			tabel = (JSONArray)obj;
			
		}
		if (request.getParameter("username") != null) {
			username = request.getParameter("username");
		}
		
		Connection conn = null;
	    Statement stmt = null;
	    try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			
			String sql;
			
			for (int i = 0; i < tabel.size(); i++) {
				if ((Integer)tabel.get(i) > 0) {
					int jumlah = (Integer)tabel.get(i);
					sql = "UPDATE barang SET jumlah = jumlah - "+jumlah+",terjual = terjual +"+jumlah+" WHERE id = "+i;
					stmt.executeQuery(sql);
				}
			}
			
			sql = "UPDATE anggota SET jmlhtransaksi = jmlhtransaksi+1 WHERE username = "+username;
			stmt.executeQuery(sql);
			
		} catch (ClassNotFoundException e) {	
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
