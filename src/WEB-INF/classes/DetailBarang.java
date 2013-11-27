// Loading required libraries 
import java.io.*; 
import java.util.*; 
import javax.servlet.*; 
import javax.servlet.http.*; 
import java.sql.*;
 
public class DetailBarang extends HttpServlet{ 
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException 
	{
		String DataNama=new String();
		Integer DataHarga=new Integer(0);
		String DataKategori=new String();
		
		String NamaReq;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/datauser", "root", "root");
			Statement s = (Statement) con.createStatement();
			NamaReq = (String)request.getParameter("Nama");
			ResultSet rs;
			rs = s.executeQuery("SELECT * FROM BARANG WHERE NamaBarang="+"\""+NamaReq+"\""+";");
			while(rs.next()){ 
				//Retrieve by column name 
				int id = rs.getInt("IdBarang"); 
				int harga = rs.getInt("Harga"); 
				String Name = rs.getString("NamaBarang"); 
				String Kategori= rs.getString("Kategori"); 
				DataNama=Name;
				DataHarga=harga;
				DataKategori=Kategori;
			}
			s.close();
			con.close();
			request.setAttribute("DetailKategoriBarang",DataKategori);
			request.setAttribute("DetailNamaBarang", DataNama);
			request.setAttribute("DetailHargaBarang",DataHarga);
		}catch(Exception e){
			throw new SecurityException("Class not found " + e.toString());
		}
		request.getRequestDispatcher("DetailBarang.jsp").forward(request, response);
	} 
}