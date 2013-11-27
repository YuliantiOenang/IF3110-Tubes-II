<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="header.jsp" />
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="layout.jsp" />
	
	<form method="post" onsubmit="return validateAll()" action="user" name="regform">
	<div class='register_div'>
		<h1 class='header'>Edit Profile</h1>
		<div class="per_form">
			<label>Nama Lengkap</label><input type="text" value="" name="name" id="name" required onkeyup="if(this.value != '') validateName(this.value, 'fullname');">
			<span class="error" id="fullname"></span>
		</div>
		<div class="per_form">
			<label>Password Baru</label><input type="password" value="" name="password1" id="password1" onkeyup="if(this.value != '') validatePassword(this.value, password2.value, username.value, email.value, 'valpasswords');">
			<span class="error" id="valpassword"></span>
		</div>
		<div class="per_form">
			<label>Confirm Pass.</label><input type="password" value="" name="password2" id="password2" onkeyup="if(this.value != '') validatePassword(password1.value, this.value, username.value, email.value, 'valpasswords');">
			<span class="error" id="valpasswords"></span>
		</div>
	</div>
		<div class='register_div'>
			<div class='per_form small'>
				<label class='uncheck'>Alamat</label><input type="text"
					name="address" id="address"
					value="" onkeyup="validateEmpty(this.value, 'valaddress')" required> <span
					id="valaddress"></span>
			</div>

			<div class='per_form small'>
				<label>Provinsi</label> <select value="" name="province" id="province" required>
					<option value="">Pilih Provinsi :</option>
					<%
					String[] provinsis = {"Aceh", "Sumatera Utara", "Sumatera Barat", "Riau", "Jambi", "Sumatera Selatan", "Lampung", "Bengkulu", "Bangka Belitung", "Kepulauan Riau", "Jakarta", "Jawa Barat", "Jawa Tengah", "Yogyakarta", "Jawa Timur", "Banten", "Bali", "Nusa Tenggara Barat", "Nusa Tenggara Timur", "Kalimantan Barat", "Kalimantan Timur", "Kalimantan Tengah", "Kalimantan Selatan", "Sulawesi Utara", "Sulawesi Tengah", "Sulawesi Selatan", "Sulawesi Tenggara", "Gorontalo", "Sulawesi Barat", "Maluku", "Maluku Utara", "Papua", "Papua Barat"};
					for (String provinsi: provinsis) {
						%>
						<option value="<%= provinsi %>">
						<%= provinsi %>
						</option>
						<%
					}
					%>
				</select> <span id="valprovince"></span>
			</div>

			<div class='per_form small'>
				<label class='uncheck'>Kota/Kabupaten</label><input type="text"
					name="city" id="city" value="" onkeyup="validateEmpty(this.value, 'valcity')"
					required> <span id="valcity"></span>
			</div>

			<div class='per_form small'>
				<label class='uncheck'>Kodepos</label><input type="text"
					name="postal" id="postal"
					onkeyup="validateEmpty(this.value, 'valpostal')"  required> <span
					id="valpostal"></span>
			</div>

			<div class='per_form small'>
				<label class='uncheck'>Telepon</label><input type="text"
					name="telephone" id="telephone"
					value=""
					onkeyup="validateEmpty(this.value, 'valtelephone')" required> <span
					id="valtelephone"></span>
			</div>
			<p class='keterangan'>Lorem ipsum dolor sit amet lorem ipsum
				dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet
				lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum
				dolor sit amet lorem ipsum dolor sit amet</p>
				
		<input id="action" name="action" type="hidden" value="edit"/>
		<button type="submit" id="btn" onclick="" class="btn">Simpan</button>
	</div>
</form>
	
	<jsp:include page="footer.jsp" />
</body>
</html>