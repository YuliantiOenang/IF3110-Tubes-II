
<html>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="middle.jsp"></jsp:include>
<head>
<title>Insert title here</title>
</head>
<body>
		<form name="card">
			Card no: <input type="text" name="cardno"><br>
			Name on card: <input type="text" name="nameoncard"><br>
			Expire date: <input type="text" name="expdate"><br>
			<button id="submit" type="button" onclick="AJAXcard()">OK</button>
			<a href="index.jsp"><button type="button">Skip</button></a>
		</form>
</body>
</html>

<script>
			if (localStorage.user==null) {
				window.location = "register.jsp";
			}
			function AJAXcard() {
				var username=localStorage.user;
				var cardno=document.forms["card"]["cardno"].value;
				var nameoncard=document.forms["card"]["nameoncard"].value;
				var expdate=document.forms["card"]["expdate"].value;
				var xmlhttp;
				if (window.XMLHttpRequest)
					{// code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp=new XMLHttpRequest();
				}
				else
					{// code for IE6, IE5
					xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				}
				alert("haloooo");
				xmlhttp.open("POST","AJAXcard",true);
				xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xmlhttp.send("username="+username+"&cardno="+cardno+"&nameoncard="+nameoncard+"&expdate="+expdate);
				
				xmlhttp.onreadystatechange=function(){
				if(xmlhttp.readyState==4 && xmlhttp.status==200)
					{
					
						if (xmlhttp.responseText=="true") {
							alert("Registrasi kartu kredit berhasil");
							window.location="index.jsp";
						}
						else {
							alert("Card no / Name on card sudah pernah digunakan");
						}
					}
				}
			}
		</script>