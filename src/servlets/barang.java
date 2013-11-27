package servlets;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.RestoreAction;

import bean.Barang;

@WebServlet("/barang")
public class barang extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String id_barang;
	private String nama_barang;
	private String gambar_barang;
	private String harga_barang;
	private String kategori_barang;
	private String n_beli;
	private String keterangan;
	private String stok;

    public barang() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		id_barang = session.getAttribute("n_barang").toString();
		nama_barang = request.getParameter("nama_barang");
		harga_barang = request.getParameter("harga_barang");
		kategori_barang = request.getParameter("kategori_barang");
		n_beli = request.getParameter("n_beli");
		keterangan = request.getParameter("keterangan");
		stok = request.getParameter("stok");
		gambar_barang = request.getParameter("gambar_barang");
		
		Connection conn = null;
		Statement stmt = null;
		Statement stmt1 = null;
		ResultSet rs = null;
		System.out.println("select nama_barang from barang where nama_barang = '" + nama_barang +"'");
		String validation = "select nama_barang from barang where nama_barang = '" + nama_barang +"'";
		
		String query = "insert into barang (id_barang, nama_barang, gambar_barang, harga_barang, kategori_barang, n_beli, keterangan, stok) VALUES ('"
				+ id_barang
				+ "','"
				+ nama_barang
				+ "','"
				+ "./images/Tahu.png"
				+ "','"
				+ harga_barang
				+ "','"
				+ kategori_barang
				+ "','"
				+ n_beli
				+ "','"
				+ keterangan
				+ "','"
				+ stok + "')";
		
		System.out.print(query);
		System.out.print(validation);
		
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
			stmt1 = conn.createStatement();
			rs = stmt1.executeQuery(validation);
			if (rs == null) {
				stmt.executeUpdate(query);
			}
			stmt.close();
			stmt1.close();
			conn.close();
			System.out.println("SUkses");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher view = request.getRequestDispatcher("/sukses.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
