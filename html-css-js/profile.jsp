<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<html>
	<head>
		<title>
			Profil Diri
		</title>
	</head>
	<body>
		<div id="content">
			<h1>Profil Diri</h1>
			<form name="profileform" action="edit_profile.jsp" method="post">
				<%
					String submitted = request.getParameter("sub");
					if(submitted !=null){
						Connection con = null;
					
						try {
							try { 
							Class.forName("com.mysql.jdbc.Driver").newInstance(); 
							}catch(ClassNotFoundException ce){out.println(ce);} 

						con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
						
						PreparedStatement pst;
						String password = request.getParameter("changepassword");
						String namalengkap = request.getParameter("namalengkap");
						String nomorhp = request.getParameter("nomorhp");
						String alamat = request.getParameter("alamat");
						String kota = request.getParameter("kota");
						String provinsi = request.getParameter("provinsi");
						String kodepos = request.getParameter("kodepos");
						
						pst = con.prepareStatement("UPDATE customer SET NamaLengkap=? ,Password=? ,NomorHP=? ,Alamat=? ,Kota=? ,Provinsi=? ,KodePos=? WHERE IdName='karakuri'");
						pst.setString(1,namalengkap);
						pst.setString(2,password);
						pst.setString(3,nomorhp);
						pst.setString(4,alamat);
						pst.setString(5,kota);
						pst.setString(6,provinsi);
						pst.setString(7,kodepos);

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

					con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
					
					Statement st;
					ResultSet rs;
					String query = "SELECT * FROM customer WHERE IdName='karakuri'";
					st = con.createStatement();
					rs = st.executeQuery(query);
					
					while(rs.next()){
					
				%>
				
				<div id="form_one_row">
					<p id="label_form" class="label">
						Username
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(1) %>
					</p>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Nama Lengkap
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(3) %>
					</p>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Nomor HP
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(4) %>
					</p>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Alamat
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(5) %>
					</p>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Kota/Kabupaten
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(6) %>
					</p>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Provinsi
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(7) %>
					</p>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Kode Pos
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(8) %>
					</p>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Email
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<p id="label_form" class="label">
						<%=rs.getString(9) %>
					</p>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Jumlah Transaksi
					</p>
					<p id="label_form" class="partition">
						:
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
			</form>
		</div>
	</body>
</html>