package tubes2wbd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class search
 */
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// JDBC driver name and database URL
	static final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
	static final String DB_URL="jdbc:mysql://localhost/wbd1";
	//  Database credentials
	static final String USER = "root";
	static final String PASS = "";
	
	private String cari,suggest;
	private int page;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("cari") != null) {
			cari = request.getParameter("cari");
		}
		if (request.getParameter("suggest") != null) {
			suggest = request.getParameter("suggest");
		}
		if (request.getParameter("page") != null) {
			page = (Integer.parseInt(request.getParameter("page")) -1) * 10;
		}
		else {
			page = 0;
		}
		
		Connection conn = null;
	    Statement stmt = null;
	    PrintWriter out = response.getWriter();
	    
		int[] id = new int[100];
		String[] nama = new String[100];
		String[] gambar = new String[100];
		String[] kategori = new String[100];
		double[] harga = new double[100];
		int size=0;
		
	    try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			
			String sql;
			sql = "SELECT * FROM barang order by kategori";
			ResultSet rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				id[size] = rs.getInt("id");
				nama[size] = rs.getString("nama");
				gambar[size] = rs.getString("gambar");
				kategori[size] = rs.getString("kategori");
				harga[size] = rs.getDouble("harga");
				size++;
			}
			
			if (cari.length() > 0) {
				if (suggest.equalsIgnoreCase("true")) {
					String hint = "";
					String kat = "";
					for (int i = 0; i < size; i++) {
						if (cari.equalsIgnoreCase(nama[i].substring(0, cari.length())) ||
							cari.equalsIgnoreCase(kategori[i].substring(0, cari.length()))	||
							cari.equalsIgnoreCase(""+harga[i])) {
							if (!kat.equals(kategori[i])) {
								hint = hint + "<li><a style='background:grey;color:white' href='halamanbarang.php?kategori="+kategori[i]+"'>"+kategori[i]+"</a></li>";
								kat=kategori[i];
							}
							String temp = "<li><a href='detailbarang.php?id="+id[i]+"'>"+nama[i]+"</a></li>";
							hint+= temp;
						}
					}
					out.print(hint);
				}
				else {
					String query2 = "select * from barang limit "+page+",10";
					ResultSet rs2 = stmt.executeQuery(query2);
					while (rs2.next()) {
						out.print("<div class='view'>");
						out.print("<img src='"+rs2.getString("gambar")+"' width='318' height='238'/>" );
						out.print("<div class='mask'>");
						out.print("<h2><a href='detailbarang.php?id="+rs2.getInt("id")+"'>"+rs2.getString("nama")+"</a></h2>");
						out.print("<p>Harga: "+rs2.getDouble("harga")+"</p>");
						out.print("<form action='shoppingbag.php' method='GET'>Masukkan jumlah yang akan dibeli: ");
						out.print("<input type='number' name='quantity' min='0' id='qty'><input type='button' value='Beli!' id='buy' onclick='tempBuy("+rs2.getInt("id")+",qty.value)'></form>");
						out.print("</div></div>");
					}
				}
			}
			
		} catch (ClassNotFoundException e) {	
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
