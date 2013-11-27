

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ViewCart
 */
public class ViewCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCart() {
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
		String db = "toko_imba";
		java.sql.Connection con = null;
		int id = Integer.parseInt(request.getParameter("id_barang"));
		
		ArrayList<Integer> cart;
		
		HttpSession session = request.getSession(true);
		if(session.getAttribute("cart") == null){
			cart = new ArrayList<Integer>();
			cart.add(id);
			session.setAttribute("cart", cart);
		} else {
			cart = (ArrayList<Integer>) session.getAttribute("cart");
			cart.add(id);
			session.setAttribute("cart", cart);
		}
		
		request.setAttribute("cart", cart);
		request.getRequestDispatcher("viewCart.jsp").forward(request, response);
	}

}
