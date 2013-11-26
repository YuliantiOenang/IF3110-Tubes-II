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

@WebServlet("/index")
public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<Barang> pangan = new ArrayList<Barang>();
	private ArrayList<Barang> pakaian = new ArrayList<Barang>();
	private ArrayList<Barang> elektronik = new ArrayList<Barang>();
	private ArrayList<Barang> rumahtangga = new ArrayList<Barang>();
	private ArrayList<Barang> olahraga = new ArrayList<Barang>();
	private ArrayList<String> kategori_url = new ArrayList<String>();

	public index() {
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Connection conn = null;
		kategori_url.clear();
		Statement stmt[] = new Statement[6];
		for (int i = 0; i < 6; i++)
			stmt[i] = null;

		try {
			String userName = "root";
			String password = "";
			String url = "jdbc:mysql://localhost/progin_13511021";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url, userName, password);
		} catch (Exception e) {
			System.out.println("Cannot connect to database server");
		}

		ResultSet rs_pangan = null;
		ResultSet rs_pakaian = null;
		ResultSet rs_elektronik = null;
		ResultSet rs_rumahtangga = null;
		ResultSet rs_olahraga = null;
		ResultSet rs_kategori = null;

		String q_pangan = "SELECT * FROM `progin_13511021`.barang WHERE kategori_barang = 1 ORDER BY n_beli DESC LIMIT 0,3";
		String q_pakaian = "SELECT * FROM `progin_13511021`.barang WHERE kategori_barang = 2 ORDER BY n_beli DESC LIMIT 0,3";
		String q_elektronik = "SELECT * FROM `progin_13511021`.barang WHERE kategori_barang = 3 ORDER BY n_beli DESC LIMIT 0,3";
		String q_rumahtangga = "SELECT * FROM `progin_13511021`.barang WHERE kategori_barang = 4 ORDER BY n_beli DESC LIMIT 0,3";
		String q_olahraga = "SELECT * FROM `progin_13511021`.barang WHERE kategori_barang = 5 ORDER BY n_beli DESC LIMIT 0,3";
		String q_kategori = "SELECT DISTINCT kategori_barang FROM `progin_13511021`.barang";
		
		try {
			for (int i = 0; i < 6; i++)
				stmt[i] = conn.createStatement();
			rs_pangan = stmt[0].executeQuery(q_pangan);
			rs_pakaian = stmt[1].executeQuery(q_pakaian);
			rs_elektronik = stmt[2].executeQuery(q_elektronik);
			rs_rumahtangga = stmt[3].executeQuery(q_rumahtangga);
			rs_olahraga = stmt[4].executeQuery(q_olahraga);
			rs_kategori = stmt[5].executeQuery(q_kategori);

			while (rs_pangan.next()) {
				Barang temp = new Barang(rs_pangan);
				pangan.add(temp);
			}
			
			while (rs_pakaian.next()) {
				Barang temp = new Barang(rs_pakaian);
				pakaian.add(temp);
			}
			
			while (rs_elektronik.next()) {
				Barang temp = new Barang(rs_elektronik);
				elektronik.add(temp);
			}
			
			while (rs_rumahtangga.next()) {
				Barang temp = new Barang(rs_rumahtangga);
				rumahtangga.add(temp);
			}
			
			while (rs_olahraga.next()) {
				Barang temp = new Barang(rs_olahraga);
				olahraga.add(temp);
			}
			
			while (rs_kategori.next()) {
				int idx = Integer.parseInt(rs_kategori.getObject(1).toString());
				if (idx == 1) 
					kategori_url.add("<li> <a href='kategori?id="+idx+"&page="+1+"&order=nama_barang'>"+"Pangan</a></li>");
				else if (idx == 2) 
					kategori_url.add("<li> <a href='kategori?id="+idx+"&page="+1+"&order=nama_barang'>"+"Pakaian</a></li>");
				else if (idx == 3) 
					kategori_url.add("<li> <a href='kategori?id="+idx+"&page="+1+"&order=nama_barang'>"+"Elektronik</a></li>");
				else if (idx == 4) 
					kategori_url.add("<li> <a href='kategori?id="+idx+"&page="+1+"&order=nama_barang'>"+"Rumah Tangga</a></li>");
				else if (idx == 5) 
					kategori_url.add("<li> <a href='kategori?id="+idx+"&page="+1+"&order=nama_barang'>"+"Olah Raga</a></li>");				
			}
			
			rs_pangan.close();
			rs_pakaian.close();
			rs_elektronik.close();
			rs_rumahtangga.close();
			rs_olahraga.close();
			rs_kategori.close();
			
			for (int i = 0; i < 6; i++)
				stmt[i].close();
			conn.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("pangan", pangan);
		request.setAttribute("pakaian", pakaian);
		request.setAttribute("elektronik", elektronik);
		request.setAttribute("rumahtangga", rumahtangga);
		request.setAttribute("olahraga", olahraga);
		request.setAttribute("kategori", kategori_url);

		RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
