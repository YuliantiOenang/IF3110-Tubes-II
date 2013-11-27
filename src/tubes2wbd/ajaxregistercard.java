package tubes2wbd;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ajaxregistercard
 */
public class ajaxregistercard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
	final String DB_URL="jdbc:mysql://localhost/wbd1";
	//  Database credentials
	final String USER = "root";
	final String PASS = "";   
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ajaxregistercard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String name = null,cardnumber = null;
		if (request.getParameter("cardnumber") != null) {
			cardnumber = request.getParameter("cardnumber");
		}
		if (request.getParameter("name") != null) {
			name = request.getParameter("name");
		}
		String ret = "notvalid";
		String regex = "/^([A-Za-z]{1,10})+([ ][A-Za-z]{1,20})+$/";
		if (name.matches(regex) && cardnumber.length() == 16) {
			ret = "valid";
		}
		out.print(ret);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
