package servlets;

import java.io.IOException;
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
import javax.servlet.http.HttpSession;

import bean.Barang;
import bean.Transaksi;

@WebServlet("/addcart")
public class addcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Transaksi> IT = new ArrayList<Transaksi>();
	private Barang barang;

    public addcart() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("IT") == null) {
			IT.clear();
		}
		int qt = Integer.parseInt(request.getParameter("qt"));
		String id_barang = request.getParameter("id_barang");
		String request_tambahan = request.getParameter("request_tambahan");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Barang barang = null;
		String q = "SELECT * FROM `progin_13511021`.barang WHERE id_barang="+id_barang;
		try {
			String userName = "root";
			String password = "";
			String url = "jdbc:mysql://localhost/progin_13511021";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url, userName, password);
		} catch (Exception e) {
			System.out.println("Cannot connect to database server");
		}
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(q);
			
			while (rs.next()) {
				barang = new Barang(rs);
			}
			
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		Transaksi temp = new Transaksi(barang,qt,request_tambahan);
		IT.add(temp);
		session.setAttribute("IT", IT);
		
		ArrayList<Transaksi> req = (ArrayList<Transaksi>) session.getAttribute("IT");
		System.out.println(req.get(0).getRequest_tambahan());
		System.out.println(""+req.size());
		
		request.setAttribute("arrayTransaksi", req);
		
		response.sendRedirect("");
		System.out.print("masukkkk");
	}

}
