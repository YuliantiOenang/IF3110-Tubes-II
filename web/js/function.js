/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

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
function cekJumlah()
{
	//mengambil semua variable dalam form login
	var id = document.getElementById('idBarang').value;	
	

	var jumlah = document.getElementById('jumlahBarang').value;
	//request ke file php
	http.open('get', 'changeJumlah.php?id='+id+'&jumlah='+jumlah+"",true);
	//cek hasil request 4 jika berhasil
	http.onreadystatechange = function()
	  {
		
		if (http.readyState==4 && http.status==200)
		{
			try
			{
			
			var decodeJSON = JSON.parse(http.responseText);
			
			alert("Maaf barang yang ada di stok tidak cukup.\n jumlah stok "+http.responseText);
			}
			catch(e)
			{
			alert("Berhasil mengganti transaksi.");
			}
		}
	  }
	http.send(); 
	
	
}

function toEditProfile(){
	window.location = "edit_profile.php";
}

function getCookie(c_name)
//FUNGSI PENGAMBIL COOCIE
{
var c_value = document.cookie;
var c_start = c_value.indexOf(" " + c_name + "=");
if (c_start == -1)
  {
  c_start = c_value.indexOf(c_name + "=");
  }
if (c_start == -1)
  {
  c_value = null;
  }
else
  {
  c_start = c_value.indexOf("=", c_start) + 1;
  var c_end = c_value.indexOf(";", c_start);
  if (c_end == -1)
  {
c_end = c_value.length;
}
c_value = unescape(c_value.substring(c_start,c_end));
}
return c_value;
}


function checkSubmit(){
			
			
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var confirm_password = document.getElementById("confirm_password").value;
	var nama_lengkap = document.getElementById("nama_lengkap").value;
	var email = document.getElementById("email").value;
	
	

	//document.getElementById("pesan").innerHTML = "sadf";
	
	http.onreadystatechange=function(){
		if(http.readystate=4 && http.status == 200){
			
			var decodeJSON = JSON.parse(http.responseText);
			var boolUser = decodeJSON.boolUser;
			var boolPass = decodeJSON.boolPass;
			var bool = decodeJSON.bool;
			var boolNama = decodeJSON.boolNama;
			var boolUsedUser=decodeJSON.boolUsedUser;
			var boolUsedEmail=decodeJSON.boolUsedEmail;
			 
			var echo = http.responseText;
			var response = echo.substr(0,4);
			document.getElementById("nama_label").innerHTML = echo;
			//document.getElementById("pesan").innerHTML = echo;
			//response = "true";
			
			//document.getElementById("pesan").innerHTML = response;
			
			if(boolUser && boolPass && bool && boolNama){
				document.getElementById("user_error").innerHTML = "";
				document.getElementById("pass_label").innerHTML = "";
				document.getElementById("conf_pass_label").innerHTML = "";
				document.getElementById("nama_label").innerHTML = "";
				document.getElementById("email_label").innerHTML = "";
				document.getElementById("submit").disabled = false;
				//document.getElementById("pesan").innerHTML = "sadf"
			}else{
				document.getElementById("submit").disabled = true;
				var errorMessage = "";
				if(!boolNama){
					document.getElementById("user_error").innerHTML = "ERROR PADA USERNAME";
				}else{
					document.getElementById("user_error").innerHTML = "";
				}
				if(!boolPass){
					document.getElementById("conf_pass_label").innerHTML = "PASSWORD TIDAK SAMA";
				}else{
					document.getElementById("conf_pass_label").innerHTML = "";
				}
				if(!boolUser){
					document.getElementById("nama_label").innerHTML = "ERROR PADA NAMA";
				}else{
					document.getElementById("nama_label").innerHTML = "";
				}
				if(!bool){
					document.getElementById("email_label").innerHTML = "Kesalahan Pada Email";
				}else{
					document.getElementById("email_label").innerHTML = "";
				}
 				if(!boolUsedUser)
				{
					document.getElementById("user_error").innerHTML = "USERNAME SUDAH DIPAKAI";
				}
				if(!boolUsedEmail)
				{
					document.getElementById("email_label").innerHTML = "EMAIL SUDAH DIPAKAI";
				}  
			}
		}
	}
	http.open("GET","Registrasi/validasi.jsp?username=" + username + "&password=" + password
		+"&confirm_password=" + confirm_password + "&nama_lengkap=" + nama_lengkap
		+ "&email=" + email,true);
	http.send();
}
function daftar_kartu(){
	
	
	
	http.onreadystatechange=function(){
	
		if(http.readyState==4 && http.status == 200){
			//alert(http.responseText);
			var decodeJSON = JSON.parse(http.responseText);
			if(decodeJSON.status == false){
				alert("KARTU YANG ANDA DAFTARKAN TIDAK VALID");
			}else{
				alert("Berhasil mendaftarkan kartu");
				window.location="index.jsp";
			}
			
		}
		//document.write(decodeJSON.status);
	}
	
	http.open("GET","proses_kartu.jsp?card_number="+document.getElementById("card_number").value
		+"&card_name=" + document.getElementById("card_name").value
		+"&card_expired=" + document.getElementById("card_expired").value
		,true
		);
		
	http.send();
	
}


function daftar_kartu_pembayaran(){
	
	
	
	http.onreadystatechange=function(){
	
		if(http.readyState==4 && http.status == 200){
			//alert(http.responseText);
			var decodeJSON = JSON.parse(http.responseText);
			if(decodeJSON.status == false){
				alert("KARTU YANG ANDA DAFTARKAN TIDAK VALID");
			}else{
				alert("Berhasil mendaftarkan kartu");
				window.location="pembayaran.jsp";
			}
			
		}
		//document.write(decodeJSON.status);
	}
	
	http.open("GET","proses_kartu.jsp?card_number="+document.getElementById("card_number").value
		+"&card_name=" + document.getElementById("card_name").value
		+"&card_expired=" + document.getElementById("card_expired").value
		,true
		);
		
	http.send();
	
}
