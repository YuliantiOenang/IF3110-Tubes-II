package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Registration() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		Statement statement;

		try {
			String userName = "root";
			String password = "";
			String url = "jdbc:mysql://localhost/progin_13511021";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url, userName, password);
		} catch (Exception e) {
			System.out.println("Cannot connect to database server");
		}

		String username = (String) request.getParameter("username");
		String password = (String) request.getParameter("password");
		String fullname = (String) request.getParameter("fullname");
		String phonenum = (String) request.getParameter("hpnum");
		String address = (String) request.getParameter("address");
		String province = (String) request.getParameter("province");
		String kecamatan = (String) request.getParameter("kecamatan");
		String postalcode = (String) request.getParameter("postalcode");
		String email = (String) request.getParameter("Email");

		String query = "INSERT INTO user (username, nama_lengkap, password, email, handphone, address, province, state, postcode) VALUES ('"
				+ username
				+ "','"
				+ fullname
				+ "','"
				+ password
				+ "','"
				+ email
				+ "','"
				+ phonenum
				+ "','"
				+ address
				+ "','"
				+ province
				+ "','"
				+ kecamatan
				+ "','"
				+ postalcode + "')";

		// Run the query
		try {
			statement = conn.createStatement();
			statement.executeUpdate(query);
			System.out.println("Insert data succesfull");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher view = request
				.getRequestDispatcher("/cardregist.jsp");
		view.forward(request, response);
	}

}
