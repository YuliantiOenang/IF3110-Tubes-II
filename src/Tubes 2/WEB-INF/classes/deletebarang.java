// Loading required libraries 
import java.io.*; 
import java.util.*; 
import javax.servlet.*; 
import javax.servlet.http.*; 
import java.sql.*;
 
public class deletebarang extends HttpServlet{ 
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException 
	{
		String active;
		String namabarang;
		PrintWriter out = response.getWriter();
		ResultSet  rs = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/datauser", "root", "root");
			Statement s = (Statement) con.createStatement();
			Statement s2 = (Statement) con.createStatement();
			rs = s.executeQuery("SELECT * FROM barang;");
			response.setContentType("text/html"); 
			while(rs.next()) {
				namabarang = rs.getString("NamaBarang");
				active = request.getParameter(namabarang);				
				if("on".equals(active)){
					s2.executeUpdate("DELETE FROM barang WHERE NamaBarang='"+namabarang+"';");
				} 
			}
			s.close();
			con.close();
		}catch(Exception e){
			throw new SecurityException("Class not found " + e.toString());
		}
		out.println("Change success <a href = home.jsp> return to home </a>");
	} 
}