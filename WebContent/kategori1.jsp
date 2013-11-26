<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">

<!3 baris di atas ngga tau buat apa, cuma liat dari tutorial>

<title>Whatshop</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
</head>
<body id="top">
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
      <a href="index2.jsp"><img src="images/icon_whatshop.png" alt="Whatshop" width="200" height="44"> </img></a>
    </div>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col2">
  <div id="topbar">
    <div id="topnav">
      <ul>
        <li><a href="index2jspl">Home</a></li>
		<li><a href="#">Kategori barang</a>
          <ul>
            <li class="active"><a href="#">Kategori 1</a></li>
            <li><a href="kategori2.jsp">Kategori 2</a></li>
            <li><a href="kategori3.jsp">Kategori 3</a></li>
			<li><a href="kategori4.jsp">Kategori 4</a></li>
			<li><a href="kategori5.jsp">Kategori 5</a></li>
          </ul>
        </li>
		<li><a href="keranjang.jsp">Keranjang belanja</a></li>
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

<div class="wrapper col4">
  <div id="services">
	<ul>
	  <q>Kategori 1</q>
	</ul>
    <ul>
      <li>
        <div class="fl_left"><img src="images/gambar/meat2.jpg" alt="" /></div>
        <script>
                //arrNama = ( typeof arrNama != 'undefined' && arrNama instanceof Array ) ? arrNama : []
                //arrJml = ( typeof arrJml != 'undefined' && arrJml instanceof Array ) ? arrJml : []
                //arrHarga = ( typeof arrHarga != 'undefined' && arrHarga instanceof Array ) ? arrHarga : []
                 var arrNama = [];
                 var arrJml = [];
                 var arrHarga = [];
        </script>
        <div class="fl_right">
          <h2>Daging glonggongan</h2>
          <p>Daging glonggongan asli, tanpa pengawet buatan</p>
          <p class="readmore" onclick="buy()"><a href="keranjang.jsp">Beli sekarang &raquo;</a></p>

          <script>
            function buy(){
                  var delimiter=',';
                  var i;
                  var getNama = localStorage.getItem('nama_barang').split(delimiter);
                  var getJumlah = localStorage.getItem('jumlah_barang').split(delimiter);
                  var getHarga = localStorage.getItem('harga_barang').split(delimiter);
                if (getNama[0]!='' && localStorage.getItem('nama_barang')!==null){
                  for (i=0;i<getNama.length;i++){
                    arrNama[i]=getNama[i];    
                    arrJml[i]=getJumlah[i];
                    arrHarga[i]=getHarga[i];
                  }
                    i++;
                    arrNama[i]="Daging";    
                    arrJml[i]=1;
                    arrHarga[i]=125000;
                }
                else{
                  arrNama[0]="Daging";
                  arrJml[0]=1;
                  arrHarga[0]=125000;
                } 
                  localStorage.setItem('nama_barang', arrNama);
                  localStorage.setItem('jumlah_barang', arrJml);
                  localStorage.setItem('harga_barang', arrHarga);
                  // localStorage.removeItem('nama_barang');
                  // localStorage.removeItem('jumlah_barang');
                  // localStorage.removeItem('harga_barang');
            }
          </script>

        </div>
      </li>
      <li>
        <div class="fl_left"><img src="images/gambar/brokoli2.jpg" alt="" /></div>
        <div class="fl_right">
          <h2>Brokoli KW</h2>
          <p>Brokoli made in China asli, KW super</p>
          <p class="readmore" onclick="buy2()"><a href="keranjang.jsp">Beli sekarang &raquo;</a></p>
          <script>
            function buy2(){
                  var delimiter=',';
                  var i;
                  var getNama = localStorage.getItem('nama_barang').split(delimiter);
                  var getJumlah = localStorage.getItem('jumlah_barang').split(delimiter);
                  var getHarga = localStorage.getItem('harga_barang').split(delimiter);
                if (getNama[0]!=''){
                  for (i=0;i<getNama.length;i++){
                    arrNama[i]=getNama[i];    
                    arrJml[i]=getJumlah[i];
                    arrHarga[i]=getHarga[i];
                  }
                    i++;
                    arrNama[i]="Brokoli";    
                    arrJml[i]=1;
                    arrHarga[i]=1350;
                }
                else{
                  arrNama[0]="Brokoli";
                  arrJml[0]=1;
                  arrHarga[0]=1350;
                } 
                  localStorage.setItem('nama_barang', arrNama);
                  localStorage.setItem('jumlah_barang', arrJml);
                  localStorage.setItem('harga_barang', arrHarga);
              }
          </script>
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
	<ul>
	  <q></q>
	</ul>
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
	<ul>
	  <q></q>
	</ul>
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
<div class="wrapper col3">
  <div id="pagination-flickr">
	<ul id="pagination-flickr">
	  <li class="previous-off">«Previous</li>
	  <li class="active">1</li>
	  <li><a href="?page=2">2</a></li>
	  <li><a href="?page=3">3</a></li>
	  <li><a href="?page=4">4</a></li>
	  <li><a href="?page=5">5</a></li>
	  <li><a href="?page=6">6</a></li>
	  <li><a href="?page=7">7</a></li>
	  <li class="next"><a href="?page=2">Next »</a></li>
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
    <p class="fl_left">Fawwas-EBO-Lubis</p>
    <p class="fl_right">FEL</a></p>
    <br class="clear" />
  </div>
</div>
</body>
</html>
