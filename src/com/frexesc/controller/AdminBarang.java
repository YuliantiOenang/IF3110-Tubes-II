package com.frexesc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.frexesc.model.BarangBean;
import com.frexesc.model.KategoriBean;

/**
 * Servlet implementation class AdminBarang
 */
@MultipartConfig
public class AdminBarang extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	final String UPLOAD_DIRECTORY = "C:/Users/James Jaya/workspace/Frexesc/WebContent/img/barang/";

	public AdminBarang() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		RequestDispatcher dispatcher = null;
		if (session.getAttribute("role") == null) {
			response.sendRedirect("register");
		} else if (session.getAttribute("role").equals("1")) {
			DbConnection dbConnection = new DbConnection();
			Connection connection = dbConnection.mySqlConnection();
			if (request.getParameter("action").equals("edit")) {
				String category = request.getParameter("category");
				String selectQuery = "SELECT * FROM barang WHERE id_kategori='" + category + "'";
				String selectCQuery = "SELECT * FROM kategori";
				try {
					Statement cstmt = connection.createStatement();
					ResultSet rsc = cstmt.executeQuery(selectCQuery);
					ArrayList<KategoriBean> kategoris = new ArrayList<KategoriBean>();
					while (rsc.next()) {
						kategoris.add(new KategoriBean(rsc.getInt("id"), rsc.getString("nama")));
					}
					Statement statement = connection.createStatement();
					ResultSet rs = statement.executeQuery(selectQuery);
					ArrayList<BarangBean> barangs = new ArrayList<BarangBean>();
					while (rs.next()) {
						barangs.add(new BarangBean(rs.getLong("id"), rs.getLong("id_kategori"), rs.getString("nama_barang"), rs.getString("gambar"), rs.getInt("harga_barang"), rs.getString("keterangan"), rs.getInt("jumlah_barang")));
					}
					request.setAttribute("kategoris", kategoris);
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
		} else if (session.getAttribute("role").equals("0")) {
			response.sendRedirect("index");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	private String getFileName(Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		DbConnection dbConnection = new DbConnection();
		Connection connection = dbConnection.mySqlConnection();
		if (request.getParameter("action").equals("add")) {
			BarangBean barang = new BarangBean(0, Integer.parseInt(request.getParameter("category")), request.getParameter("name"), null, Integer.parseInt(request.getParameter("price")), request.getParameter("description"), Integer.parseInt(request.getParameter("amount")));
			String insertQuery = "INSERT INTO barang (id_kategori, nama_barang, gambar, harga_barang, keterangan, jumlah_barang) VALUES ('" + barang.getId_category() + "','" + barang.getName() + "','" + barang.getPicture() + "','" + barang.getPrice() + "','" + barang.getDescription() + "','" + barang.getTotal_item() + "')";
			int id = 0;
			try {
				Statement statement = connection.createStatement();
				statement.executeUpdate(insertQuery);
				String selectQuery = "SELECT * FROM barang WHERE nama_barang='" + barang.getName() + "'";
				Statement stmt2 = connection.createStatement();
				ResultSet rs = stmt2.executeQuery(selectQuery);
				if (rs.next()) {
					id = rs.getInt("id");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			/* upload */
			Part filePart = request.getPart("photo");
			String fileName = getFileName(filePart);
			String[] sp = fileName.toString().split("\\.");
			sp[1] = sp[1].toLowerCase();
			OutputStream out = new FileOutputStream(new File(UPLOAD_DIRECTORY + File.separator + id + "." + sp[1]));
			InputStream filecontent = filePart.getInputStream();

			int read = 0;
			final byte[] bytes = new byte[1024];

			while ((read = filecontent.read(bytes)) != -1) {
				out.write(bytes, 0, read);
			}
			if (out != null) {
				out.close();
			}
			if (filecontent != null) {
				filecontent.close();
			}
			/* end of upload */
			boolean success = true;
			try {
				Statement s = connection.createStatement();
				String updateQuery = "UPDATE barang SET gambar='" + id + "." + sp[1] + "' WHERE id='" + id + "'";
				if (s.executeUpdate(updateQuery) < 1) {
					success = false;
				}
			} catch (Exception e) {
				e.printStackTrace();
				success = false;
			}
			if (success) {
				response.sendRedirect("admin?action=main&result=success");
			} else {
				response.sendRedirect("admin?action=main&result=unsuccess");
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
