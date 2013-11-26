<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<html lang="en-US">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
		<script type="text/javascript" src="js/reg.js"></script>
		<title>
			Pendaftaran Kartu Kredit
		</title>
	</head>
	<body>
		<div id="container">
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
			
			<!-- Header Section -->
			<div id="header" class="frame">
				<div class="kolom-7">
					<img src="res/img/logo.png" alt="" id="logo"/>
				</div>
				<div class="kolom-4">
					<div id="user-panel">
						
						<div id="user" class="frame">
							<img id="user-pict" class="kolom-5" src="res/img/userpict_h.png" alt=""/>
							<div id="user-text" class="kolom-7">
								<h3>Welcome, <span class="user-name">Riandy</span>!</h3>
								<p id="user-control">
									<span class="edit-logout"><a href="">Edit Profile</a></span>
									&nbsp;or&nbsp;
									<span class="edit-logout"><a href="">Logout</a></span>
								</p>
								
								<a href="#" class="btn">Check Your Cart</a>
							</div>
						</div>
						
						<div id="search-bar" class="frame">
							<form action="search.php">
								<input id="search-box" class="kolom-9" type="text" name="src" value="Ketikkan barang yang dicari..." onfocus="checkclear(this)" onblur="checkempty(this, 'Ketikkan barang yang dicari...')">
								<input id="search-button" class="kolom-1" type="submit" value="">
							</form>					
						</div>
					</div>
				</div>			
			</div>
			<!-- End of Header -->
			
		<div id="form-registrasi" class="frame">
			<p id="registration-title">Credit Card Registration</p>
			
			<form name="creditform" action="index.php" onsubmit="return validatecreditForm()" method="post">
				<div id="card-number" class="form-field">
					<p class="label">
						CardNumber :
					</p>
					<p><input class="field-box kolom-12" type="text" name="cardnumber">
					</input></p>
				</div>
				
				<div id="name-on-card" class="form-field">
					<p id="label_form" class="label">
						Name on Card :
					</p>
					<p><input class="field-box kolom-12" type="text" name="nameoncard">
					</input></p>
				</div>
				
				<div id="expired-date" class="form-field">
					<p class="label">
						Expired Date :
					</p>
					<p><input class="field-box kolom-12" type="date" name="expireddate">
					</input></p>
				</div>
				<br/>
					<input id="btn-register" class="btn" type="submit" value="Submit" name="submitted"></input>
			</form>
			<form action="index.php" method="post">
					<br/>
					<p><input id="btn-register" class="btn" type="submit" value="Skip" ></input></p>
			</form>
		</div>	
	</div>
	</body>
</html>