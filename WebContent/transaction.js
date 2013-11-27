function isNumber(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}

function validate(id_barang, id_div){
	var notif_bar = document.getElementById("notif" + id_div);
	var jml_beli = document.getElementById("quant" + id_div).value;
	//alert("Beli " + jml_beli + " ya mbak?");
	
	if(isNumber(jml_beli)){
		if(parseInt(jml_beli) <= 0){
			notif_bar.innerHTML = "Jumlah beli tidak valid!";
			//alert("Jumlah beli tidak valid!");
			return;
		}
	} else {
		notif_bar.innerHTML = "Jumlah harus angka!";
		//alert("Jumlah harus angka!");
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
				addToCart(id_barang, id_div);
			} else {
				notif_bar.innerHTML = "Jumlah tidak mencukupi!";
				//alert("Jumlah tidak mencukupi!");
			}
			
		}
	};
	xmlhttp.open("POST","validateBarang", false);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(data);
}

function buyCart(){
	data = "mode=buy";
	if(localStorage.id_user == undefined){
		alert("Maaf, Anda harus login terlebih dahulu.");
		return;
	} else {
		data=data+"&id_user="+localStorage.id_user;
	}
	
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
			notif_bar.innerHTML = responsecode;
			//alert(responsecode);
		}
	};
	xmlhttp.open("POST","viewCart", false);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(data);
}

function clearCart(){
	data = "mode=clear";
	if(localStorage.id_user == undefined){
		alert("Maaf, Anda harus login terlebih dahulu.");
		return;
	}
	
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
			notif_bar.innerHTML = responsecode;
			//alert(responsecode);
		}
	};
	xmlhttp.open("POST","viewCart", false);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(data);
}

function addToCart(id_barang, id_div){
	//alert("notif" + id_div);
	var notif_bar = document.getElementById("notif" + id_div);
	var jml_beli = document.getElementById("quant" + id_div).value;
	
	data = "id_barang=" + id_barang;
	data += "&jumlah=" + jml_beli;
	
	
	if(localStorage.id_user == undefined){
		notif_bar.innerHTML = "Maaf, Anda harus login terlebih dahulu.";
		return;
	}
	
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
			notif_bar.innerHTML = responsecode;
			//alert(responsecode);
		}
	};
	xmlhttp.open("POST","addToCart", false);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(data);
}
