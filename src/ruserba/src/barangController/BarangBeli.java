package barangController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import databaseLib.DatabaseAdapter;

/**
 * Servlet implementation class BarangBeli
 */
@WebServlet("/barang/beli")
public class BarangBeli extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DatabaseAdapter DBA;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BarangBeli() {
        super();
        DBA = new DatabaseAdapter();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		String id_barang = request.getParameter("id_barang");
		String id_order = request.getParameter("id_order");
		String jumlah = request.getParameter("jumlah");
		String keterangan = request.getParameter("keterangan");
//		System.out.println(id_barang);
		try
		{
			/*
			String Query = "INSERT INTO order_item (id_order,id_barang,jumlah,tambahan) " +
					"VALUES ('"+id_barang+"','"+
					id_order+"','"+jumlah+"','"+keterangan+"')";
			DBA.insertQuery(Query);
			System.out.println(Query);
			*/
			session.removeAttribute("dibeli");
			if (session.getAttribute("dibeli")==null) {
				ArrayList<String> dibeli = new ArrayList<>();
				dibeli.add(id_barang);
				session.setAttribute("dibeli", dibeli);
				session.setAttribute(id_barang, jumlah);				
			} else {				
				ArrayList<String> dibeli = (ArrayList<String>) session.getAttribute("dibeli");
				boolean exist = false;
				for (int i = 0; i < dibeli.size (); i ++) 
					if (dibeli.get(i).equals(id_barang)) {
						exist = true;
						break;
					}
//				System.out.println(id_barang + " " + exist);
				if (exist) {
					int jml = (int) session.getAttribute(id_barang);
					session.setAttribute(id_barang,jml+jumlah);
				} else {
					session.setAttribute(id_barang,jumlah);
					dibeli.add(id_barang);
					session.setAttribute("dibeli",dibeli);
				}
			}
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			JSONObject json = new JSONObject();
			json.put("content", "OKE");
			out.write(json.toString());
			out.close();
		}catch (Exception e){}
	}

}
