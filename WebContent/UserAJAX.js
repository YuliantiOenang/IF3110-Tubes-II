function Initialize(){
	if(localStorage.IsLogin == 0){//kalo udah login ga bisa ke sini :v
		//redirect ke halaman utama
		window.location.assign("Index.php");
	}
}

function SubmitRegistration(){	
	// Ambil data dari form 
	var data="";
	
	data = "type=registration";
	data=data+"&id="+document.forms["registration"]["username"].value;
	data=data+"&email="+document.forms["registration"]["email"].value;
	data=data+"&password="+document.forms["registration"]["password"].value;
	data=data+"&fullname="+document.forms["registration"]["fullname"].value;
	data=data+"&alamat="+document.forms["registration"]["alamat"].value;
	data=data+"&provinsi="+document.forms["registration"]["provinsi"].value;
	data=data+"&kota="+document.forms["registration"]["kota"].value;
	data=data+"&kodepos="+document.forms["registration"]["kodepos"].value;
	data=data+"&hp="+document.forms["registration"]["hp"].value;
	
	
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
		window.alert(xmlhttp.status);
		if (xmlhttp.readyState==4 && xmlhttp.status==200){		
			//window.opener.document.getElementById("test").innerHTML=xmlhttp.responseText;
			var responsecode = xmlhttp.responseText;
			var response = JSON.parse(responsecode);
			if(parseInt(response.code)==0){
				window.alert("Registrasi Berhasil ! ");
				// pindah ke halaman awal
				// localStorage.id = document.forms["registration"]["username"].value;
				// localStorage.pass=document.forms["registration"]["password"].value;
				// localStorage.IsLogin = 0;
				// localStorage.data = response.data;
				// localStorage.isCredit = 1;
				// window.location.assign("CreditCard.html");
			}
			else if(response.code==1){
				window.alert("Id sudah digunakan");
			}
			else if(response.code==2){
				window.alert("email sudah digunakan");
			}
			else{
				window.alert(response.code);
			}			
		}
	};
	xmlhttp.open("POST","UserServlet", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(data);
}