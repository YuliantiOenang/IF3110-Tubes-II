<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<html lang="en-US">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
		<title>
			Edit Profile
		</title>
	</head>
	<script>
	function validatepass()
		{
			var x=document.forms["editform"]["changepassword"].value;
			var y=document.forms["editform"]["confirmchangepassword"].value;
			if (x==null || x=="" || x!=y )
			  {
			  alert("Password Salah");
			  return false;
			  }
			 x=document.forms["editform"]["namalengkap"].value;
			var spasipos=x.indexOf(" ");
			var lastspasipos=x.lastIndexOf(" ");
			if (x==null || x=="" || spasipos<=0 || lastspasipos==x.length)
			{
			 alert("Nama tidak lengkap");
			 return false;
			}
		}
	</script>
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
			<p id="registration-title">Edit Profile</p>
			
			<form name="editform" action="profile.jsp" onsubmit="return validatepass()" method="post">
				<%
					session.setAttribute("login_user", "karakuri");
					out.println(session.getAttribute("login_user"));
					Connection con = null;
					
					try {
						try { 
						Class.forName("com.mysql.jdbc.Driver").newInstance(); 
						}catch(ClassNotFoundException ce){out.println(ce);} 

					con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
					
					PreparedStatement st;
					ResultSet rs;
					
					String loggedin = (String)session.getAttribute("login_user");
					
					st = con.prepareStatement("SELECT * FROM customer WHERE IdName=?");
					st.setString(1,loggedin);
					
					rs = st.executeQuery();
					st.clearParameters();
					
					while(rs.next()){
					
				%>
				<div id="username" class="form-field">
					<p class="label">
						Nama Lengkap :
					</p>
					<p><input class="field-box kolom-12" type="text" name="namalengkap" value="<%=rs.getString(3) %>">
					</input></p>
				</div>
				<div id="username" class="form-field">
					<p class="label">
						Ganti Password :
					</p>
					<p><input class="field-box kolom-12" type="password" name="changepassword" value="<%=rs.getString(2) %>">
					</input></p>
				</div>
				<div id="username" class="form-field">
					<p class="label">
						Konfirmasi Password :
					</p>
					<p><input class="field-box kolom-12" type="password" name="confirmchangepassword" value="<%=rs.getString(2) %>">
					</input></p>
				</div>
				<div id="username" class="form-field">
					<p class="label">
						Nomor HP :
					</p>
					<p><input class="field-box kolom-12" type="text" name="nomorhp" value="<%=rs.getString(4) %>">
					</input></p>
				</div>
				<div id="username" class="form-field">
					<p class="label">
						Alamat :
					</p>
					<p><input class="field-box kolom-12" type="text" name="alamat" value="<%=rs.getString(5) %>">
					</input></p>
				</div>
				<div id="username" class="form-field">
					<p class="label">
						Kota/Kabupaten :
					</p>
					<p><input class="field-box kolom-12" type="text" name="kota" value="<%=rs.getString(6) %>">
					</input></p>
				</div>
				<div id="username" class="form-field">
					<p class="label">
						Provinsi :
					</p>
					<p><input class="field-box kolom-12" type="text" name="provinsi" value="<%=rs.getString(7) %>">
					</input></p>
				</div>
				<div id="username" class="form-field">
					<p class="label">
						Kode Pos :
					</p>
					<p><input class="field-box kolom-12" type="text" name="kodepos" value="<%=rs.getString(8) %>">
					</input></p>
				</div>
				<br/>
					<input id="submit" name="sub" type="submit" value="SUBMIT"></input>
				<%
					}
					con.close();
					} catch (Exception e) {out.println("Unable to connect to database."); };
				%>
			</form>
		</div>
	</div>
	</body>
</html>