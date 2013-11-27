<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->
<%
        Cookie cookiesCheck[] = null;
        cookiesCheck = request.getCookies();
        boolean adaCookies = false;
        
        for(int i = 0;i<cookiesCheck.length;i++){
            if(cookiesCheck[i].getName().equals("IdCustomer")){
                adaCookies = true;
                break;
            }
        }
        if(!adaCookies){
    %>
			<script type="text/javascript">
						window.alert("Maaf Anda harus LOGIN terlebih dahulu");
						window.location="index.jsp";
						</script>
   <%
            }
   %>
   <script src="js/AjaxCreateObject.js" language="javascript"></script>
   <script src="js/function.js" language="javascript"></script>
</head>
<script type="text/javascript">

function getCookie(c_name)
//FUNGSI PENGAMBIL COOCIE
{
var c_value = document.cookie;
var c_start = c_value.indexOf(" " + c_name + "=");
if (c_start == -1)
  {
  c_start = c_value.indexOf(c_name + "=");
  }
if (c_start == -1)
  {
  c_value = null;
  }
else
  {
  c_start = c_value.indexOf("=", c_start) + 1;
  var c_end = c_value.indexOf(";", c_start);
  if (c_end == -1)
  {
c_end = c_value.length;
}
c_value = unescape(c_value.substring(c_start,c_end));
}
return c_value;
}

function checkSubmit(){
	var can_submit = true;
	var ada_berubah = false;
	//setcookie("user1",asu,time()+10000000); 
	
	document.getElementById("pesan").innerHTML = "";
	
	//CHECK PASSWORD
	if(document.getElementById("password").value == ""){
		alert("Password Tidak Boleh Kosong");
		document.getElementById("pesan").innerHTML += "Password tidak boleh kosong.\n"
		can_submit = false;
	}else{
		if(document.getElementById("password").value != document.getElementById("conf_password").value){
			alert("Password yang anda masukkan tidak sama dengan konfirmasi password");
			can_submit = false;
		}else{
			if(document.getElementById("password").value.length < 8){
				alert("Panjang password minimal 8 karakter");
				can_submit = false;
			}else{
				if(document.getElementById("password").value == getCookie("username")){
					alert("password tidak boleh sama dengan username");
					can_submit = false;
				}else{
					//document.getElementById("pesan").innerHTML = getCookie("email");
					if(document.getElementById("password").value == getCookie("email")){
						alert("Password tidak boleh sama dengan email");
						can_submit = false;
					}
				}
			}
		}
	}
	
	if(document.getElementById("nama_lengkap").value != document.getElementById("nama_lengkap").defaultValue){
		
		var cekNama = document.getElementById("nama_lengkap").value;
		cekNama.trim();
		var arrNama = cekNama.split(" ");
		
		
		if(arrNama.length > 1 && arrNama[1] != ""){
			ada_berubah = true;
		}else{
			alert("Nama tidak valid, kurang dari 2 kata");
			can_submit = false;
		}
	}
	
	if(document.getElementById("password").value != getCookie("password")){
		ada_berubah = true;
	}
	
	
	if(document.getElementById("alamat").value != document.getElementById("alamat").defaultValue){
		ada_berubah = true;
	}
	
	if(document.getElementById("provinsi").value != document.getElementById("provinsi").defaultValue){
		ada_berubah = true;
	}
	
	if(document.getElementById("kobupaten").value != document.getElementById("kobupaten").defaultValue){
		ada_berubah = true;
	}
	
	if(document.getElementById("kodepos").value != document.getElementById("kodepos").defaultValue){
		ada_berubah = true;
	}
	
	if(document.getElementById("handphone").value != document.getElementById("handphone").defaultValue){
		ada_berubah = true;
	}
	//document.write("");
	
	if(!ada_berubah){
		alert("Tidak ada data yang berubah");
		can_submit = false;
	}
	
	if(can_submit){
		//kirim data
		var data_kirim;
		data_kirim = "nama_lengkap=" + document.getElementById("nama_lengkap").value;
		data_kirim += "&password=" + document.getElementById("password").value;
		data_kirim += "&alamat=" + document.getElementById("alamat").value;
		data_kirim += "&provinsi=" + document.getElementById("provinsi").value;
		data_kirim += "&kobupaten=" + document.getElementById("kobupaten").value;
		data_kirim += "&kodepos=" + document.getElementById("kodepos").value;
		data_kirim += "&handphone=" + document.getElementById("handphone").value
		
		window.location="proses_edit.jsp?"+data_kirim;
		
		/*http.open("POST","proses_edit.php",true);
		http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		http.send("nama_lengkap="+document.getElementById("nama_lengkap").value+
			"&password="+document.getElementById("password").value+
			"&alamat="+document.getElementById("alamat").value+
			"&kobupaten="+document.getElementById("kobupaten").value+
			"&kodepos="+document.getElementById("kodepos").value+
			"&handphone="+document.getElementById("handphone").value
			);*/
	}
	
}

