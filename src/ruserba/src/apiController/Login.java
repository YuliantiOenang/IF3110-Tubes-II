package apiController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import databaseLib.DatabaseAdapter;

/**
 * Servlet implementation class Login
 */
@WebServlet("/api/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DatabaseAdapter DBA = new DatabaseAdapter();   
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
		PrintWriter out = response.getWriter();
		JSONObject json = new JSONObject();
		try {
			json.put("status",true);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("testing1");
		out.write(json.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if (!username.isEmpty() && !password.isEmpty()) {
				String query = "select * from account where username = '" + username + "' and password = '" + password + "'";
				DBA.executeQuery(query);
				System.out.println(query);
				ResultSet RS = DBA.getQueryResult();
				try {
					if (!RS.isBeforeFirst() ) {    
						JSONObject json = new JSONObject();
						System.out.println("testing2");
						json.put("status",false);
						out.write(json.toString());
					} else {
						JSONObject json = new JSONObject();
						json.put("status",true);
						System.out.println("testing1");
						out.write(json.toString());
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				JSONObject json = new JSONObject();
				System.out.println("testing3");
				try {
					json.put("status",false);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
//				out.write(json.toString());
			}
		}catch (Exception e){
			JSONObject json = new JSONObject();
			System.out.println("testing4");
			try {
				json.put("status",false);
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
//			out.write(json.toString());
		}
	}

}
