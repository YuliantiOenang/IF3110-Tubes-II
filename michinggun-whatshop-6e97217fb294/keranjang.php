<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">

<!aku ngga tau yang 3 baris di atas buat apa, cuma liat dari tutorial>

<title>RuserBabaAlif</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
</head>
<body id="top">
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
      <a href="index.html"><img src="images/icon_whatshop.png" alt="Whatshop" width="200" height="44"> </img></a>
    </div>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col2">
  <div id="topbar">
    <div id="topnav">
      <ul>
        <li><a href="index.html">Home</a></li>
		<li><a href="#">Kategori barang</a>
          <ul>
            <li><a href="kategori1.html">Kategori 1</a></li>
            <li><a href="kategori2.html">Kategori 2</a></li>
            <li><a href="#">Kategori 3</a></li>
			<li><a href="#">Kategori 4</a></li>
			<li><a href="#">Kategori 5</a></li>
          </ul>
        </li>
		<li class="active"><a href="#">Keranjang belanja</a></li>
        <li><a href="#">Login</a></li>
        
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
  <div id="breadcrumb">
    <ul>
      <li class="first">You Are Here</li>
      <li>&#187;</li>
      <li><a href="#">Home</a></li>
      <li>&#187;</li>
      <li><a href="#">Grand Parent</a></li>
      <li>&#187;</li>
      <li><a href="#">Parent</a></li>
      <li>&#187;</li>
      <li class="current"><a href="#">Child</a></li>
    </ul>
  </div>
</div>
<div class="wrapper col5">
  <div id="container">
    <div id="content">
      <h2>Cart</h2>
      <p><button onclick="clickCounter()" type="button">Click coy!</button></p>
      <div id="result"></div>
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th>Nama Barang</th>
            <th>Jumlah</th>
            <th>Harga satuan</th>
            <th>Total harga</th>
          </tr>
        </thead>
        <tbody>
          <!For Loop>
            <script>
                  var delimiter=',';
                  var getNama = localStorage.getItem('nama_barang').split(delimiter);
                  var getJumlah = localStorage.getItem('jumlah_barang').split(delimiter);
                  var getHarga = localStorage.getItem('harga_barang').split(delimiter);
                  function clickCounter(){
                    if (localStorage.getItem('nama_barang')===null){
                      document.getElementById("result").innerHTML="ojan";   
                    }
                  }
                  
                    for (var i=0;i<getNama.length;i++){
                      document.write('<tr class="light">');
                      document.write("<td>"+getNama[i]+"</td>");
                      document.write("<td>"+getJumlah[i]+"</td>");
                      document.write("<td>"+getHarga[i]+"</td>");
                      document.write("<td>"+getJumlah[i]*getHarga[i]+"</td>");
                      document.write("</tr>");
                    }
                  
                
          </script>
            <?php
              // $nama=$_GET['nama_barang'];
              // $jumlah=$_GET['jumlah'];
              // $harga="54545";
              // $total=$jumlah * $harga; 

              // for ($i=0;$i<=2;$i++){
              //   echo '<tr class="light">';
              //   echo "<td>".$nama."</td>";
              //   echo "<td>".$jumlah."</td>";
              //   echo "<td>".$harga."</td>";
              //   echo "<td>".$total."</td>";
              // }
            ?>


          <tr class="light">
            <td>Value 1</td>
            <td>Value 2</td>
            <td>Value 3</td>
            <td>Value 4</td>
          </tr>
          <tr class="dark">
            <td>Value 5</td>
            <td>Value 6</td>
            <td>Value 7</td>
            <td>Value 8</td>
          </tr>
          <tr class="light">
            <td>Value 9</td>
            <td>Value 10</td>
            <td>Value 11</td>
            <td>Value 12</td>
          </tr>
          <tr class="dark">
            <td>Value 13</td>
            <td>Value 14</td>
            <td>Value 15</td>
            <td>Value 16</td>
          </tr>
          <!end loop>
        </tbody>
      </table>
	  <li><a href="#">Selesai belanja</a></li>
    </div>
    
      
      
    </div>
    <div class="clear"></div>
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
