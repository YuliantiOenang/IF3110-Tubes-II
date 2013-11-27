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
	
	http.open("GET","proses_suggest_search.php?q="+str,true);
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
	http.open('GET', 'proses_login.jsp?user='+username+'&pass='+password+'',true);
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
			document.getElementById("Error").innerHTML="Sorry,"+http.responseText;
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
</script>
<body>
<div id="lightbox">	
		<div class="loginpoptop"><!--pop up-->
		<h4 id="loginHeader">LOGIN</h4>
		</div>
		<form id="test">
			<div class="forms">
			Username : <input type="text" id="user" required placeholder = "Username" /></br>
			</div>
			<div class="forms">
			Password : <input type="password" id="pass" required placeholder = "Password"></br>
			</div>
			<div class="forms">
			<input type="button" value="LogIn" onclick="login()"></input>
			<input type="button" value="Cancel" onclick="cancel()"></input>
			</div>
			<div class="error">
			<p id="Error"></p>
			</div>
			</form>

		</div>
<div class = "main">
	<div class = "header">
		
		<div class = "logohead">
			<div >
				<a href="index.php"><img src = "images/logo.png" class = "logo"></a>
				</img>
				</div>
			<div class = "loginplace">
				<div>
				<%--<?php
				if(!isset($_COOKIE['user1']))
				{
				?>--%>
                                <%
                                    Cookie cookie = null;
                                    Cookie[] cookies = null;
                                    boolean found=false;
                                    String nama=null;
                                    // Get an array of Cookies associated with this domain
                                    cookies = request.getCookies();
                                    
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("user1"))
                                          {
                                            found=true;
                                            nama=cookie.getValue();
                                          }
                                       }
                                   }
                                   
                                   if(!found)
                                   {
                                     
                                %>
					<img src = "images/login.png" class = "login" onclick="popClik()" id="loginButton"></img>
				<%
                                   }
                                    else
                                   {
                                        
                                %>
                                <%--<?php
				}
				else
				{
				?>--%>

					<img src = "images/logout.png" class = "login" onclick="logout()" id="loginButton"></img>
				
                                <%
                                }
                                %>        
                                <%--<?php
				}
				?>--%>
				</div>
				<div >
					<img src = "images/cart.png" class = "cart" onclick="window.location='shoppingbag.php'"></img>
				</div>
			</div>
			<div class = "signupplace">
				
				<div>
				<%--<?php
				if(!isset($_COOKIE['user1']))
				{
				?>--%>
                                <%
                                if(!found)
                                {
                                %>
				<img src = "images/signup.png" class = "signup" id="signup" onclick="window.location='registrasi.php'"></img>
				<%--<?php
				}
				?>--%>
                                <%
                                }
                                %>
					
				</div> 
				
                            <a href="see_profile.php"><p class="welctext" id="welcome"><%if(found){out.print("WELCOME,"+nama);
                        }%><%--<?php if(isset($_COOKIE['user1'])) echo "WELCOME,".$_COOKIE['user1'].""; ?>--%></p></a>
			</div>
		</div>
		<div class = "menu">
				<div>
					<a href="kategori.php?key=Jaket"><img src = "images/jacket.png" class = "jacket"></img></a>
				</div>
				<div>
					<a href="kategori.php?key=Sweater"><img src = "images/sweaters.png" class = "tshirt"></img>
				</div>
				<div >
					<a href="kategori.php?key=TShirt"><img src = "images/tshirt.png" class = "wristband"></img></a>
				</div>
				<div>
					<a href="kategori.php?key=Misc"><img src = "images/misc.png"  class = "emblem"></img></a>
				</div>
				<div>
					<a href="kategori.php?key=Pokemon"><img src = "images/pokemon.png"  class = "pokemon"></img></a>
				</div>
		</div>
		<div class = "main">
		</div>
	
</div>

<?php
		include "config/connect.php";
		
?>
<div class = "bodymain">
		<div class = "sidebar">
		
			<p class = "searchtitle"> Search it! </p>
		<form action="hasilsearch.php" method="get">
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
	</div>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> PRODUCT DETAIL</p></br></br>
		</div>
		
			<div class = "toppreview">
				<div class = "previmage">
					
					
			<?php
				
				$hasil = mysql_query("select nama, kategori,harga,deskripsi,foto from peralatan where no_alat=".$_GET['id']."");
				while(($baris=mysql_fetch_row($hasil)))
				{
				echo '<img src= "'.$baris[4].'" class="resizeimage"><img>';
				$nama=$baris[0];
				$kategori=$baris[2];
				$deskripsi=$baris[3];
				}
			?>
				</div>
			 
			</div>
			 <div class = "detail">
					<p> Nama Produk : <?php echo $nama;?></p>
					<p> Harga Produk : <?php echo "Rp.".$kategori;?></p>
					<p> Deskripsi : <?php echo $deskripsi;?></p>
					<input hidden id='id' name='id' value="<?php echo $_GET['id']; ?>"></input>
					<?php if(isset($_COOKIE['user1']))
					{
					?>
					<label> Jumlah Beli : </label> <input type="text" required id="jumlahBeli" name="jumlah"/></br></br>
					<label> Permintaan Khusus : </label> <input type="text" id="permintaan" name="permintaan"/></br></br>
					<input type="button" onclick="buy()" value="Add to Cart"></input>
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