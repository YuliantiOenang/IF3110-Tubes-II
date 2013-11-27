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
        if(adaCookies){
    %>
			<script type="text/javascript">
						window.alert("Anda Sudah mendaftarkan kartu Kredit!");
						window.location="index.jsp";
						</script>
		<%
            }
   %>
<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>
<script type="text/javascript">


function daftar_kartu(){
	
	
	
	http.onreadystatechange=function(){
	
		if(http.readyState==4 && http.status == 200){
			//alert(http.responseText);
			var decodeJSON = JSON.parse(http.responseText);
                        alert(decodeJSON.status);
                        if(decodeJSON.status == 0){
				alert("KARTU YANG ANDA DAFTARKAN TIDAK VALID");
			}else{
				alert("Berhasil mendaftarkan kartu");
				window.location="index.jsp";
			}
			
		}
		//document.write(decodeJSON.status);
	}
	
	http.open("GET","proses_kartu.jsp?card_number="+document.getElementById("card_number").value
		+"&card_name=" + document.getElementById("card_name").value
		+"&card_expired=" + document.getElementById("card_expired").value
		,true
		);
		
	http.send();
	
}


function daftar_kartu_pembayaran(){
	
	
	
	http.onreadystatechange=function(){
	
		if(http.readyState==4 && http.status == 200){
			//alert(http.responseText);
			var decodeJSON = JSON.parse(http.responseText);
			alert(decodeJSON.status);
                        if(decodeJSON.status == 0){
				alert("KARTU YANG ANDA DAFTARKAN TIDAK VALID");
			}else{
				alert("Berhasil mendaftarkan kartu");
				window.location="pembayaran.jsp";
			}
			
		}
		//document.write(decodeJSON.status);
	}
	
	http.open("GET","proses_kartu.jsp?card_number="+document.getElementById("card_number").value
		+"&card_name=" + document.getElementById("card_name").value
		+"&card_expired=" + document.getElementById("card_expired").value
		,true
		);
		
	http.send();
	
}

</script>
</head>
<body>
    <%@include file="header.jsp" %>
<div class = "bodymain">
    <%@include file="sidebar.jsp" %>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class ="title"> REGISTER YOUR CARD</p></br></br>
		</div>
			<div class = "registerspace">
			<label>Card Number </label> <input type="text" id="card_number" required placeholder = "0123456789101213" /></br></br>
			
			<label>Name On Card</label> <input type="text" id="card_name" required placeholder = "Chris Martin" /><label id="nama_label"></label></br></br>
			
			<label>Expiration Date</label> <input type="text" id="card_expired" required placeholder = "08/12/2003" /></br></br>
			
                        <input type="button" id="submit" value = "Register credit card!" onclick="
                               <% if(request.getParameter("status")!=null) 
                                   out.print("daftar_kartu_pembayaran();"); 
                                   else out.print("daftar_kartu();");
                                %>">
			<input type="button" value = "SKIP" onclick="window.location='index.jsp'"></br>
			
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