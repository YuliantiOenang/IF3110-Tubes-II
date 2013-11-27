var xmlhttp;
function httpRequest() {
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
}

function loadXMLDoc(url,cfunc)
{
httpRequest();
xmlhttp.onreadystatechange=cfunc;
xmlhttp.open("GET",url,true);
xmlhttp.send();
}

function postForm(url, cfunc, form) { // w/o button
	httpRequest();
	xmlhttp.onreadystatechange=cfunc;
	xmlhttp.open("POST", url, true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	var formdata = "";
	for (var i=0;i<form.length;i++) {
	formdata += form.elements[i].name + "=" + form.elements[i].value;
	if (i < form.length-1) 
		formdata+="&";
	}
	
	xmlhttp.send(formdata);
}