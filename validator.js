var u;
var p;
var cp;
var nl;
var e;
var hp;
var al;
var pr;
var kab;
var kp;
var vp;
var vcp;
var vnl;
var vun = Boolean();
var vemail = Boolean();
var ulength = Boolean();
var elength = Boolean();
var buttonon = Boolean();

buttonon = false;

function valun(s){
	if (s.length<5) {
		document.getElementById("vun").innerHTML="username minimal terdiri dari 5 huruf</br>";
		ulength = false;
	}
	else {
		document.getElementById("vun").innerHTML="";
		ulength = true;
	}
}
function valun2(s){
	loadXMLDoc("checkUsername.jsp?u="+s, function()
		{
			if (xmlhttp.readyState == 4) {
				var response= "";
				response = xmlhttp.response;
				if (response == 1) {
					document.getElementById("vun2").innerHTML="";
					vun = true;
				}
				else {
					document.getElementById("vun2").innerHTML=response;
					vun = false;
				}
			}
		}
	);
}
function valp(s){
	if (s.length<8) {
		document.getElementById("vp").innerHTML="password minimal terdiri dari 8 huruf</br>";
		vp = false;
	} else  {
		var un = document.getElementById('txt_un').value;
		var email = document.getElementById('txt_email').value;
		if ((s == un) || (s == email)) {
			document.getElementById("vp").innerHTML="password tidak boleh sama dengan username/email</br>";
			vp = false;
		}
		else {
			document.getElementById("vp").innerHTML="";
			vp = true;
		}
	}
}

function valpEdit(s){
	if (s.length<8) {
		document.getElementById("vp").innerHTML="password minimal terdiri dari 8 huruf</br>";
		vp = false;
	} else  {
		var un = localStorage.getItem('activeUser');
		var email = document.getElementById('txt_email').value;
		if ((s == un) || (s == email)) {
			document.getElementById("vp").innerHTML="password tidak boleh sama dengan username/email</br>";
			vp = false;
		}
		else {
			document.getElementById("vp").innerHTML="";
			vp = true;
		}
	}
}

function valcp(s){
	var p = document.getElementById('txt_pass').value;
	if (s == p) {
		document.getElementById("vcp").innerHTML="";
		vcp = true;
	}
	else {
		document.getElementById("vcp").innerHTML="confirm password harus sama dengan password</br>";
		vcp = false;
	}	
}
function valnl(s){
	var name = /[A-Za-z]+\s[A-Za-z]+/;
	if (name.test(s)) {
		document.getElementById("vnl").innerHTML="";
		vnl = true;
	} else {
		document.getElementById("vnl").innerHTML="nama lengkap harus terdiri dari first dan last name</br>";
		vnl = false;
	}
}
function valemail(s){
	var email = /[A-Za-z0-9_.][A-Za-z0-9_.]+[@]\w+[.]\w+/;
	if (!email.test(s)) {
		document.getElementById("vemail").innerHTML="email tidak sesuai format yang benar, format yang benar adalah minimal xx@x.x </br>";
		elength=false;
	} else {
		document.getElementById("vemail").innerHTML="";
		elength=true;
	}
}
function valemail2(s){
	loadXMLDoc("checkEmail.jsp?e="+s, function()
		{
			if (xmlhttp.readyState == 4) {
				var response = "";
				response = xmlhttp.response;
				if (response == 1) {
					vemail = true;
					document.getElementById("vemail2").innerHTML="";
				}
				else {
					document.getElementById("vemail2").innerHTML=response;
					vemail = false;
				}
			}
		}
	);
}
