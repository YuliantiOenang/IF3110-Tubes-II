/**
 * 
 */


function checkUsername()
{	
	var username = document.getElementById("username").value;
		
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
			document.getElementById("usernameErr").innerHTML = xmlhttp.responseText;			
		}
	};
	
	xmlhttp.open("GET","CheckUser?username="+username,true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send();
}

setInterval(function()
{ 
	var namaErr = '';
	var hargaErr = '';
	var gambarErr = '';
	
	var nama = document.getElementById("nama").value.toLowerCase();
	var harga = document.getElementById("harga").value;
	var gambar = document.getElementById("gambar").value; 
	
	if (nama.length == 0) namaErr = "* Nama barang harus diisi";
	if (harga.length == 0) hargaErr = "* Harga barang harus diisi";
	if (gambar == null) gambarErr = "* Gambar barang harus diisi";
	
	
	document.getElementById("namaErr").innerHTML = namaErr;
	document.getElementById("hargaErr").innerHTML = hargaErr;
	document.getElementById("gambarErr").innerHTML = gambarErr;
	
	
	if ((namaErr.length == 0) && (hargaErr.length == 0))
	{	
		document.getElementById("submit_btn").disabled = false;
	}
	else
		document.getElementById("submit_btn").disabled = true; 
	
}, 1000);