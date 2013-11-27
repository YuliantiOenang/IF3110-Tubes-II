function validateUser()
{
	// validation on client side
	var x=document.forms["login"]["username"].value;
	if (x==null || x=="")
	{
		alert("Username harus diisi.");
		return false;
	}
	var y=document.forms["login"]["password"].value;
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
				if (xmlhttp.responseText == 1) {
					alert("Selamat datang, " + x + "!\nSenang melihatmu lagi.");
					setCookie("Privilege", "User", 30);
				} else {
					alert("Selamat datang, Admin " + x + "!\nSenang melihatmu lagi.");
					setCookie("Privilege", "Admin", 30);
				}
				
				// store username into cookie :3
				setCookie("Username", x, 30);
			}
		}
	};

	xmlhttp.open("GET", "server/validate_customer.jsp?usr="+x+"&pass="+y, true);
	xmlhttp.send();
}

function invalidateUser()
{
	eraseCookie("Username");
	eraseCookie("Privilege");
	
	alert("Terima kasih telah menggunakan jasa kami.");
}