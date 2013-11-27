

import java.awt.Point;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class updateBarang
 */
public class updateBarang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateBarang() {
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
		System.out.println("Updating...");
		
		String db = "toko_imba";
		java.sql.Connection con = null;
		int id = Integer.parseInt(request.getParameter("id_barang"));
		int jml = Integer.parseInt(request.getParameter("jumlah"));
		
		HttpSession session = request.getSession(true);
		
		boolean found = false;
		ArrayList<Point> cart = (ArrayList<Point>) session.getAttribute("cart");
		for(Point p: cart){
			if(p.x == id){
				System.out.println("Updated!");
				found = true;
				p.y = jml;
				break;
			}
		}
		
		session.setAttribute("cart", cart);

		response.getWriter().write("Sukses!");
	}
}
