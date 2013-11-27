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
	var usernameErr = '';
	var emailErr = '';
	var namaErr = '';
	var passErr = '';
	var pass2Err = '';
	
	var username = document.getElementById("username").value;
	var email = document.getElementById("email").value; 
	var pass = document.getElementById("pass").value;
	var pass2 = document.getElementById("pass2").value;
	var nama = document.getElementById("nama").value.toLowerCase();
	
	// username check 
	if (username.length == 0)
		usernameErr = "* Username harus diisi"; 
	else
	if (username.length < 5 || username.length > 28)
		usernameErr = "* Username harus terdiri dari 5-28 karakter"; 
	else
	{
		//usernameErr = "oaaoeho";
		checkUsername();
	}
	
	// password check 
	if (pass.length == 0)
		passErr = "* Password harus diisi"; 
	else
	if (pass.length < 8 || pass.length > 28)
		passErr = "* Password harus terdiri dari 8-28 karakter"; 
	else
	if (pass == username || pass == email)
		passErr = "* Password tidak boleh sama dengan username atau email";
	else
	if (pass != pass2)
		pass2Err = "* Password tidak match!"; 
	
	
	// name check 
	var cur = 0; 
	if (nama.length == 0)
		namaErr = "* Nama harus diisi";
	else
	{
	var  cnt_alpha = new Array();
	cnt_alpha[0] = cnt_alpha[1] = 0; 
	var cnt_space = 0;
	
	for (var i = 0; i < nama.length; ++i)
	{
		if (nama.charAt(i) == ' '){ cur = 1; cnt_space++; }
		if ((nama.charAt(i) >= 'a') && (nama.charAt(i) <= 'z')) cnt_alpha[cur]++;
	}
	
	if ((cnt_space < 1) || (cnt_alpha[0] < 1) || (cnt_alpha[1] < 1))
		namaErr = "* Nama harus minimal mengandung satu spasi antara 2 karakter";
	}
	
	// email check 
	if (email.length == 0)
		emailErr = "* Email harus diisi";
	else
	{
	cur = 0;
	var must = "_@_.__";
	for (var i = 0; i < email.length; ++i)
	{
		if (cur >= must.length);
		else
		if (must.charAt(cur) == '@')
		{
			if (email.charAt(i) == '@')
				cur++;
		}
		else
		if (must.charAt(cur) == '.')
		{
			if (email.charAt(i) == '.')
				cur++;
		}
		else
			cur++;
	}
	if (cur < must.length) emailErr = "* Email yang anda masukkan tidak valid"; 
	}
	
	
	document.getElementById("usernameErr").innerHTML = usernameErr;
	document.getElementById("passErr").innerHTML = passErr;
	document.getElementById("pass2Err").innerHTML = pass2Err;
	document.getElementById("namaErr").innerHTML = namaErr;
	document.getElementById("emailErr").innerHTML = emailErr; 
	
	
	if ((usernameErr.length == 0) && (passErr.length == 0) &&
		(pass2Err.length == 0) && (namaErr.length == 0) &&
		(emailErr.length == 0))
	{
		document.getElementById("submit_btn").disabled = false;
	}
	else
		document.getElementById("submit_btn").disabled = true; 
	
}, 1000);