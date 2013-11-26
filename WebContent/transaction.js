

function validate(id_barang, id_div){
	var y = document.getElementById("notif" + id_div);
	
	data = "id=" + id_barang;
	
	//lakukan koneksi ke servlet
	var xmlhttp;
	if (window.XMLHttpRequest){
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	 }
	else{
	// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}	
	
	xmlhttp.onreadystatechange=function(){
		//alert("ReadyState: " + xmlhttp.readyState + " Status: " + xmlhttp.status + " Text: "+xmlhttp.responseText);
		if (xmlhttp.readyState=="4" && xmlhttp.status=="200"){
			var jumlahBarang = xmlhttp.responseText;
			if(parseInt(jumlahBarang) > 0){
				addToCart(id_barang);
			} else {
				alert("Barang sudah habis!");
			}
			
		}
	};
	xmlhttp.open("POST","validateBarang", false);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(data);
}

function addToCart(id_barang){
	data = "id=" + id_barang;
	
	//lakukan koneksi ke servlet
	var xmlhttp;
	if (window.XMLHttpRequest){
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	 }
	else{
	// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}	
	
	xmlhttp.onreadystatechange=function(){
		//alert("ReadyState: " + xmlhttp.readyState + " Status: " + xmlhttp.status + " Text: "+xmlhttp.responseText);
		if (xmlhttp.readyState=="4" && xmlhttp.status=="200"){
			var responsecode = xmlhttp.responseText;
			alert(responsecode);
		}
	};
	xmlhttp.open("POST","addToCart", false);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(data);
}
