// Loading required libraries 
import java.io.*; 
import java.util.*; 
import javax.servlet.*; 
import javax.servlet.http.*; 
import java.sql.*;
 
public class SearchDB extends HttpServlet{ 
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException 
	{
		ArrayList<String> DataNama=new ArrayList<String>();
		ArrayList<Integer> DataHarga=new ArrayList<Integer>();
		
		String QueryReq;
		int PageNum;
		int ResultSize=0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/datauser", "root", "root");
			Statement s = (Statement) con.createStatement();
			QueryReq = (String)request.getParameter("Query");
			PageNum=Integer.parseInt(request.getParameter("Page"));
			PageNum=PageNum*2;
			ResultSet rs;
			rs = s.executeQuery("SELECT * FROM BARANG WHERE NamaBarang LIKE '%"+QueryReq+"%' LIMIT "+PageNum+", 2;");
			while(rs.next()){ 
				//Retrieve by column name 
				int id = rs.getInt("IdBarang"); 
				int harga = rs.getInt("Harga"); 
				String Name = rs.getString("NamaBarang"); 
				String Kategori= rs.getString("Kategori"); 
				DataNama.add(Name);
				DataHarga.add(harga);
				ResultSize++;
			}
			if (request.getAttribute("PageSize")==null && ResultSize>0){
				int PageSize=0;
				rs=s.executeQuery("SELECT * FROM BARANG WHERE NamaBarang LIKE '%"+QueryReq+"%';");
				while(rs.next()){
					PageSize++;}
				request.setAttribute("PageSize",PageSize/2-1);
			}
			s.close();
			con.close();
			request.setAttribute("QuerySearch",QueryReq);
			request.setAttribute("TabelSearchNamaBarang", DataNama);
			request.setAttribute("TabelSearchHargaBarang",DataHarga);
		}catch(Exception e){
			throw new SecurityException("Class not found " + e.toString());
		}
		request.getRequestDispatcher("Search.jsp").forward(request, response);
	} 
}