</script>
<body>

<%@include file="header.jsp" %>

    <%
        Cookie cookiess[] = request.getCookies();
        Cookie user1 = null;
        Cookie alamat = null;
        Cookie provinsi = null;
        Cookie kobupaten = null;
        Cookie kodepos = null;
        Cookie handphone = null;
        
        for(int i = 0;i<cookiess.length;i++){
            if(cookiess[i].getName().equals("user1")){
                user1 = cookiess[i];
            }
            if(cookiess[i].getName().equals("alamat")){
                alamat = cookiess[i];
            }
            if(cookiess[i].getName().equals("provinsi")){
                provinsi = cookiess[i];
            }
            if(cookiess[i].getName().equals("kobupaten")){
                kobupaten = cookiess[i];
            }
            if(cookiess[i].getName().equals("kodepos")){
                kodepos = cookiess[i];
            }
            if(cookiess[i].getName().equals("handphone")){
                handphone = cookiess[i];
            }
        }
    %>

<div class = "bodymain">
    <%@include file="sidebar.jsp" %>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> EDIT PROFILE</p></br></br>
		</div>
			<div class = "registerspace">
                            <label>Nama Lengkap</label> <input type="text" id="nama_lengkap" placeholder = "Chris Martin" value =<%--<?php echo $_COOKIE["user1"]?>--%> <% out.print(user1.getValue()); %> defaultValue = <%--<?php echo $_COOKIE["user1"]?>--%><% out.print(user1.getValue());%>;></br></br>
			
			<label>Change Password</label> <input type="password" id="password" required placeholder = "1234"></br></br>
			
			<label>Confirm change Password</label> <input type="password" id="conf_password" required placeholder = "1234"></br></br>
			
			<label>Alamat</label> <input type="text" id="alamat" placeholder = "Jl. Ganesha No.10 Bandung" value ="<%if(alamat!=null){out.print(alamat.getValue());}%>" defaultValue = <%if(alamat!=null){out.print(alamat.getValue());}%>></br></br>
			
			<label>Provinsi</label> <input type="text" id="provinsi" placeholder = "Jawa Barat" value ="<% if(provinsi!=null){out.print(provinsi.getValue());} %>" defaultValue = <% if(provinsi!=null){out.print(provinsi.getValue());} %>></br></br>
			
			<label>Kota/Kabupaten</label> <input type="text" id="kobupaten" placeholder = "Sumur Bandung" value ="<% if(kobupaten!=null){out.print(kobupaten.getValue());} %>" defaultValue = <% if(kobupaten!=null){out.print(kobupaten.getValue());} %>></br></br>
			
			<label>Kode Pos</label> <input type="text" id="kodepos" placeholder = "40124" value ="<% if(kodepos!=null){out.print(kodepos.getValue());} %>" defaultValue = <% if(kodepos!=null){out.print(kodepos.getValue());} %>></br></br>
			
			<label>Nomor Handphone</label> <input type="text" id="handphone" placeholder = "08180000000" value ="<% if(handphone!=null){out.print(handphone.getValue());} %>" defaultValue = <% if(handphone!=null){out.print(handphone.getValue());} %>></br></br>
			
			<input type="button" value = "Save" onclick="checkSubmit()"><label id="pesan"></label></br></br>
			</div>
			
			 
			  
			</div>
			</div>
			
			
			
	
	<div class = "footer">
		<div class = "info">

		</div>
		
		
	</div>
</div>
</body>
</html>