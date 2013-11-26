<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<html lang="en-US">
	<head>
		<meta charset="UTF-8">
		<title>
			Profil Diri
		</title>
		<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
	</head>
	<body>
		<div id="container">

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
							<input id="search-box" class="kolom-9" type="text" name="src" value="Ketikkan barang yang dicari...">
							<input id="search-button" class="kolom-1" type="submit" value="">
						</form>					
					</div>
				</div>
			</div>			
		</div>
		<!-- End of Header -->

		<div id="form-registrasi" class="frame">
			<p id="registration-title">Your Profile</p>
		
			<form name="profileform" action="edit_profile.jsp" method="post">
				<%
					String submitted = request.getParameter("sub");
					if(submitted !=null){
						Connection con = null;
						try {
							try { 
							Class.forName("com.mysql.jdbc.Driver").newInstance(); 
							}catch(ClassNotFoundException ce){out.println(ce);} 

						con = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");
						
						PreparedStatement pst;
						String password = request.getParameter("changepassword");
						String namalengkap = request.getParameter("namalengkap");
						String nomorhp = request.getParameter("nomorhp");
						String alamat = request.getParameter("alamat");
						String kota = request.getParameter("kota");
						String provinsi = request.getParameter("provinsi");
						String kodepos = request.getParameter("kodepos");
						
						String loggedin = (String)session.getAttribute("login_user");
						pst = con.prepareStatement("UPDATE customer SET NamaLengkap=? ,Password=? ,NomorHP=? ,Alamat=? ,Kota=? ,Provinsi=? ,KodePos=? WHERE IdName=?");
						pst.setString(1,namalengkap);
						pst.setString(2,password);
						pst.setString(3,nomorhp);
						pst.setString(4,alamat);
						pst.setString(5,kota);
						pst.setString(6,provinsi);
						pst.setString(7,kodepos);
						pst.setString(8,loggedin);

						pst.executeUpdate();
						pst.clearParameters();
						
						con.close();
						} catch (Exception e) {out.println("Unable to connect to database."); };
					}
				%>
				<%
					Connection con = null;
					
					try {
						try { 
						Class.forName("com.mysql.jdbc.Driver").newInstance(); 
						}catch(ClassNotFoundException ce){out.println(ce);} 

					con = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");
					
					PreparedStatement st;
					ResultSet rs;
					
					String loggedin = (String)session.getAttribute("login_user");
					
					st = con.prepareStatement("SELECT * FROM customer WHERE IdName=?");
					st.setString(1,loggedin);
					
					rs = st.executeQuery();
					st.clearParameters();
					
					while(rs.next()){
					
				%>
				
				<div id="data-diri" class="frame">
					<p id="label_form" class="label">
						Username :
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(1) %>
					</p>
				</div>
				<div id="data-diri" class="frame">
					<p id="label_form" class="label">
						Nama Lengkap :
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(3) %>
					</p>
				</div>
				<div id="data-diri" class="frame">
					<p id="label_form" class="label">
						Nomor HP :
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(4) %>
					</p>
				</div>
				<div id="data-diri" class="frame">
					<p id="label_form" class="label">
						Alamat :
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(5) %>
					</p>
				</div>
				<div id="data-diri" class="frame">
					<p id="label_form" class="label">
						Kota/Kabupaten :
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(6) %>
					</p>
				</div>
				<div id="data-diri" class="frame">
					<p id="label_form" class="label">
						Provinsi :
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(7) %>
					</p>
				</div>
				<div id="data-diri" class="frame">
					<p id="label_form" class="label">
						Kode Pos :
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(8) %>
					</p>
				</div>
				<div id="data-diri" class="frame">
					<p id="label_form" class="label">
						Email :
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(9) %>
					</p>
				</div>
				<div id="data-diri" class="frame">
					<p id="label_form" class="label">
						Jumlah Transaksi :
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(10) %>
					</p>
				</div>
				<%
					}
					con.close();
					} catch (Exception e) {out.println("Unable to connect to database."); };
				%>
				<div id="form_one_row">
					<input id="submit" type="submit" value="EDIT"></input>
				</div>
				<div id="form_one_row"></div>
				
				</div>	
			</form>
		</div>
	</body>
</html>