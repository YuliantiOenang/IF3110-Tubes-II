package com.frexesc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DbConnection dbConnection = new DbConnection();
		Connection connection = dbConnection.mySqlConnection();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		RequestDispatcher dispatcher;
		HttpSession session = request.getSession(true);
		
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM user WHERE username='" + username + "' and password='" + password + "' LIMIT 1");
			if (rs.next()) {
				request.setAttribute("response", "login successful");
				session.setAttribute("user_id", rs.getInt("id"));
				session.setAttribute("username", rs.getString("username"));
				
				/* Creating cookies */
				Cookie idCookie = new Cookie("user_id", rs.getString("id"));
				Cookie usernameCookie = new Cookie("username", rs.getString("username"));
				idCookie.setMaxAge(60 * 60 * 24 * 30);
				usernameCookie.setMaxAge(60 * 60 * 24 * 30);
				
				/* Adding cookies to response */
				response.addCookie(idCookie);
				response.addCookie(usernameCookie);
			} else {
				request.setAttribute("response", "login unsuccessful");
			}
			dispatcher = getServletContext().getRequestDispatcher("/loginresponse.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
