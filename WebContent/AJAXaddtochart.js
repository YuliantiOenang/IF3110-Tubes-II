function AJAXaddtocart(productname) {
	var xmlhttp;
	var qty=document.getElementById(productname).value;
	if (isNaN(Number(qty))) {
		alert("Masukan bukan angka");
		return;
	}
	else if(Number(qty)<1) {
		alert("Masukan harus lebih dari 0");
		return;
	}
	if (window.XMLHttpRequest)
		{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
		{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("POST","AJAXaddtocart.java",false);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("productname="+productname+"&qty="+qty);
	if (xmlhttp.responseText!="true") {
		alert("Stok barang tidak cukup! Tersedia "+xmlhttp.responseText+" stok");
	}
	else {
		alert(productname+" x"+qty+" ditambahkan ke cart");
		for (var i=0;i<Number(qty);i++) {
			if (sessionStorage.getItem(productname)) {
				var newval = Number(sessionStorage.getItem(productname));
				newval++;
				sessionStorage.setItem(productname, newval);
			}
			else {
				sessionStorage.setItem(productname, "1");
			}
		}
		location.reload();
	}
}