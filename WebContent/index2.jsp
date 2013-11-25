<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">

<!3 baris di atas ngga tau buat apa, cuma liat dari tutorial>


<title>RuserBabaAlif</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
</head>
<body id="top">
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
      <a href="#"><img src="images/icon_whatshop.png" alt="Whatshop" width="200" height="44"> </img></a>
    </div>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col2">
  <div id="topbar">
    <div id="topnav">
      <ul>
        <li class="active"><a href="index.html">Home</a></li>
		<li><a href="#">Kategori barang</a>
          <ul>
            <li><a href="kategori1.html">Kategori 1</a></li>
            <li><a href="kategori2.html">Kategori 2</a></li>
            <li><a href="kategori3.html">Kategori 3</a></li>
			<li><a href="kategori4.html">Kategori 4</a></li>
			<li><a href="kategori5.html">Kategori 5</a></li>
          </ul>
        </li>
		<li><a href="keranjang.html">Keranjang belanja</a></li> 
		<script>
			var username = localStorage.getItem('username');
			if (username === null) {
				document.write('<li><a href="#" onClick="MyWindow=window.open(' + " 'frontgate.html','Login','toolbar=no,location=no,directories=no,status=no, menubar=no,scrollbars=yes,resizable=yes,width=600,height=600'); return false;" + '">Login</a></li>');
			}
			else {
				document.write('<li><a href="profile.php?username=' + username + '">' + username + '</a></li>');
				document.write('<li><a href="logout.php"> Logout </a></li>');
			}
		</script>
        
      </ul>
    </div>
    <div id="search">
      <form action="#" method="post">
        <fieldset>
          <legend>Site Search</legend>
          <input type="text" value="Golek barang&hellip;"  onfocus="this.value=(this.value=='Nggolek barang&hellip;')? '' : this.value ;" />
          <input type="submit" name="go" id="go" value="Cari" />
        </fieldset>
      </form>
    </div>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col3">
  <div id="intro">
    <div class="fl_left">
      <h2>Diskon khusus hari ini</h2>
      <p>Diskon 90% untuk barang kategori 1 dan 2</p>
      <p class="readmore"><a href="#">Belanja sekarang &raquo;</a></p>
    </div>
    <div class="fl_right"><img src="images/gambar/gambar2.jpg" alt="" /></div>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col4">
  <div id="services">
    <ul>
      <li>
        <div class="fl_left"><img src="images/gambar/meat2.jpg" alt="" /></div>
        <div class="fl_right">
          <h2>Daging glonggongan</h2>
          <p>Daging glonggongan asli, tanpa pengawet buatan</p>
          <p class="readmore"><a href="#">Beli sekarang &raquo;</a></p>
        </div>
      </li>
      <li>
        <div class="fl_left"><img src="images/gambar/brokoli2.jpg" alt="" /></div>
        <div class="fl_right">
          <h2>Brokoli KW</h2>
          <p>Brokoli made in China asli, KW super</p>
          <p class="readmore"><a href="#">Beli sekarang &raquo;</a></p>
        </div>
      </li>
      <li class="last">
        <div class="fl_left"><img src="images/gambar/milk2.jpg" alt="" /></div>
        <div class="fl_right">
          <h2>Susu janda liar</h2>
          <p>Dijamin Anda puas. Tidak puas uang kembali</p>
          <p class="readmore"><a href="#">Beli sekarang &raquo;</a></p>
        </div>
      </li>
    </ul>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col5">
  <div id="container">
    <div id="content">
      <h2>Cara Belanja</h2>
      <p>1. Login</p>
      <p>2. Pilih barang</p>
      <p>3. Bayar</p>
	  <p>4. Selesai</p>
	  
    </div>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col7">
  <div id="copyright">
    <p class="fl_left">Alif-EBO-Michael</p>
    <p class="fl_right">M*E</a></p>
    <br class="clear" />
  </div>
</div>
</body>
</html>
