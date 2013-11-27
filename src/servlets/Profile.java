package servlets;

import java.io.IOException;
import java.sql.ResultSet;

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
 * Servlet implementation class Profile
 */
@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Profile() {
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
		HttpSession session = request.getSession();
		if(session.getAttribute("username")==null){
			ServletContext context = getServletContext();
			RequestDispatcher dispatcher = context
					.getRequestDispatcher("/index");
			dispatcher.forward(request, response);
		}else{
			String ID = request.getParameter("id");
			
			DatabaseAccess dbAccess = new DatabaseAccess();
			String SQL = "SELECT * FROM `progin_13511021`.user WHERE username = '"
					+ ID + "'";
			System.out.println(SQL);
			ResultSet rs = dbAccess.doQuery(SQL);

			try {
				if (!rs.next()) {
					System.out.println("Cannot Access Profile Right Now");		
				} else {				
					request.setAttribute("fullname", rs.getObject("nama_lengkap"));
					request.setAttribute("username", rs.getObject("username"));
					request.setAttribute("email", rs.getObject("email"));
					request.setAttribute("mobile", rs.getObject("handphone"));
					request.setAttribute("address", rs.getObject("address"));
					request.setAttribute("province", rs.getObject("province"));
					request.setAttribute("state", rs.getObject("state"));
					request.setAttribute("postalcode", rs.getObject("postcode"));
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			// $profile_query =
			// "SELECT * FROM `progin_13511059`.user WHERE username = '".$id."'";
			// $profile_hasil = mysql_query($profile_query,$con);
			// if(!$profile_hasil){
			// echo "Cannot Access Profile Right Now";
			// }
			// else{
			// $profile_row = mysql_fetch_array($profile_hasil);
			// echo '
			// <h3>',$profile_row['nama_lengkap'],'</h3><br>
			// <p>username :',$profile_row['username'],' </p><br>
			// <p>email :',$profile_row['email'],' </p><br>
			// <p>Mobile :',$profile_row['handphone'],' </p><br>
			// <p>Address :',$profile_row['address'],' </p><br>
			// <p>Province :',$profile_row['province'],' </p><br>
			// <p>State : ',$profile_row['state'],'</p><br>
			// <p>Postal Code :',$profile_row['postcode'],' </p><br>
			// <a href="editprofile.php"> Edit Profile </a>
			// ';
			// }
			
			ServletContext context = getServletContext();
			RequestDispatcher dispatcher = context
					.getRequestDispatcher("/profile.jsp");
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
