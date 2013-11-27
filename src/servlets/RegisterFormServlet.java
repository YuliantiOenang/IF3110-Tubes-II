package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DatabaseAccess;

/**
 * Servlet implementation class RegisterFormServlet
 */
@WebServlet("/RegisterFormServlet")
public class RegisterFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterFormServlet() {
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
		try {
			System.out.println("MASUK HLLOOO");
			// Obtain value of Catalog Id field to ve validated.
			String newUsername = request.getParameter("newusername");

			// Obtain Connection			
			DatabaseAccess dbAccess = new DatabaseAccess();
			String SQL = "SELECT * FROM `user` WHERE USERNAME=\"" + newUsername;
			System.out.println(SQL);
			ResultSet rs = dbAccess.doQuery(SQL);
			
			// set headers before accessing the Writer
			response.setContentType("text/xml");
			response.setHeader("Cache-Control", "no-cache");

			PrintWriter out = response.getWriter();

			// then write the response
			// If result set is empty set valid element to true
			if (rs.next()) {
				System.out.println("TELAH ADA");
				out.println("<username>" + "<valid>false</valid></username>");
			} else {
				System.out.println("BELUM ADA");
				out.println("<valid>true</valid>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
