<%@page import="java.sql.ResultSet"%>
<%@page import="connect.connect"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->

</head>
<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script type="text/javascript">

function suggestSearch(str){
	//document.getElementById("search_suggestion").innerHTML = str;
	if(str.length == 0){
		document.getElementById("search_suggestion").innerHTML="";
		return;
	}
	
	http.onreadystatechange=function(){
		if(http.readyState == 4 && http.status == 200){
			document.getElementById("search_suggestion").innerHTML = http.responseText;
		}
	}
	
	http.open("GET","proses_suggest_search.jsp?q="+str,true);
	http.send();
}

function copySuggest(){
	var x = document.getElementsByName("key");
	x[0].value = document.getElementById("search_suggestion").innerHTML;
}

function popClik()
{
	
	var lightbox = document.getElementById("lightbox");
       var dimmer = document.createElement("div");
    
    dimmer.style.width =  document.documentElement.scrollWidth + 'px';
    dimmer.style.height = document.documentElement.scrollHeight + 'px';
    dimmer.className = 'dimmer';
    dimmer.id='dim';
    test.onclick=function(){
        document.body.removeChild(this);   
        lightbox.style.visibility = 'hidden';
    }
    
    dimmer.onclick = function(){
        document.body.removeChild(this);   
		document.getElementById('user').value="";
		document.getElementById('pass').value="";
        lightbox.style.visibility = 'hidden';
    }
        
    document.body.appendChild(dimmer);
    
    lightbox.style.visibility = 'visible';
    lightbox.style.top = window.innerHeight/2 - 200 + 'px';
    lightbox.style.left = window.innerWidth/2 - 100 + 'px';
	document.getElementById("user").focus();
}
function login()
{
	
	//mengambil semua variable dalam form login
	var username = encodeURI(document.getElementById('user').value);	
	var password = encodeURI(document.getElementById('pass').value);
	
	//request ke file php
	http.open('get', 'proses_login.jsp?user='+username+'&pass='+password,true);
	//cek hasil request 4 jika berhasil
	http.onreadystatechange = function()
	  {
		
		if (http.readyState==4 && http.status==200)
		{
			try
			{
			var decodeJSON = JSON.parse(http.responseText);
			
			document.getElementById("welcome").innerHTML="WELCOME,"+decodeJSON.nama;
			var lightbox = document.getElementById("lightbox");
			var dimmer = document.getElementById("dim");
			var signup = document.getElementById("signup");
			
			var loginButton = document.getElementById("loginButton");
			lightbox.style.visibility = 'hidden';
			signup.style.visibility = 'hidden';
			loginButton.src="images/logout.png";
			loginButton.onclick=function()
			{
				window.location="logout.jsp";
			}
			document.body.removeChild(dimmer); 
			remove("signup"); 
			
			}
			catch(e)
			{
			document.getElementById("Error").innerHTML="Welcome,"+http.responseText;
			var user=document.getElementById("user");
			
			
			}
		}
	  }
	http.send(); 
	
}
function logout()
{
window.location="logout.jsp";
}
function cancel()
{
	var lightbox = document.getElementById("lightbox");
	var dimmer = document.getElementById("dim");
	lightbox.style.visibility = 'hidden';
	document.getElementById('user').value="";
	document.getElementById('pass').value="";
	document.body.removeChild(dimmer); 
}
function remove(id)
{
    return (elem=document.getElementById(id)).parentNode.removeChild(elem);
}
function buy()
{
	
	//mengambil semua variable dalam form login
	var jumlah = document.getElementById('jumlahBeli').value;	
	var permintaan = document.getElementById('permintaan').value;
	var id=document.getElementById('id').value;
	
	if(permintaan=="")
	{
		permintaan="standart";
	}
	if(jumlah=="")
	{
		alert("Maaf anda harus mengisi jumlah barang terlebih dahulu");
	}
	
	else
	{
		//request ke file php
		http.open('get', 'addCart.jsp?id='+id+'&jumlah='+jumlah+"&permintaan="+permintaan,true);
		//cek hasil request 4 jika berhasil
		http.onreadystatechange = function()
		  {
			
			if (http.readyState==4 && http.status==200)
			{
				try
				{
				var decodeJSON = JSON.parse(http.responseText);
				alert("ERROR, kesalahan database");
				}
				catch(e)
				{
				
				alert("Barang sudah masuk ke dalam keranjang.");

				
				}
			}
		  }
		http.send(); 
		}
}

