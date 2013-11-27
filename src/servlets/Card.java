package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;

import bean.DatabaseAccess;

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
		HttpSession session = request.getSession();
		if (session.getAttribute("username") != null) {
			String cardnumber = (String) request.getParameter("cardnum");
			String nameoncard = (String) request.getParameter("namecard");
			String expdate = (String) request.getParameter("expdate");
			String cardowner = (String) session.getAttribute("username");

			String query = "INSERT INTO creditcard (card_id, card_nameon, card_expdate, card_owner) VALUES ('"
					+ cardnumber
					+ "','"
					+ nameoncard
					+ "','"
					+ expdate
					+ "','"
					+ cardowner + "')";

			System.out.println("woii -> " + query);

			// Run the query
			DatabaseAccess dbAccess = new DatabaseAccess();
			System.out.print("UPDATE : " + dbAccess.doQueryUpdate(query));
			

		} else {
			System.out.print("Gag Ada Session [Card.java : 69]");
		}
		response.sendRedirect("");
		System.out.print("PINDAH WOIII");
	}
}
