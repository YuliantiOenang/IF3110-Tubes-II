package com.frexesc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DbConnection dbConnection = new DbConnection();
		Connection connection = dbConnection.mySqlConnection();
		String username = request.getParameter("username");
		String password = request.getParameter("password1");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String telephone = request.getParameter("telephone");
		String address = request.getParameter("address");
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String postal = request.getParameter("postal");

		HttpSession session = request.getSession(true);

		String insertQuery = "INSERT INTO user (nama, username, password, email, handphone, alamat, kota, provinsi, kodepos) VALUES ('" + name + "','" + username + "','" + password + "','" + email + "','" + telephone + "','" + address + "','" + city + "','" + province + "','" + postal + "')";

		try {
			Statement statement = connection.createStatement();
			statement.executeUpdate(insertQuery);
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM user WHERE username='" + username + "' and password='" + password + "' LIMIT 1");
			if (rs.next()) {
				session.setAttribute("user_id", rs.getInt("id"));
				session.setAttribute("username", rs.getString("username"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("home.jsp");
	}

}
