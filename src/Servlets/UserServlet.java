package Servlets;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.*;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	
	static final String JDBCDRIVER = "com.mysql.jdbc.DRIVER";
	static final String DBURL = "jdbc:mysql://localhost/toko_imba";

	static final String USER = "root";
	static final String PASS = "";
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
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
		// TODO Auto-generated method stub
		if (request.getParameter("type") == "registration"){
			
			// Ambil parameter request
			String username = request.getParameter("id");
			String email = request.getParameter("email");
			
			// JSON Object untuk response
			JSONObject responsetext = new JSONObject();
			
			responsetext.put("code", "1");
			if (CheckUsername(username)){
				responsetext.put("code", "1");
			}
			else if (CheckEmail(email)){
				responsetext.put("code", "2");
			}
			else{
				String password = request.getParameter("password");
				String fullname = request.getParameter("fullname");
				String alamat = request.getParameter("a;amat");
				String provinsi = request.getParameter("provinsi");
				String kota = request.getParameter("kota");
				int kodepos = Integer.parseInt(request.getParameter("kodepos"));
				int hp = Integer.parseInt(request.getParameter("hp"));
				
				AddUser(username, email, password, fullname, alamat, provinsi, kota, kodepos, hp);
				
				responsetext.put("code", "0");
			}
			
			response.getWriter().write(responsetext.toString());
		}	
	}
	
	// FUNGSI EDIT

	// Akan memasukkan user baru di dalam database, namun informasi database masih kosong
	// Akan menghasilkan akun dengan privilege User
	private void AddUser(String id, String email, String password, String fullname, String alamat, String provinsi, String kota, int kodepos, int hp){
			
			// Variabel akses
			Connection conn = null;
			Statement stmt = null;	
			
			// Coba buka koneksi
			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DBURL, USER, PASS);
				
				// Konstruksi query
				String query = "INSERT INTO user(id,email,password,full_name,alamat,provinsi,kotakabupaten,kodepos,nomor_handphone) VALUES ('" + id + "','" + email + "','" + password + "','" + fullname + "','" + alamat + "','" + provinsi + "','" + kota + "'," + kodepos + "," + hp + ")" ;
				System.out.println(query);
				
				stmt = conn.createStatement();
				
				stmt.executeUpdate(query);					
			}catch(SQLException se){
				se.printStackTrace();	
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	// Akan memasukkan informasi tentang kartu kredit ke database user dengan id username
	private void EditCCard(String id, String creditname, int creditnum, String expired){
			// Variabel akses
			Connection conn = null;
			Statement stmt = null;	
				
			// Coba buka koneksi
			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DBURL, USER, PASS);
						
				// Konstruksi query
				String query = "UPDATE user SET creditcardname = '" + creditname + "', creditcardnum = " + creditnum + ", expireddate = '" + expired + "'";
				System.out.println(query);
						
				stmt = conn.createStatement();
						
				stmt.executeUpdate(query);					
			}catch(SQLException se){
				se.printStackTrace();	
			}catch(Exception e){
					e.printStackTrace();
			}finally{
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	// Melakukan edit profile terhadap user dengan id id
	private void EditProfile(String id, String password, String fullname, String alamat, String provinsi, String kota, int kodepos, int hp){
			// Variabel akses
			Connection conn = null;
			Statement stmt = null;	
				
			// Coba buka koneksi
			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DBURL, USER, PASS);
						
				// Konstruksi query
				String query = "UPDATE user SET password = '" + password + "', full_name = '" + fullname + "', alamat = '" + alamat + "', provinsi= '" + provinsi + "', kotakabupaten = '" + kota + "', kodepos = " + kodepos + ", nomor_handphone = " + hp;	
				System.out.println(query);
						
				stmt = conn.createStatement();
						
				stmt.executeUpdate(query);					
			}catch(SQLException se){
				se.printStackTrace();	
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	// FUNGSI PENGECEKAN
	// Mengembalikan true apabila telah terdapat user dengan id Username, false bila tidak
	private boolean CheckUsername(String Username){
			// Variabel akses
					Connection conn = null;
					Statement stmt = null;
					int Result = 0;
					
					// Coba buka koneksi
					try{
						Class.forName("com.mysql.jdbc.Driver");
						conn = DriverManager.getConnection(DBURL, USER, PASS);
						
						// Konstruksi query
						String query = "SELECT COUNT(1) as hasil FROM user WHERE id = " + "'" + Username + "'";
						System.out.println(query);
						
						stmt = conn.createStatement();
						
						ResultSet rs = stmt.executeQuery(query);
						rs.next();
						Result = rs.getInt("hasil");
					}catch(SQLException se){
						se.printStackTrace();	
					}catch(Exception e){
						e.printStackTrace();
					}finally{
						try {
							stmt.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
						try {
							conn.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}					
					}
					
					if (Result == 1)
							return true;
					else
						return false;
		}	

	// Mengembalikan true apabila telah terdapat user dengan email Email, false bila tidak
	private boolean CheckEmail(String Email){
			// Variabel akses
			Connection conn = null;
			Statement stmt = null;
			int Result = 0;
			
			// Coba buka koneksi
			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DBURL, USER, PASS);
				
				// Konstruksi query
				String query = "SELECT COUNT(1) as hasil FROM user WHERE email = " + "'" + Email + "'";
				System.out.println(query);
				
				stmt = conn.createStatement();
				
				ResultSet rs = stmt.executeQuery(query);
				rs.next();
				Result = rs.getInt("hasil");
			}catch(SQLException se){
				se.printStackTrace();	
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}					
			}
			
			if (Result == 1)
					return true;
			else
				return false;
		}

	// Mengembalikan true apabila telah terdapat kartu kredit dengan nomor CreditCard, false bila tidak
	private boolean CheckCredit(int CreditCard){
				// Variabel akses
				Connection conn = null;
				Statement stmt = null;
				int Result = 0;
				
				// Coba buka koneksi
				try{
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(DBURL, USER, PASS);
					
					// Konstruksi query
					String query = "SELECT COUNT(1) as hasil FROM user WHERE creditcardnum = " +  CreditCard;
					System.out.println(query);
					
					stmt = conn.createStatement();
					
					ResultSet rs = stmt.executeQuery(query);
					rs.next();
					Result = rs.getInt("hasil");
				}catch(SQLException se){
					se.printStackTrace();	
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try {
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}					
				}
				
				if (Result == 1)
						return true;
				else
					return false;
			}

}
