package barangController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String id_barang = request.getParameter("id_barang");
		String id_order = request.getParameter("id_order");
		String jumlah = request.getParameter("jumlah");
		String keterangan = request.getParameter("keterangan");
		try
		{
			/*
			String Query = "INSERT INTO order_item (id_order,id_barang,jumlah,tambahan) " +
					"VALUES ('"+id_barang+"','"+
					id_order+"','"+jumlah+"','"+keterangan+"')";
			DBA.insertQuery(Query);
			System.out.println(Query);
			*/
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
