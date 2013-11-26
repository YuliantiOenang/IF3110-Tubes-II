package transactionController;

import java.io.IOException;
import java.util.ArrayList;
import javaModel.Barang;
import javaModel.Kategori;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import databaseLib.DatabaseAdapter;

/**
 * Servlet implementation class Home
 */
@WebServlet("/cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DatabaseAdapter DBA = new DatabaseAdapter();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		boolean isLogin = true;
//		if (session.getAttribute("isLogin")!=null)
//			isLogin = (boolean)session.getAttribute("isLogin");
//		else
//			isLogin = false;
		
		if (isLogin) {
			int total = 0;
			int ind = 1;
			
			ArrayList <String> arrayn = new ArrayList<String>();
			ArrayList <String> arrayc = new ArrayList<String>();
			ArrayList <String> arrayp = new ArrayList<String>();
			ArrayList <String> arrayq = new ArrayList<String>();
			ArrayList <String> arrayst = new ArrayList<String>();
			if (session.getAttribute("dibeli")!=null) {
				ArrayList <String> array = (ArrayList<String>) session.getAttribute("dibeli");
				ind = 1;
				total = 0;
				Kategori K = new Kategori(DBA);
				for (String item : array) {
					if ((session.getAttribute(item)!=null) && ((int)session.getAttribute(item) > 0)){
						int jml = (int)session.getAttribute(item);
						String q = "select * from barang where nama = "+item;
						String k = "";
						Barang B = new Barang(DBA);
						for (int i = 0; i < K.id.size(); i++)
							if (K.id.get(i).equals(B.id.get(0))) {
								k = K.nama_kategori.get(i);
								break;
							}
						
						B.executeQuery(q);
						
						int harga = 0;
						for (int j = 0; j < B.harga.get(0).length(); j ++) {
							harga = harga * 10 + (int) (B.harga.get(0).charAt(j) - '0');
						}
						int subtotal = harga * jml;
						total += subtotal;
						ind++;
						arrayn.add(B.nama.get(0));
						arrayc.add(k);
						arrayp.add(B.harga.get(0));
						arrayq.add(item);
						arrayst.add(subtotal+"");
					}
				}
			} 
			request.setAttribute("total_shopping",total);
			request.setAttribute("namabeli",arrayn);
			request.setAttribute("katbeli",arrayc);
			request.setAttribute("hargabeli",arrayp);
			request.setAttribute("jumlahbeli",arrayq);
			request.setAttribute("stbeli",arrayst);
			
			request.setAttribute("includeJspContent", "shoppingcart.jsp");
			request.getRequestDispatcher("/view/layout.jsp").forward(request, response);	
		} else {
			response.sendRedirect("home");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}
