// Loading required libraries 
import java.io.*; 
import java.util.*; 
import javax.servlet.*; 
import javax.servlet.http.*; 
import java.sql.*;
 
public class ValidateLogin extends HttpServlet{ 
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException 
	{
		String DataNama=new String();
		String DataPass=new String();
		String DataCredit=new String();
		String DataEmail=new String();
		String DataNamaLengkap=new String();
		String DataHp=new String();
		String DataProvinsi=new String();
		String DataKota=new String();
		String DataAlamat=new String();
		String DataKodePos=new String();
		HttpSession session=request.getSession(true);
		String Response;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/datauser", "root", "root");
			Statement s = (Statement) con.createStatement();
			DataNama=request.getParameter("username");
			DataPass=request.getParameter("password");
			PrintWriter out=response.getWriter();
			ResultSet rs;
			boolean Found=false;
			rs = s.executeQuery("SELECT * FROM user WHERE username="+"'"+DataNama+"'"+" AND password="+"'"+DataPass+"'"+";"); 
			while(rs.next()){
				DataEmail=rs.getString("email");
				DataNamaLengkap=rs.getString("namalengkap");
				DataHp=rs.getString("nohp");
				DataProvinsi=rs.getString("provinsi");
				DataKota=rs.getString("kotakabupaten");
				DataAlamat=rs.getString("alamat");
				DataKodePos=rs.getString("kodepos");
				if (rs.getString("nocredit")!="null"){
					DataCredit=rs.getString("nocredit");}
				Found=true;
				
			}
			if (Found){
				Response="Login Berhasil!";
				Cookie usernameCookie = new Cookie("username", DataNama); //Add cookie username
				usernameCookie.setMaxAge(100);
				response.addCookie(usernameCookie);
				
				Cookie emailCookie = new Cookie("email", DataEmail); //Add cookie email
				emailCookie.setMaxAge(60*60*24);
				response.addCookie(emailCookie);
				
				Cookie PassCookie = new Cookie("password", DataPass); //Add cookie password
				PassCookie.setMaxAge(60*60*24);
				response.addCookie(PassCookie);
				
				Cookie NamaLengkapCookie = new Cookie("NamaLengkap", DataNamaLengkap); //Add cookie NamaLengkap
				NamaLengkapCookie.setMaxAge(60*60*24);
				response.addCookie(NamaLengkapCookie);
				
				Cookie NomerHpCookie = new Cookie("NomerHp", DataHp); //Add cookie Nomer Hp
				NomerHpCookie.setMaxAge(60*60*24);
				response.addCookie(NomerHpCookie);
				
				Cookie ProvinsiCookie = new Cookie("Provinsi", DataProvinsi); //Add cookie Provinsi
				ProvinsiCookie.setMaxAge(60*60*24);
				response.addCookie(ProvinsiCookie);
				
				Cookie KotaCookie = new Cookie("Kota", DataKota); //Add cookie Kota
				KotaCookie.setMaxAge(60*60*24);
				response.addCookie(KotaCookie);
				
				Cookie AlamatCookie = new Cookie("Alamat", DataAlamat); //Add cookie Alamat
				AlamatCookie.setMaxAge(60*60*24);
				response.addCookie(AlamatCookie);
				
				Cookie KodePosCookie = new Cookie("KodePos", DataKodePos); //Add cookie username
				KodePosCookie.setMaxAge(60*60*24);
				response.addCookie(KodePosCookie);
				
				session.setAttribute("username", DataNama);
				session.setAttribute("email", DataEmail);
				session.setAttribute("password", DataPass);
				session.setAttribute("NamaLengkap", DataNamaLengkap);
				session.setAttribute("NomerHp", DataHp);
				session.setAttribute("Provinsi", DataProvinsi);
				session.setAttribute("Kota", DataKota);
				session.setAttribute("Alamat", DataAlamat);
				session.setAttribute("KodePos", DataKodePos);
				
				if (DataCredit!="NULL"){
					Cookie CreditCookie = new Cookie("creditcard", DataCredit); //Add cookie Credit
					response.addCookie(CreditCookie);
					session.setAttribute("creditcard", DataCredit);
					ResultSet Credit=s.executeQuery("SELECT * FROM creditcard WHERE number="+"'"+DataCredit+"';");
					while(Credit.next()){
						String DataNamaKartu=Credit.getString("name");
						String DataNomor=Credit.getString("number");
						String DataExpire=Credit.getString("expiredate");
						session.setAttribute("creditcard", DataNomor);
						session.setAttribute("creditcardNama", DataNamaKartu);
						session.setAttribute("creditcardExpireDate", DataExpire);
						
						Cookie CreditNamaCookie = new Cookie("creditcardNama", DataNamaKartu); //Add cookie Credit
						response.addCookie(CreditNamaCookie);
						Cookie CreditExpireDateCookie = new Cookie("creditcardExpireDate", DataExpire); //Add cookie Credit
						response.addCookie(CreditExpireDateCookie);
					}
				}
				rs = s.executeQuery("SELECT count(*) FROM transactionlog WHERE username="+"'"+DataNama+"'"+";"); 
				String JumlahTrans=new String();
				while(rs.next()){
					JumlahTrans=rs.getString("count(*)");}
				Cookie JumlahTransCookie = new Cookie("JumlahTransaksi", JumlahTrans); //Add cookie Jumlah Transaksi
				response.addCookie(JumlahTransCookie);
			}
			else{
				Response="Login Gagal!";}
			out.println(Response);
			s.close();
			con.close();
		}catch(Exception e){
			throw new SecurityException("Class not found " + e.toString());
		}
		response.setHeader("Refresh", "2; URL=home.jsp");
		return;
	} 
}