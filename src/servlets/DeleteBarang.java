package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DatabaseAccess;

/**
 * Servlet implementation class DeleteBarang
 */
@WebServlet("/DeleteBarang")
public class DeleteBarang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBarang() {
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
DatabaseAccess dbAccess = new DatabaseAccess();
		
		String id_barang = request.getParameter("id_barang");
		
		String query = "DELETE FROM `barang` WHERE id_barang="+id_barang;
		
		dbAccess.doQueryUpdate(query);
		RequestDispatcher view = request.getRequestDispatcher("sukses.jsp");
		view.forward(request, response);
	}

}
