<html>
	<head>
		<script type="text/javascript" src="js/reg.js"></script>
		<title>
			Lembar Pendaftaran
		</title>
	</head>
	<body>
		<div id="content">
			<h1 id="content_title">Pendaftaran Pelanggan Ruserba Lapak Andalan</h1>
			<form name="regisform" action="register_card.jsp" method="post">
				<div id="form_one_row">
					<p id="label_form" class="label">
						Username
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="text" onkeyup="validateregisForm()" name="username">
						<p class="info">
							(Minimal 5 karakter)
						</p>
					</input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Password
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="password" onkeyup="validateregisForm()" name="password">
						<p class="info">
							(Minimal 8 Karakter)
						</p>
					</input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Ulangi Password
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="password" onkeyup="validateregisForm()" name="confirmpassword"></input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Nama Lengkap
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="text" onkeyup="validateregisForm()" name="namalengkap"></input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Nomor HP
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="text" onkeyup="validateregisForm()" name="nomorhp"></input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Alamat
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="text" onkeyup="validateregisForm()" name="alamat"></input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Kota/Kabupaten
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="text" onkeyup="validateregisForm()" name="kota"></input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Provinsi
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="text" onkeyup="validateregisForm()" name="provinsi"></input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Kode Pos
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="text" onkeyup="validateregisForm()" name="kodepos"></input>
				</div>
				<div id="form_one_row">
					<p id="label_form" class="label">
						Email
					</p>
					<p id="label_form" class="partition">
						:
					</p>
					<input id="label_form" class="text_field" type="text" onkeyup="validateregisForm()" name="email"></input>
				</div>
				<div id="form_one_row">
					<input id="submit" type="submit" disabled value="DAFTAR" name="daftar"></input>
				</div>
				<div id="form_one_row"></div>
			</form>
		</div>
	</body>
</html>
