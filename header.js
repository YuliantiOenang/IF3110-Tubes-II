var IsLogin = false;
var currUsername;
var LoginClicked = false;
var NamaDepan = "Yanuar";
var KategoriBarang = new Array();
KategoriBarang[0] = "makanan";
KategoriBarang[1] = "aksesoris";
KategoriBarang[2] = "pakaian";
KategoriBarang[3] = "furnitur";
KategoriBarang[4] = "mainan";
var activeUser = "";

function IsLogin(){
	currUsername=getCookie("username");
	if (currUsername!=null && currUsername!="") {
		return true;
	} else {
		return false;
	}
}

function getUsername() {
	return localStorage.getItem('activeUser');
}

function drawHeaderContent(){
	document.getElementById('header').innerHTML="";
	document.getElementById('header').innerHTML+="<a href=\"index.jsp?kategori=0\"> <img src=\"resource/logo.png\" id='logo'> </a>";
	document.getElementById('header').innerHTML+="<form id='searchform' method='get' action='browse.jsp'><input id='hilang' name='sortBy' value=popularitas><input id='hilang' name='currentPage' value =1><input class=\"textInput\" id='searchBar' type=\"text\" name=\"keyword\">";
	document.getElementById('searchform').innerHTML+="<input class=\"button\" id='searchButton' type=\"submit\" value=\"\">";
	document.getElementById('searchform').innerHTML+="<select class=\"dropDown\" id='kategoriDropDown' name='kategori'>";
	document.getElementById('kategoriDropDown').innerHTML+="<option value=\"default\">kategori...</option>";
	for (var i=0;i<5;i++){
		var opt = document.createElement("option");
        opt.value = KategoriBarang[i];
        opt.text= KategoriBarang[i];
        document.getElementById('kategoriDropDown').appendChild(opt);
	}
	document.getElementById('searchform').innerHTML+="</select></form>";
	document.getElementById('header').innerHTML+="<a href=\"shoppingbag.jsp\"><button class=\"buttonHeader\" id='shoppingChart' type=\"button\">tas belanja</button></a>";


	//var activeUser = "";
	//loadXMLDoc(
	//	"isLogin.php",
	//	function() {
	//		if (xmlhttp.readyState==4) {
	//			activeUser = xmlhttp.responseText;
	//			alert(activeUser);
	//
	//			if (activeUser != "") {
	//				document.getElementById('header').innerHTML+="<button class=\"buttonHeader\" id='logout' type=\"button\" onclick=\"logout()\">keluar</button>";
	//				document.getElementById('header').innerHTML+="<a href=\"profile.html\"><button class=\"buttonHeader\" id='profile' type=\"button\">selamat datang, Yanuar!</button></a>";
	//			} else {
	//				document.getElementById('header').innerHTML+="<a href=\"registrasi.html\"><button class=\"buttonHeader\" id='register' type=\"button\" >daftar!</button></a>";
	//				document.getElementById('header').innerHTML+="<button class=\"buttonHeader\" id='login' type=\"button\" onclick=\"triggerPopupLogin()\">masuk</button>";
	//				if (LoginClicked){
	//					drawPopupLogin();
	//				}
	//			}
	//		}
	if (localStorage.getItem('activeUser') != "") {
		document.getElementById('header').innerHTML+="<button class=\"buttonHeader\" id='logout' type=\"button\" onclick=\"logout()\">keluar</button>";
		document.getElementById('header').innerHTML+="<a href=\"profile.jsp?username="+localStorage.getItem('activeUser')+"\"><button class=\"buttonHeader\" id='profile' type=\"button\">selamat datang, " + localStorage.getItem('activeUser') +"!</button></a>";
	} else {
		document.getElementById('header').innerHTML+="<a href=\"registrasi.html\"><button class=\"buttonHeader\" id='register' type=\"button\" >daftar!</button></a>";
		document.getElementById('header').innerHTML+="<button class=\"buttonHeader\" id='login' type=\"button\" onclick=\"triggerPopupLogin()\">masuk</button>";
		if (LoginClicked){
			drawPopupLogin();
		}
	}
}

function triggerPopupLogin(){
	LoginClicked =!LoginClicked;
	drawHeaderContent();
}

function drawPopupLogin(){
	document.getElementById('header').innerHTML+="<div id='popupLoginBubble'><div id='popupLoginContent'>";
	document.getElementById('popupLoginContent').innerHTML+="username </br><form id='popupLoginForm' disabled>";
	document.getElementById('popupLoginForm').innerHTML+="<input class=\"textInput\" id='loginUsername' type=\"text\" name=\"username\"></br>";
	document.getElementById('popupLoginForm').innerHTML+="password</br>";
	document.getElementById('popupLoginForm').innerHTML+="<input class=\"textInput\" id='loginPassword' type=\"password\" name=\"pwd\"></br></br>";
	document.getElementById('popupLoginForm').innerHTML+="<input type='button' class=\"button\" onclick=\"login()\" value='Masuk'> <input class=\"button\" id='cancelButton' type=\"submit\" value=\"batal\" onclick=\"triggerPopupLogin()\">";
	document.getElementById('popupLoginForm').innerHTML+="</form><div id='failLogin'></div";
	document.getElementById('popupLoginContent').innerHTML+="</div></div>";
}


function login(){
	var user = document.getElementById("loginUsername").value;
	var pass = document.getElementById("loginPassword").value;
	
	var xmlhttp;
		if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		xmlhttp.onreadystatechange=function()
		  {
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				if (xmlhttp.response == 0) {
					alert("Login gagal, periksa kembali username dan password anda");
				}
				else {
					localStorage.setItem('activeUser', xmlhttp.response);
					IsLogin = true;
					drawHeaderContent();
				}
			}
		  }
		xmlhttp.open("GET","verifyLogin.jsp?username="+user+"&password="+pass,true);
		xmlhttp.send();
}

function logout(){
	//IsLogin=false;
	LoginClicked = false;
	//loadXMLDoc(
	//	"logout.php", 
	//	function() {
	//		if (xmlhttp.readyState == 4) {
	//			IsLogin = false;
	//			alert(xmlhttp.responseText);
	//			drawHeaderContent();
	//		}
	//	}
	//);
	localStorage.setItem('activeUser', '');
	drawHeaderContent();
	
}

function addItem(nama) {
	var bag = localStorage.getItem('bagName');
	
	if (bag == null || bag == "") {
		bag = new Array();
	}
	bag[bag.length] = nama;
	quantity[quantity.length] = jumlah;
	
	localStorage['bagName'] = JSON.stringify(bag);
	alert(bag.length);
}

function deleteItemFromBag(IdxList){
	var listBelanja = localStorage.getItem('shopList');
	listBelanja.splice(IdxList,1);
}