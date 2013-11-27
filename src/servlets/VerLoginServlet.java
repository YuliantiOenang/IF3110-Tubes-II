package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DatabaseAccess;

/**
 * Servlet implementation class VerLoginServlet
 */
@WebServlet("/VerLoginServlet")
public class VerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public VerLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String username;
		String password;
		username = request.getParameter("username");
		password = request.getParameter("password");

		String nilai = "awal";
		DatabaseAccess dbAccess = new DatabaseAccess();
		String SQL = "SELECT * FROM `user` WHERE USERNAME=\"" + username + "\" AND PASSWORD =\"" + password + "\";";
		System.out.println(SQL);
		ResultSet rs = dbAccess.doQuery(SQL);

		if (rs == null) {
			nilai = "gagal";
			System.out.println("gagal login kakak");
		}

		int i = 0;
		try {
			System.out.println("masuk");
			while (rs.next()) {
				String role = rs.getObject(10).toString();
				System.out.println("role : "+role);
				i++;
				nilai = "berhasil";
				System.out.println("berhasil login" + i);
				// session handling
				HttpSession session = request.getSession();
				session.setAttribute("IT", null);
				session.setAttribute("username",username);
				session.setAttribute("role", role);
				System.out.println("Session :"+((String)session.getAttribute("username")));			
//				
//				if (session.isNew()) {
//					session.setAttribute("username", username);
//					System.out.println("Session BARU :"+((String)session.getAttribute("username")));
//				}else{
//					System.out.println("Session LAMA :"+((String)session.getAttribute("username")));
//				}
				System.out.println("SESSION ID :"+session.getId());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("status", nilai);
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context
				.getRequestDispatcher("/loginresponse.jsp");
		dispatcher.forward(request, response);
	}
}
