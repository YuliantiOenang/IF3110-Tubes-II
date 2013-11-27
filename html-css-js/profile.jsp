<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

		<jsp:include page="Header.jsp"/>
                <jsp:include page="Navbar.jsp"/>

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
						PreparedStatement kya;
						
						PreparedStatement pst;
						String password = request.getParameter("changepassword");
						String namalengkap = request.getParameter("namalengkap");
						String nomorhp = request.getParameter("nomorhp");
						String alamat = request.getParameter("alamat");
						String kota = request.getParameter("kota");
						String provinsi = request.getParameter("provinsi");
						String kodepos = request.getParameter("kodepos");
						
						String loggedin = (String)session.getAttribute("login_user");
						
						kya = con.prepareStatement("SELECT * FROM customer WHERE IdName=?");
						kya.setString(1,loggedin);
						ResultSet rs;
					
						rs  = kya.executeQuery();
					
						
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
						
						while (rs.next()){
							if (namalengkap.equals(rs.getString(3))){
								out.println("<script> alert('Namalengkap tidak diubah'); </script>");
							}
							if (password.equals(rs.getString(2))){
								out.println("<script> alert('Password tidak diubah'); </script>");
							}
							if (nomorhp.equals(rs.getString(4))){
								out.println("<script> alert('NomorHP tidak diubah'); </script>");
							}
							if (alamat.equals(rs.getString(5))){
								out.println("<script> alert('Alamat tidak diubah'); </script>");
							}
							if (kota.equals(rs.getString(6))){
								out.println("<script> alert('Kota tidak diubah'); </script>");
							}
							if (provinsi.equals(rs.getString(7))){
								out.println("<script> alert('Provinsi tidak diubah'); </script>");
							}
							if (kodepos.equals(rs.getString(8))){
								out.println("<script> alert('Kode Pos tidak diubah'); </script>");
							}
						}
						
						kya.clearParameters();
						
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