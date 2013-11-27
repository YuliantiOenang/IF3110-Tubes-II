/**
 * 
 */

var res = "FAIL";
var date_valid = "0";

setInterval(function()
{ 
	var number = document.getElementById("number").value;
	var name = document.getElementById("name").value; 
	var date1 = document.getElementById("date1").value;
	
	
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
			
			res = String(xmlhttp.responseText);
		}
	};
	
	
	xmlhttp.open("GET","CheckKartu?number="+number+"&name="+name+"&date1=" + date1,true);
	xmlhttp.send();
	
	if (res == "FAIL")
	{
		document.getElementById("err").innerHTML = "* Kartu tidak valid";
		document.getElementById("submit_btn").disabled = true;
	}
	else
	if (res == "USED")		
	{
		document.getElementById("err").innerHTML = "* Kartu telah terpakai oleh user lain";
		document.getElementById("submit_btn").disable = true;
	}
	else
	{
		document.getElementById("err").innerHTML = "";
		document.getElementById("submit_btn").disabled = false;
	} 
}, 500);