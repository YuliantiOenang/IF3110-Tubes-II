<?php 
  $username = $_POST['username'];
  $password = $_POST['password'];
  $password2 = $_POST['konfirmpassword'];
  $email = $_POST['email'];
  $name = $_POST['name'];
  $alamat = $_POST['alamat'];
  $provinsi = $_POST['provinsi'];
  $kecamatan = $_POST['kecamatan'];
  $hp = $_POST['hp'];
  $kodepos = $_POST['kodepos'];

  $con = mysqli_connect("localhost","root","","whatshop");

  // Check connection
  if (mysqli_connect_errno())
  {
    die("Failed to connect to MySQL: " . mysqli_connect_error());
  }

  $passed = false;
  $retval = "";
  $data =  mysqli_query($con,"SELECT * FROM register WHERE username='$username'");
  $row = mysqli_fetch_array($data);
  $oldemail = $row['email'];
  $data = mysqli_query($con,"SELECT COUNT('email') as count FROM register WHERE email='$email'");
  $row = mysqli_fetch_array($data);
  if ($row['count'] && strcmp($oldemail,$email) != 0 ) {
    $passed = false;
    $retval = "Email yang baru telah terdaftar";
  }
  else if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $passed = false;
    $retval = "Format email salah";
  }
  else if (!preg_match("/(.+)( )(.+)/", $name)) {
    $passed = false;
    $retval = "Nama harus terdiri dari dua buah kata";
  }
  else if (strlen($password) > 0) {
    if (strlen($password < 8)) {
      $passed = false;
      $retval = "Password harus terdiri dari minimal 8 karakter";
    }
    else if ((strcmp($password,$username) == 0) || (strcmp($password,$email) == 0)){
      $passed = false;
      $retval = "Password tidak boleh sama dengan username atau email";
    }
    else if (strcmp($password,$password1) != 0) {
      $passed = false;
      $retval = "Konfirmasi password tidak sesuai";
    }
    else {
      $passed = true;
      $retval = "Pengubahan profile berhasil!";
      mysqli_query($con,"UPDATE register SET password='$password', nama_lengkap='$name', email='$email', alamat='$alamat', provinsi='$provinsi', kota_kabupaten='$kecamatan', nomor_handphone='$hp', kode_pos='$kode_pos' WHERE username='$username'");
    }
  }
  else {
    $passed = true;
    $retval = "Pengubahan profile berhasil.";
    mysqli_query($con,"UPDATE register SET nama_lengkap='$name', email='$email', alamat='$alamat', provinsi='$provinsi', kota_kabupaten='$kecamatan', nomor_handphone='$hp', kode_pos='$kodepos' WHERE username='$username'");
  }

  mysqli_close($con);

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
