package com.frexesc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.frexesc.model.BarangBean;

/**
 * 
 * Servlet implementation class Search
 * 
 */
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Search() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		if (session.getAttribute("username") == null) {
			response.sendRedirect("../register");
		} else {
			DbConnection dbConnection = new DbConnection();
			Connection connection = dbConnection.mySqlConnection();
			String selectQuery = "SELECT * FROM barang WHERE ";
			ArrayList<String> strings = new ArrayList<String>();
			if (request.getParameter("name") != null) {
				strings.add("nama_barang LIKE '%" + request.getParameter("name") + "%'"); 
			}
			if (request.getParameter("category") != null) {
				strings.add("id_kategori='" + request.getParameter("category") + "'");
			}
			if (request.getParameter("price") != null) {
				strings.add("harga='" + request.getParameter("price") + "'");
			}
			boolean first = true;
			for (int i = 0; i < strings.size(); i++) {
				if (first) {
					first = false;
				} else {
					selectQuery += " AND ";
				}
				selectQuery += strings.get(i);
			}
			System.out.println(selectQuery);
			try {
				Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery(selectQuery);
				ArrayList<BarangBean> barangs = new ArrayList<BarangBean>();
				while (rs.next()) {
					barangs.add(new BarangBean(rs.getLong("id"), rs.getLong("id_kategori"), rs.getString("nama_barang"), rs.getString("gambar"), rs.getInt("harga_barang"), rs.getString("keterangan"), rs.getInt("jumlah_barang")));
				}
				request.setAttribute("barangs", barangs);
				getServletContext().getRequestDispatcher("/barang/search.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
