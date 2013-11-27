package servlets;

import java.awt.image.RescaleOp;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DatabaseAccess;
import bean.Transaksi;

/**
 * Servlet implementation class Shoppingbag
 */
@WebServlet("/Shoppingbag")
public class Shoppingbag extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Shoppingbag() {
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

		HttpSession session = request.getSession(true);
		ArrayList<Transaksi> shopList = new ArrayList<Transaksi>();
		if (session.getAttribute("username") != null) {
			ArrayList<String> card = new ArrayList<String>();
			DatabaseAccess dbAccess = new DatabaseAccess();
			
			String SQL = "SELECT * FROM `creditcard` WHERE card_owner=\""
					+ session.getAttribute("username") + "\"";
			System.out.println("INI SQL [SHOPPINGBAG] ->" + SQL);
			ResultSet rs = dbAccess.doQuery(SQL);
			
			try {
				while (rs.next()) {
					card.add(rs.getString("card_id"));
					System.out.print("<>" + rs.getString("card_id"));
				}
				request.setAttribute("card", card);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (session.getAttribute("IT") != null) {
				shopList = (ArrayList<Transaksi>) session.getAttribute("IT");
				request.setAttribute("arrayTransaksi", shopList);
			} else {
				shopList = new ArrayList<Transaksi>();
			}
			ServletContext context = getServletContext();
			RequestDispatcher dispatcher = context.getRequestDispatcher("/shoppingbag.jsp");
			dispatcher.forward(request, response);
		} else {
			ServletContext context = getServletContext();
			RequestDispatcher dispatcher = context
					.getRequestDispatcher("/ruko");
			dispatcher.forward(request, response);
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