function confirmUser()
{
    var ask=confirm("Apakah Anda yakin menghapus barang ini ? ");
    if(ask)
	{
            window.location="deletebarang.jsp?id=<% out.print(request.getParameter("id")); %>";
    }
}

function editBarang(){
    window.location="editbarang.jsp?id=<% out.print(request.getParameter("id")); %>";
}

</script>
<body>
    <%@include file="headeradmin.jsp" %>
<div class = "bodymain">
		<div class = "sidebar">
		
			<p class = "searchtitle"> Search it! </p>
		<form action="hasilsearch.jsp" method="get">
		<div class = "kategori">
			<select name="kategori">
				<option value="all">All</option>
				<option value="Jaket">Jacket</option>
				<option value="TShirt">T-shirt</option>
				<option value="Sweater">Sweater</option>
				<option value="Misc">Misc.</option>
				<option value="Pokemon">Pokemon</option>
			</select>
			<input type="text" id="user" name="key" required placeholder = "e.g. Mylo Xyloto" onkeyup="suggestSearch(this.value)" /></br>
	</div>
	
	<div class = "kategori">
	<label> Price Range: </label>
	<select name="range">
				<option value=1>< Rp50.000 </option>
				<option value=2>Rp50.000 - Rp100.000</option>
				<option value=3>Rp100.001 - Rp150.000</option>
				<option value=4>> Rp150.000</option>
				
			</select>
	</div>
		<div class = "kategori">
			<input type="submit" value="Search!"></input>
		</div>
		<label>Suggestion : <br><span id="search_suggestion" onclick="copySuggest()"></span></label>
		</form>
		
		<% /* FITUR ADMIN */ %>
			
			<div class = "space"> 
				
			</div>
				
			<p class = "textadmin"> FITUR KHUSUS ADMIN </p>		
				
			<div class = "placetambahbarang" >
				<form action="tambahbarang.jsp">
					<input type="submit" class = "buttontambahbarang" value="Tambah Barang">
				</form>
			</div>
		
	</div>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> PRODUCT DETAIL</p></br></br>
		</div>
		
			<div class = "toppreview">
				<div class = "previmage">
					
				
			 
			
			 
                        <%
                        connect koneksion = new connect();
                        koneksion.dbopen();
                        String ID =request.getParameter("id");
                        ResultSet rs = koneksion.stat.executeQuery("select nama, kategori,harga,deskripsi,foto,jumlah from peralatan where no_alat="+ID+"");
                        rs.first();
                        %>
                          <img src= "<%out.print(rs.getString(5));%>" class="resizeimage"><img>;
                                </div>
                        </div>
                          <div class = "detail">
					<p> Nama Produk : <% out.print(rs.getString(1)); %></p>
					<p> Harga Produk : <% out.print(rs.getString(3)); %></p>
					<p> Deskripsi : <% out.print(rs.getString(4)); %></p>
					<input hidden id='id' name='id' value="<?php echo $_GET['id']; ?>">
					
					<% /* PERHATIKAN, ONCLICK JADINYA DELETE ITEM */ %>
					<input type="button" onclick="confirmUser()" value="Hapus Barang"></input>
					
					<p> </p>
					
                                        <input type="button" onclick="editBarang()" value="Edit Barang"></input>
					<?php
					}
					?>
					</div>
			</div>
			</div>
			
			
			
	
	<div class = "footer">
		<div class = "info">

		</div>
		
				
		
	</div>
</div>
</body>
</html>