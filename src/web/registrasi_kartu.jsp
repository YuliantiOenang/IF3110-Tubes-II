<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->
<%--<?php
if(!isset($_COOKIE['user1']))
{
	?>
			<script type="text/javascript">
						window.alert("Maaf Anda harus LOGIN terlebih dahulu");
						window.location="index.php";
						</script>
		<?php
}--%>

<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>
<%
    String nil=request.getParameter("status");
    
%>
</head>

<body>
<%@ include file="header.jsp"%>

<div class = "bodymain">
	<%@ include file="sidebar.jsp"%>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class ="title"> REGISTER YOUR CARD</p></br></br>
		</div>
			<div class = "registerspace">
			<label>Card Number </label> <input type="text" id="card_number" required placeholder = "0123456789101213" /></br></br>
			
			<label>Name On Card</label> <input type="text" id="card_name" required placeholder = "Chris Martin" /><label id="nama_label"></label></br></br>
			
			<label>Expiration Date</label> <input type="text" id="card_expired" required placeholder = "08/12/2003" /></br></br>
			
                        <input type="button" id="submit" value = "Register credit card!" onclick="<% if(nil!=null) out.print("daftar_kartu_pembayaran()"); else out.print("daftar_kartu()");%>">
			<input type="button" value = "SKIP" onclick="window.location='index.php'"></br>
			
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