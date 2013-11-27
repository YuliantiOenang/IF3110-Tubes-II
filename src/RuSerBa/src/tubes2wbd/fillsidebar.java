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

import org.json.simple.*;
import org.json.simple.parser.*;
/**
 * Servlet implementation class fillsidebar
 */
public class fillsidebar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// JDBC driver name and database URL
	static final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
	static final String DB_URL="jdbc:mysql://localhost/wbd1";
	//  Database credentials
	static final String USER = "root";
	static final String PASS = "";   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fillsidebar() {
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
		// TODO Auto-generated method stub
		Connection conn = null;
	    Statement stmt = null;
	    PrintWriter out = response.getWriter();
		JSONArray tabel = new JSONArray();
		JSONParser parser = new JSONParser();
		JSONArray contents = new JSONArray();
		if (request.getParameter("data") != null) {
		   Object obj = null;
			try {
				obj = parser.parse(request.getParameter("data"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   tabel = (JSONArray)obj;
		}
	    for(int i=0;i<tabel.size();i++){
	    	if(!tabel.get(i).equals("0")){
	    		JSONObject content = new JSONObject();
	    		try {
	    			Class.forName("com.mysql.jdbc.Driver");
	    			conn = DriverManager.getConnection(DB_URL,USER,PASS);
	    			stmt = conn.createStatement();
	    			String sql;
	    			sql = "SELECT * FROM barang WHERE id = '"+i+"'";
	    			ResultSet rs = stmt.executeQuery(sql);
	    			while (rs.next()) {
	    				content.put("id",i);
	    				content.put("nama",rs.getString("nama"));
	    				content.put("harga",rs.getString("harga"));
	    				content.put("jumlah",rs.getString("jumlah"));
	    				content.put("dibeli",tabel.get(i));
	    			}
	    			contents.add(content);
	    			// Clean-up environment
			        rs.close();
			        stmt.close();
			        conn.close();
	    		} catch (ClassNotFoundException e) {	
	    			e.printStackTrace();
	    		} catch (SQLException e) {
	    			e.printStackTrace();
	    		}
	    	}
	    }
	    out.print(contents);
	}

}
