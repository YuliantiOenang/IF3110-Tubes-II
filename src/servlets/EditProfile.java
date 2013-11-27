package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DatabaseAccess;

/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfile() {
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

		HttpSession session = request.getSession();
		
		DatabaseAccess dbAccess = new DatabaseAccess();
		String username = (String) session.getAttribute("username");
		String password = (String) request.getParameter("password");
		String fullname = (String) request.getParameter("fullname");
		String phonenum = (String) request.getParameter("hpnum");
		String address = (String) request.getParameter("address");
		String province = (String) request.getParameter("province");
		String kecamatan = (String) request.getParameter("kecamatan");
		String postalcode = (String) request.getParameter("postalcode");

		String query = "UPDATE `user` SET "
				+ "nama_lengkap = \""
				+ fullname
				+ "\","
				+ "password = '"
				+ password
				+ "',"
				+ "handphone = '"
				+ phonenum
				+ "',"
				+ "address = '"
				+ address
				+ "',"
				+ "province ='"
				+ province
				+ "',"
				+ "state = '"
				+ kecamatan
				+ "',"
				+ "postcode = '"
				+ postalcode
				+ "'"
				+ "WHERE username = '"
				+ username
				+ "'";

		System.out.println("INI SQL[EDIT PROFILE]=>"+query);
		// Run the query		
		int hasil = dbAccess.doQueryUpdate(query);		
		RequestDispatcher view = request.getRequestDispatcher("");
		view.forward(request, response);
	}
}
