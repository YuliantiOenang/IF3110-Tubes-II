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
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Barang;

@WebServlet("/search")
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String page;
	private String nama_barang;
	private String kategori;
	private String harga;
	private String order;
	private ArrayList<Barang> search_result = new ArrayList<Barang>();
	private String n_item_query, search_query;
	private Integer n_item;

	public search() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
PrintWriter out = response.getWriter();
		
		Connection conn = null;
		Statement stmt1 = null;
		Statement stmt2 = null;
		search_result.clear();
		
		page = request.getParameter("page");
		nama_barang = request.getParameter("nama_barang");
		kategori = request.getParameter("kategori");
		harga = request.getParameter("harga");
		order = request.getParameter("order");
		
		int limit = (Integer.parseInt(page) - 1) * 10;
		
		try {
			String userName = "root";
			String password = "";
			String url = "jdbc:mysql://localhost/progin_13511021";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url, userName, password);
		} catch (Exception e) {
			System.out.println("Cannot connect to database server");
		}
		
		if (!nama_barang.isEmpty()) { //ada nama
			if(!harga.isEmpty()){ //ada harga
				if(!kategori.isEmpty()){
					n_item_query = "SELECT COUNT(nama_barang) AS n_item FROM `progin_13511021`.barang "+
							       "WHERE nama_barang like '%"+nama_barang+"%' AND harga_barang BETWEEN 0 AND "+harga+
							       "AND kategori_barang = "+kategori;
					search_query = "SELECT Distinct * FROM `progin_13511021`.barang "+
							       "WHERE nama_barang like '%"+nama_barang+"%' AND harga_barang BETWEEN 0 AND "+harga+
							       "AND kategori_barang = "+kategori+" ORDER BY "+order+" ASC LIMIT "+limit+", 10";
				}else { //kategori kosong
					n_item_query = "SELECT COUNT(nama_barang) AS n_item FROM `progin_13511021`.barang "
							     + "WHERE nama_barang like '%"+nama_barang+"%' AND harga_barang BETWEEN 0 AND "+harga;
					search_query = "SELECT Distinct * FROM `progin_13511021`.barang "
								 + "WHERE nama_barang like '%"+nama_barang+"%' AND harga_barang BETWEEN 0 AND "+harga+" ORDER BY "+order+" ASC LIMIT "+limit+", 10";
				}
			}else{ //harga kosong
				if(!kategori.isEmpty()) {
					n_item_query = "SELECT COUNT(nama_barang) AS n_item FROM `progin_13511021`.barang "
							     + "WHERE nama_barang like '%"+nama_barang+"%' AND kategori_barang = "+kategori;
					search_query = "SELECT Distinct * FROM `progin_13511021`.barang "
							     + "WHERE nama_barang like '%"+nama_barang+"%' AND kategori_barang = "+kategori+" ORDER BY "+order+" ASC LIMIT "+limit+", 10";
				} else {
					n_item_query = "SELECT COUNT(nama_barang) AS n_item FROM `progin_13511021`.barang "
							     + "WHERE nama_barang like '%"+nama_barang+"%'";
					search_query = "SELECT Distinct * FROM `progin_13511021`.barang "
							     + "WHERE nama_barang like '%"+nama_barang+"%' ORDER BY "+order+" ASC LIMIT "+limit+", 10";
				}
			}
		}else{// nama kosong
			if(!harga.isEmpty()){ //ada harga
				if(!kategori.isEmpty()){ //ada kategori
					n_item_query = "SELECT COUNT(nama_barang) AS n_item FROM `progin_13511021`.barang "
							     + "WHERE harga_barang BETWEEN 0 AND "+harga+"AND kategori_barang = "+kategori;
					search_query = "SELECT Distinct * FROM `progin_13511021`.barang "
							     + "WHERE harga_barang BETWEEN 0 AND "+harga+"AND kategori_barang = "+kategori+" ORDER BY "+order+" ASC LIMIT "+limit+", 10";
				}else { //kategori kosong
					n_item_query = "SELECT COUNT(nama_barang) AS n_item FROM `progin_13511021`.barang "
							     + "WHERE harga_barang BETWEEN 0 AND "+harga;
					search_query = "SELECT Distinct * FROM `progin_13511021`.barang "
							     + "WHERE harga_barang BETWEEN 0 AND "+harga+" ORDER BY "+order+" ASC LIMIT "+limit+", 10";
				}
			} else { //gak ada harga
				if(!kategori.isEmpty()) {
					n_item_query = "SELECT COUNT(nama_barang) AS n_item FROM `progin_13511021`.barang "
							     + "WHERE kategori_barang="+kategori;
					search_query = "SELECT Distinct * FROM `progin_13511021`.barang "
							     + "WHERE kategori_barang="+kategori+" ORDER BY "+order+" ASC LIMIT "+limit+", 10";
				}
			}
		}
				
		ResultSet rs_barang = null;
		ResultSet n_barang = null;
		System.out.println(n_item_query);
		System.out.println(search_query);
		try {
			stmt1 = conn.createStatement();
			stmt2 = conn.createStatement();
			n_barang = stmt1.executeQuery(n_item_query);
			rs_barang = stmt2.executeQuery(search_query);
			
			while (rs_barang.next()) {
				Barang temp = new Barang(rs_barang);
				search_result.add(temp);
			}
			
			while (n_barang.next()) {
				n_item = Integer.parseInt(n_barang.getObject(1).toString());
			}
			
			System.out.println("n_item : "+n_item);
			
			rs_barang.close();
			n_barang.close();
			stmt1.close();
			stmt2.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("search_result", search_result);
		request.setAttribute("n_item", n_item);
		RequestDispatcher view = request.getRequestDispatcher("/search.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
