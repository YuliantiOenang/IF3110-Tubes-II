

import java.sql.*;

// Kelas manajemen fungsi SQL untuk User
public class UserSQL {
	static final String JDBCDRIVER = "com.mysql.jdbc.DRIVER";
	static final String DBURL = "jdbc:mysql://localhost/test";

	static final String USER = "root";
	static final String PASS = "";
	
	// FUNGSI EDIT
	// Akan memasukkan user baru di dalam database, namun informasi database masih kosong
	// Akan menghasilkan akun dengan privilege User
	public void AddUser(String id, String email, String password, String fullname, String alamat, String provinsi, String kota, int kodepos, int hp){
		
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	// Akan memasukkan informasi tentang kartu kredit ke database user dengan id username
	public void EditCCard(String id, String creditname, int creditnum, String expired){
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
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					try {
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
	}
		
	// FUNGSI PENGECEKAN
	// Mengembalikan true apabila telah terdapat user dengan id Username, false bila tidak
	public boolean CheckUsername(String Username){
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
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					try {
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}					
				}
				
				if (Result == 1)
						return true;
				else
					return false;
	}	
	// Mengembalikan true apabila telah terdapat user dengan email Email, false bila tidak
	public boolean CheckEmail(String Email){
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}					
		}
		
		if (Result == 1)
				return true;
		else
			return false;
	}
	// Mengembalikan true apabila telah terdapat kartu kredit dengan nomor CreditCard, false bila tidak
	public boolean CheckCredit(int CreditCard){
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
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}					
			}
			
			if (Result == 1)
					return true;
			else
				return false;
		}
	
	public static void main (String[] args){
		UserSQL s = new UserSQL();
		s.EditCCard("lala", "lala", 1234, "19121213");
	
	}
}	
