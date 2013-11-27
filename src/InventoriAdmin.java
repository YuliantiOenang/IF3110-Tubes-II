

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
import kelas.Database;

/**
 * Servlet implementation class DetailBarang
 */
public class InventoriAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DB_NAME = "toko_imba";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InventoriAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		java.sql.Connection con = null;
		int barangId = -1; boolean add = true;
		String action = "";
		try{
			action = request.getParameter("action");
			request.setAttribute("action", action);
			
			add = action.equals("add");
			
			barangId = Integer.parseInt(request.getParameter("gid"));						
			request.setAttribute("gid", Integer.toString(barangId));
			
		} catch(Exception e){
			e.printStackTrace();
		}
		
		Barang barang = null;
		
		if (add){
			barang = new Barang("");	
			request.setAttribute("barang", barang);
		}else{
			try {
				Class.forName("org.gjt.mm.mysql.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost/"+DB_NAME, Database.getUser(), Database.getPass());
				System.out.println (DB_NAME+ "database successfully opened.");
				
				Statement state = con.createStatement();
				ResultSet rs = state.executeQuery("SELECT * FROM inventori NATURAL JOIN kategori WHERE id_inventori = " + barangId);
	
				while(rs.next()){
					String name = rs.getString("nama_inventori");
					barang = new Barang(name);
					barang.setId_cat(rs.getInt("id_kategori"));
					barang.setId_inven(rs.getInt("id_inventori"));
					barang.setDesc(rs.getString("description"));
					barang.setHarga(rs.getInt("harga"));
					barang.setGambar(rs.getString("gambar"));
					barang.setJumlah(rs.getInt("jumlah"));
				}
				
				request.setAttribute("barang", barang);
			}
			catch(SQLException | ClassNotFoundException e) {
				System.out.println("SQLException caught: " +e.getMessage());
			}
		}
		
		request.getRequestDispatcher("inventori.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("gid"));
		Barang barang = new Barang(request.getParameter("nama"));
		barang.setHarga(Integer.parseInt(request.getParameter("harga")));
		barang.setJumlah(Integer.parseInt(request.getParameter("jumlah")));
		barang.setId_cat(Integer.parseInt(request.getParameter("kategori")));
		barang.setDesc(request.getParameter("desc"));
		barang.setGambar(request.getParameter("gambar"));
		
		try{
			java.sql.Connection con = null;
			Class.forName("org.gjt.mm.mysql.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/"+DB_NAME, Database.getUser(), Database.getPass());
			System.out.println (DB_NAME+ "database successfully opened.");
			
			Statement statement = con.createStatement();
			
			if(action.equals("add")){
				add(statement, barang);
			}else if(action.equals("edit")){
				edit(statement, id, barang);
			}else if(action.equals("delete")){
				delete(statement, id);
			}
			
			response.getWriter().write("ok");
		}catch(Exception e){
			e.printStackTrace();
			response.getWriter().write("error: " + e.toString());
		}
	}
	
	private static String quote(String str){
		return new StringBuilder().append('"').append(str).append('"').toString();
	}
	
	private void add(Statement statement, Barang barang) throws SQLException{
		StringBuilder query = new StringBuilder();
				
		query.append("INSERT INTO inventori(id_kategori, nama_inventori, jumlah, gambar, description, harga) VALUES (");
		query.append(barang.getId_cat()).append(",");
		query.append(quote(barang.getNama())).append(",");
		query.append(barang.getJumlah()).append(",");
		query.append(quote("")).append(",");
		query.append(quote(barang.getDesc())).append(",");
		query.append(barang.getHarga()).append(")");
		
		System.out.println(query.toString());
		
		statement.executeUpdate(query.toString());
	}
	
	private void edit(Statement statement, int id, Barang barang) throws SQLException{
		StringBuilder query = new StringBuilder();
		
		query.append("UPDATE inventori SET ");
		query.append("id_kategori = ").append(barang.getId_cat()).append(",");
		query.append("nama_inventori = ").append(quote(barang.getNama())).append(",");
		query.append("jumlah = ").append(barang.getJumlah()).append(",");
		query.append("description = ").append(quote(barang.getDesc())).append(",");
		query.append("harga = ").append(barang.getHarga());
		query.append(" WHERE id_inventori = ").append(id);
		
		System.out.println(query.toString());
		statement.executeUpdate(query.toString());
	}
	
	private void delete(Statement statement, int id) throws SQLException{
		StringBuilder query = new StringBuilder();
		
		query.append("DELETE FROM inventori WHERE id_inventori = ").append(id);
		
		statement.executeUpdate(query.toString());
	}

}
