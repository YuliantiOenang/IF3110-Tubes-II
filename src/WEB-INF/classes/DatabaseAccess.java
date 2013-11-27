// Loading required libraries 
import java.io.*; 
import java.util.*; 
import javax.servlet.*; 
import javax.servlet.http.*; 
import java.sql.*;
 
public class DatabaseAccess extends HttpServlet{ 
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException 
	{
		ArrayList<String> DataNama=new ArrayList<String>();
		ArrayList<Integer> DataHarga=new ArrayList<Integer>();
		
		String KategoriReq;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/datauser", "root", "root");
			Statement s = (Statement) con.createStatement();
			KategoriReq = (String)request.getParameter("Kategori");
			PrintWriter out=response.getWriter();
			ResultSet rs;	
			if (request.getParameter("SortBy")!=null){
				if (request.getParameter("SortBy").equals("NamaBarang")){
					rs = s.executeQuery("SELECT * FROM BARANG WHERE Kategori="+"\""+KategoriReq+"\""+" ORDER BY NamaBarang ASC;");}
				else{
					rs = s.executeQuery("SELECT * FROM BARANG WHERE Kategori="+"\""+KategoriReq+"\""+" ORDER BY Harga ASC;");}
			}
			else{
				rs = s.executeQuery("SELECT * FROM BARANG WHERE Kategori="+"\""+KategoriReq+"\""+";");}
			response.setContentType("text/html"); 
			while(rs.next()){ 
				//Retrieve by column name 
				int id = rs.getInt("IdBarang"); 
				int harga = rs.getInt("Harga"); 
				String Name = rs.getString("NamaBarang"); 
				String Kategori= rs.getString("Kategori"); 
				DataNama.add(Name);
				DataHarga.add(harga);
			}
			s.close();
			con.close();
			for (String O:DataNama){
				out.println(O);}
			for (Integer O:DataHarga){
				out.println(O);}
		}catch(Exception e){
			throw new SecurityException("Class not found " + e.toString());
		}
		request.setAttribute("KategoriBarang", KategoriReq);
		request.setAttribute("TabelNamaBarang", DataNama);
		request.setAttribute("TabelHargaBarang",DataHarga);
		request.getRequestDispatcher("Barang.jsp").forward(request, response);
	} 
}