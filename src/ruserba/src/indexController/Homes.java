package indexController;

import java.io.IOException;
import javaModel.Kategori;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databaseLib.DatabaseAdapter;

/**
 * Servlet implementation class Homes
 */
@WebServlet("/homes")
public class Homes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DatabaseAdapter DBA = new DatabaseAdapter();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Homes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Query = "select * from kategori";
		Kategori K = new Kategori(DBA);
		K.executeQuery(Query);
		System.out.println(Query);
		
		request.setAttribute("kategoris", K);
		request.setAttribute("effect", false);
		
		request.setAttribute("includeJspContent", "index.jsp");
		request.getRequestDispatcher("/view/layout.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
