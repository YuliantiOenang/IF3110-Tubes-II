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
 * Servlet implementation class editprofilesave
 */
public class editprofilesave extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	String username,password,nama,nomorhp,alamat,provinsi,kota,kodepos,email,file_name;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editprofilesave() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("username") != null)
			username = request.getParameter("username");
		if (request.getParameter("password") != null)
			password = request.getParameter("password");
		if (request.getParameter("nama") != null)
			nama = request.getParameter("nama");
		if (request.getParameter("nomorhp") != null)
			nomorhp = request.getParameter("nomorhp");
		if (request.getParameter("alamat") != null)
			alamat = request.getParameter("alamat");
		if (request.getParameter("provinsi") != null)
			provinsi = request.getParameter("provinsi");
		if (request.getParameter("kota") != null)
			kota = request.getParameter("kota");
		if (request.getParameter("kodepos") != null)
			kodepos = request.getParameter("kodepos");
		if (request.getParameter("email") != null)
			email = request.getParameter("email");
		
		Connection conn = null;
	    Statement stmt = null;
	    PrintWriter out = response.getWriter();
	    try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			
			String sql;
			sql = "update anggota set password="+password+",nama="+nama+",nomorhp="+nomorhp+",alamat="+alamat+",provinsi="+provinsi+",kota="+kota+",kodepos="+kodepos+",email="+email+",foto="+file_name+" where username="+username;
			if (!username.equals("") && !password.equals("")) {
				//ResultSet rs = stmt.executeQuery(sql);
				int r = stmt.executeUpdate(sql);
				if (r > 0) {
					out.print("<html><body>Profile berhasil diedit!<br><a href='profile.php'>Kembali ke halaman profile</a></body></html>");
				}
				else {
					out.print("<html><body>Edit profile gagal.<br><a href='editprofile.php'>Edit ulang</a> atau <a href='index.php'>Kembali ke halaman utama</a></body></html>");
					}
			}
			else {
				out.print("<html><body>Your username or password is incorrect!<br><a href='editprofile.php'>Edit ulang</a> atau <a href='index.php'>Kembali ke halaman utama</a></body></html>");
			}
			
			
			
		} catch (ClassNotFoundException e) {	
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
