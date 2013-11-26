package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Barang;


@WebServlet("/kategori")
public class kategori extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Barang> barang = new ArrayList<Barang>();
 
    public kategori() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		Connection conn = null;
		Statement stmt = null;
		barang.clear();
		
		String id = request.getParameter("id");
		String page = request.getParameter("page");
		String order = request.getParameter("order");
		int limit = (Integer.parseInt(page) - 1) * 10;
		System.out.println("id : "+id+"--page : "+page+"--limit : "+limit);
		
		try {
			String userName = "root";
			String password = "";
			String url = "jdbc:mysql://localhost/progin_13511021";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url, userName, password);
		} catch (Exception e) {
			System.out.println("Cannot connect to database server");
		}
		
		ResultSet rs_barang = null;
		
		String q = "SELECT * FROM `progin_13511021`.barang WHERE kategori_barang = "+id+" ORDER BY "+order+" ASC LIMIT "+limit+", 10";
		
		try {
			stmt = conn.createStatement();
			rs_barang = stmt.executeQuery(q);
			
			while (rs_barang.next()) {
				Barang temp = new Barang(rs_barang);
				barang.add(temp);
			}
			
			rs_barang.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("barang", barang);
		RequestDispatcher view = request.getRequestDispatcher("/kategori.jsp");
		view.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
