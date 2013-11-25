<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<html>
	<head>
		<script type="text/javascript" src="js/reg.js"></script>
		<title>
			Pendaftaran Kartu Kredit
		</title>
	</head>
	<body>
		<div id="content">
			<%
				String submitted = request.getParameter("daftar");
				if(submitted !=null){
					Connection con = null;
					try {
						try { 
						Class.forName("com.mysql.jdbc.Driver").newInstance(); 
						}catch(ClassNotFoundException ce){out.println(ce);} 

					con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
					
					PreparedStatement st;
					String username = request.getParameter("username");
					String password = request.getParameter("password");
					String namalengkap = request.getParameter("namalengkap");
					String nomorhp = request.getParameter("nomorhp");
					String alamat = request.getParameter("alamat");
					String kota = request.getParameter("kota");
					String provinsi = request.getParameter("provinsi");
					String kodepos = request.getParameter("kodepos");
					String email = request.getParameter("email");
					
					st = con.prepareStatement("INSERT INTO Customer(IdName, Password, NamaLengkap, NomorHP, Alamat, Kota, Provinsi, KodePos, Transaksi, Email, Role) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
					st.setString(1,username);
					st.setString(2,password);
					st.setString(3,namalengkap);
					st.setString(4,nomorhp);
					st.setString(5,alamat);
					st.setString(6,kota);
					st.setString(7,provinsi);
					st.setString(8,kodepos);
					st.setInt(9,0);
					st.setString(10,email);
					st.setInt(11,0);
					
					st.executeUpdate();
					st.clearParameters();
					
					con.close();
					} catch (Exception e) {out.println("Unable to connect to database."); };
				}
			%>
			<h1>Lembar Pemakaian Kartu Kredit</h1>
			<form name="creditform" action="index.php" onsubmit="return validatecreditForm()" method="post">
				<div id="form_one_row">
					<p id="label_form" class="label">
						CardNumber
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="text" name="cardnumber">
					</input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Name on Card
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="text" name="nameoncard">
					</input>
				</div>
					<div id="form_one_row">
					<p id="label_form" class="label">
						Expired Date
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" type="date" name="expireddate">
					</input>
				</div>
				<div id="form_one_row">
					<input id="submit" type="submit" value="Submit" name="submitted"></input>
				</div>
			</form>
			<form action="index.php" method="post">
				<div id="form_one_row">
					<input id="submit" type="submit" value="Skip" ></input>
				</div>
				<div id="form_one_row"></div>
			</form>
		</div>	
	</body>
</html>