

function validate(id_barang, id_div){
	var y = document.getElementById("notif" + id_div);
	var jml_beli = document.getElementById("quant" + id_div).value;
	//alert("Beli " + jml_beli + " ya mbak?");
	
	if(parseInt(jml_beli) <= 0){
		alert("Jumlah beli tidak valid!");
		return;
	}
	
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
			if(parseInt(jumlahBarang) >= parseInt(jml_beli)){
				addToCart(id_barang);
			} else {
				alert("Jumlah tidak mencukupi!");
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
