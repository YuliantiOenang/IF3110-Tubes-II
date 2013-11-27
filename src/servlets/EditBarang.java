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
 * Servlet implementation class EditBarang
 */
@WebServlet("/EditBarang")
public class EditBarang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBarang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		DatabaseAccess dbAccess = new DatabaseAccess();
		
		String id_barang = request.getParameter("id_barang");
		String nama_barang = request.getParameter("new_name");
		String stok_barang = request.getParameter("new_stock");
		String harga_barang = request.getParameter("new_price");
		
		String query = "UPDATE `barang` SET "
				+ "harga_barang = \""
				+ harga_barang
				+ "\","
				+ "nama_barang = '"
				+ nama_barang
				+ "',"
				+ "harga_barang = '"
				+ harga_barang
				+ "',"
				+ "stok = '"
				+ stok_barang
				+ "'"
				+ "WHERE id_barang = '"
				+ id_barang
				+ "'";
		
		dbAccess.doQueryUpdate(query);
		RequestDispatcher view = request.getRequestDispatcher("editbarang.jsp");
		view.forward(request, response);
	}
}
