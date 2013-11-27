<%-- 
    Document   : header
    Created on : Nov 27, 2013, 1:39:56 PM
    Author     : Aidil Syaputra
--%>

<script src='js/session.js'></script>
<script src='js/search.js'></script>
<div id="header_nonkategori">
<div id='logo'>
	<a href='index.jsp'><img src='assets/logo.png' /></a>
</div>

<div id='loggedout'>
	<a id='loginbutton' class='button' href='javascript:void(0)'><div>Masuk</div></a>
	<form id='loginform' method='post'>
		Username<input type='text' name='loginuser' /><br /><br />
		Kata sandi<input type='password' name='loginpass' /><br /><br />
		<span id='loginerror'>Username atau kata sandi salah</span>
		<input type='submit' name='loginsubmit' />
		<a id='loginsubmit' class='button' name='loginsubmit' href='javascript:void(0)'><div>Masuk</div></a>
		<br />
	</form>
	<a id='registerbutton' class='button' href='javascript:void(0)'><div>Daftar</div></a>
</div>
<div id='loggedin'>
	<div id='welcome'>Selamat datang, <a id='user'></a>!</div>
	<a id='logoutbutton' class='button' href='javascript:void(0)'><div>Keluar</div></a>
	<br />
	<a id='cartbutton' class='button' href='/ruserba/cart'><div>
		<img src='assets/cart.png' />
		<span id='totalbarang'></span> barang
	</div></a>
</div>
<div id='searchbar'>
	<form id='searchform' method='post'>
		<input type='text' id='searchinput' placeholder='Cari' />
                <select id="pilihan">
                        <%
                        if (request.getParameter("pilihan")==null || request.getParameter("pilihan").equals("nama")){ 
                        %>
                            <option value="nama" selected=true>Nama</option>
                            <option value="kategori">Kategori</option>
                            <option value="harga">Harga</option>
                        <%
                        } else if (request.getParameter("pilihan").equals("kategori")) {
                        %>
                            <option value="nama">Nama</option>
                            <option value="kategori" selected=true>Kategori</option>
                            <option value="harga">Harga</option>
                        <%
                        } else if (request.getParameter("pilihan").equals("harga")) {
                        %>
                            <option value="nama">Nama</option>
                            <option value="kategori">Kategori</option>
                            <option value="harga" selected=true>Harga</option>
                        <%
                        }
                        %>
                </select>
		<input type='submit' name='searchsubmit' />
		<a id='searchbutton' href='javascript:void(0)'><img src="assets/search.png" /></a>
	</form>
</div>
</div>
<div id="header_kumpulankategori">
<div class="header_kategori">
    <a href='barang.jsp?kategori=1'>Baju</a>
</div>
<div class="header_kategori">
    <a href='barang.jsp?kategori=2'>Gadget</a>
</div>
<div class="header_kategori">
    <a href='barang.jsp?kategori=3'>Celana</a>
</div>
<div class="header_kategori">
    <a href='barang.jsp?kategori=4'>Indomie</a>
</div>
<div class="header_kategori">
    <a href='barang.jsp?kategori=5'>Minuman</a>
</div>
</div>