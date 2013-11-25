<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<html>
	<head>
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
		<div id="content">
			<h1>Edit Profile</h1>
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
				<div id="form_one_row">
					<p id="label_form" class="label">
						Nama Lengkap
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="text" name="namalengkap" value="<%=rs.getString(3) %>">
					</input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Ganti Password	
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="password" name="changepassword" value="<%=rs.getString(2) %>">
					</input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Konfirmasi Password
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="password" name="confirmchangepassword" value="<%=rs.getString(2) %>">
					</input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Nomor HP
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="text" name="nomorhp" value="<%=rs.getString(4) %>">
					</input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Alamat
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="text" name="alamat" value="<%=rs.getString(5) %>">
					</input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Kota/Kabupaten
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="text" name="kota" value="<%=rs.getString(6) %>">
					</input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Provinsi
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="text" name="provinsi" value="<%=rs.getString(7) %>">
					</input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Kode Pos
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="text" name="kodepos" value="<%=rs.getString(8) %>">
					</input>
				</div>
				<div id="form_one_row">
					<input id="submit" name="sub" type="submit" value="SUBMIT"></input>
				</div>
				<div id="form_one_row"></div>
				<%
					}
					con.close();
					} catch (Exception e) {out.println("Unable to connect to database."); };
				%>
			</form>
		</div>
	</body>
</html>