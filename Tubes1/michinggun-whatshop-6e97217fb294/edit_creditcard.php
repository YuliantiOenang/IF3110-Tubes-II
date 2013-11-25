<?php 
  $username = $_POST['username'];

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">



<!3 baris di atas ngga tau buat apa, cuma liat dari tutorial>


<title>Whatshop</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<script>
  var username = localStorage.getItem('username');
  if (username === null) {
    window.location = 'index.php';
  }
</script>
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
</head>
<body id="top">
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
      <a href="index.php"><img src="images/icon_whatshop.png" alt="Whatshop" width="200" height="44"> </img></a>
    </div>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col2">
  <div id="topbar">
    <div id="topnav">
      <ul>
        <li ><a href="index.php">Home</a></li>
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
        document.write('<li><a href="profile.php?username=' + username + '" >' + username + '</a></li>');
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
</div>
<div class="wrapper col5">
  <div id="container">
    <div id="content">
      <h2>Profile</h2>
      <div id="message">
        <p>
          <?php
            echo "$retval";
          ?>
        </p>
      </div>
    
    </div>
    <br class="clear" />
  </div>
</div>
  <div id="copyright">
    <p class="fl_left">Alif-EBO-Michael</p>
    <p class="fl_right">M*E</a></p>
    <br class="clear" />
  </div>
</div>
</body>
</html>
