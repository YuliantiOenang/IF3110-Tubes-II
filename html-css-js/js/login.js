function login() {
	window.name="_HOME";
	var x = window.innerWidth/2 - 250;
	var y = window.innerHeight/2 - 70;
	newwindow = window.open('login.jsp', '_LOGIN', 'height=140, width=500');
	newwindow.moveTo(x,y);
	if (window.focus) {
		newwindow.focus();
	}
	return false;
}

function validateForm()
{
	// validation on client side
	var x=document.forms["loginForm"]["username"].value;
	if (x==null || x=="")
	{
		alert("Username harus diisi.");
		return false;
	}
	var y=document.forms["loginForm"]["pwd"].value;
	if (y==null || y=="")
	{
		alert("Password harus diisi.");
		return false;
	}
	// validation on server side
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	}
	else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			if (xmlhttp.responseText == 0) { // failed
				alert("Usernama atau password Anda tidak cocok.\nSilakan ulangi lagi.");
			} else { // success
				
				alert("Selamat datang, " + x + "!\nSenang melihatmu lagi.");
				newwindow2 = window.open('index.jsp', '_HOME');
				close();
			}
		}
	}

	xmlhttp.open("GET", "svr/validate_customer.jsp?usr="+x+"&pass="+y, true);
	xmlhttp.send();
}

/* when page is loaded */
function load_header() {
	for (var i = 1; i < 5; i++) {
		document.getElementsByTagName("li")[i].setAttribute("id","nav_hor_hidden");
	}
	for (var i = 5; i < 10; i++) {
		document.getElementsByTagName("li")[i].setAttribute("id","nav_hor");
	}
}