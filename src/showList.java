
import java.awt.List;
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

import kelas.Barang;

/**
 * Servlet implementation class showList
 */
public class showList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showList() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public String formalify(String name){
    	return Character.toUpperCase(name.charAt(0)) + name.substring(1);
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String db = "toko_imba";
		java.sql.Connection con = null;
		ArrayList<Barang> barangs = new ArrayList<Barang>();
		String barangCat = null;
		try{
			barangCat = request.getParameter("cat");
		} catch(Exception e){
			e.printStackTrace();
		}

		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/"+db, "root", "");
			System.out.println (db+ "database successfully opened.");
			
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery("SELECT * FROM inventori JOIN kategori ON inventori.id_kategori = kategori.id_kategori AND kategori.nama_kategori = \"" + barangCat + "\"");
			
			while(rs.next()){
				String name = rs.getString("nama_inventori");
				Barang brg = new Barang(name);
				brg.setId_inven(rs.getInt("id_inventori"));
				brg.setDesc(rs.getString("description"));
				brg.setHarga(rs.getInt("harga"));
				brg.setJumlah(rs.getInt("jumlah"));
				barangs.add(brg);
				//request.setAttribute("name", name);
			}
			
			request.setAttribute("barangs", barangs);
		}
		catch(SQLException | ClassNotFoundException e) {
			System.out.println("SQLException caught: " +e.getMessage());
		}
		
		request.setAttribute("kategori", formalify(barangCat));
		request.getRequestDispatcher("showList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
