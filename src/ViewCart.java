

import java.awt.Point;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kelas.Barang;
import kelas.Database;

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
		HttpSession session = request.getSession(true);
		String db = "toko_imba";
		java.sql.Connection con = null;
		ArrayList<Point> cart = null;
		int total = 0;
		ArrayList<Barang> barangs = new ArrayList<Barang>();
		if(session.getAttribute("cart") != null){
			try {
				Class.forName("org.gjt.mm.mysql.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost/"+db, Database.getUser(), Database.getPass());
				
				cart = (ArrayList<Point>) session.getAttribute("cart");
				for(Point barangIndex: cart){
					Statement state = con.createStatement();
					ResultSet rs = state.executeQuery("SELECT * FROM inventori JOIN kategori ON inventori.id_kategori = kategori.id_kategori AND inventori.id_inventori = \"" + barangIndex.x + "\"");
					
					while(rs.next()){
						String name = rs.getString("nama_inventori");
						Barang brg = new Barang(name);
						brg.setId_cat(rs.getInt("id_kategori"));
						brg.setId_inven(rs.getInt("id_inventori"));
						brg.setDesc(rs.getString("description"));
						brg.setHarga(rs.getInt("harga"));
						total += brg.getHarga();
						brg.setGambar(rs.getString("gambar"));
						brg.setJumlah(barangIndex.y);
						barangs.add(brg);
					}
				}
			}
			catch(SQLException | ClassNotFoundException e) {
				System.out.println("SQLException caught: " +e.getMessage());
			}
		}
		request.setAttribute("total", total);
		request.setAttribute("barangs", barangs);
		request.getRequestDispatcher("viewCart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
