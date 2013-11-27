package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Barang;

/**
 * Servlet implementation class detail
 */
@WebServlet("/detail")
public class detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String id;
	private Barang selected;
       
    public detail() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		Statement stmt = null;
		id = request.getParameter("id");
		
		try {
			String userName = "root";
			String password = "";
			String url = "jdbc:mysql://localhost/progin_13511021";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url, userName, password);
		} catch (Exception e) {
			System.out.println("Cannot connect to database server");
		}
		
		String q = "SELECT * FROM `progin_13511021`.barang WHERE id_barang = "+id;
		ResultSet rs = null;
		System.out.println(q);
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(q);
			
			while (rs.next()) {
				selected = new Barang(rs);
			}
			System.out.println(selected.getNama_barang());
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("selected", selected);
		RequestDispatcher view = request.getRequestDispatcher("/detail.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
