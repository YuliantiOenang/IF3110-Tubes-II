
			if (localStorage.user==null) {
				window.location = "register.php";
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
				xmlhttp.open("POST","AJAXcard.java",false);
				xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xmlhttp.send("username="+username+"&cardno="+cardno+"&nameoncard="+nameoncard+"&expdate="+expdate);
				if (xmlhttp.responseText=="true") {
					alert("Registrasi kartu kredit berhasil");
					window.location="index.php";
				}
				else {
					alert("Username / password sudah pernah digunakan");
				}
			}