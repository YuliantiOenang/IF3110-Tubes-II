package com.frexesc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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

import com.frexesc.model.BarangBean;

/**
 * Servlet implementation class AdminBarang
 */
@WebServlet("/AdminBarang")
public class AdminBarang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBarang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DbConnection dbConnection = new DbConnection();
		Connection connection = dbConnection.mySqlConnection();
		RequestDispatcher dispatcher = null;
		if (request.getParameter("action").equals("edit")) {
			String category = request.getParameter("category");
			String selectQuery = "SELECT * FROM barang WHERE id_kategori='" + category + "'";
			try {
				Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery(selectQuery);
				ArrayList<BarangBean> barangs = new ArrayList<BarangBean>();
				while (rs.next()) {
					barangs.add(new BarangBean(rs.getLong("id"), rs.getLong("id_kategori"), rs.getString("nama_barang"), rs.getString("gambar"), rs.getInt("harga_barang"), rs.getString("keterangan"), rs.getInt("jumlah_barang")));
				}
				request.setAttribute("barangs", barangs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			dispatcher = getServletContext().getRequestDispatcher("/adminedit.jsp");
		} else if (request.getParameter("action").equals("add")) {
			dispatcher = getServletContext().getRequestDispatcher("/adminadd.jsp");
		} else if (request.getParameter("action").equals("main")) {
			dispatcher = getServletContext().getRequestDispatcher("/adminmain.jsp");
		}
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DbConnection dbConnection = new DbConnection();
		Connection connection = dbConnection.mySqlConnection();
		if (request.getParameter("action").equals("add")) {
			BarangBean barang = new BarangBean(0, Integer.parseInt(request.getParameter("category")), request.getParameter("name"), null, Integer.parseInt(request.getParameter("price")), request.getParameter("description"), Integer.parseInt(request.getParameter("amount")));
			String insertQuery = "INSERT INTO barang (id_kategori, nama_barang, gambar, harga_barang, keterangan, jumlah_barang) VALUES ('" + barang.getId_category() + "','" + barang.getName() + "','" + barang.getPicture() + "','" + barang.getPrice() + "','" + barang.getDescription() + "','" + barang.getTotal_item() + "')";
			try {
				Statement statement = connection.createStatement();
				statement.executeUpdate(insertQuery);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (request.getParameter("action").equals("update")) {
			System.out.println(request.getParameter("description"));
			BarangBean barang = new BarangBean(Integer.parseInt(request.getParameter("id")), Integer.parseInt(request.getParameter("category")), request.getParameter("name"), null, Integer.parseInt(request.getParameter("price")), request.getParameter("description"), Integer.parseInt(request.getParameter("amount")));
			String updateQuery = "UPDATE barang SET id_kategori='" + barang.getId_category() + "', nama_barang='" + barang.getName() + "', gambar='" + barang.getPicture() + "', harga_barang='" + barang.getPrice() + "', keterangan='" + barang.getDescription() + "', jumlah_barang='" + barang.getTotal_item() + "' WHERE id='" + barang.getId() + "'";
			try {
				Statement statement = connection.createStatement();
				statement.executeUpdate(updateQuery);
				PrintWriter out = response.getWriter();
				out.print("success");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (request.getParameter("action").equals("delete")) {
			String deleteQuery = "DELETE FROM barang WHERE id='" + request.getParameter("id") + "'";
			try {
				Statement statement = connection.createStatement();
				statement.executeUpdate(deleteQuery);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
