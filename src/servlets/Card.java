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
 * Servlet implementation class Card
 */
@WebServlet("/Card")
public class Card extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Card() {
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
		// TODO : cek user aktif
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

		String cardnumber = (String) request.getParameter("cardnum");
		String nameoncard = (String) request.getParameter("username");
		String expdate = (String) request.getParameter("expcard");
		String cardowner = (String) request.getParameter("username");

		String query = "INSERT INTO creditcard (card_id, card_nameon, card_expdate, card_owner) VALUES ('"
				+ cardnumber
				+ "','"
				+ nameoncard
				+ "','"
				+ expdate
				+ "','"
				+ cardowner + "')";

		// Run the query
		try {
			statement = conn.createStatement();
			statement.executeUpdate(query);
			System.out.println("Insert data succesfull");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		RequestDispatcher view = request
				.getRequestDispatcher("/listbarang.jsp");
		view.forward(request, response);
	}

}
