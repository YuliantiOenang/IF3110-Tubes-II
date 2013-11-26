<%@ include file="header.jsp" %>
		<script src="AJAXaddtocart.js"></script>
		<script>
			if (localStorage.user==null) {
				window.location = "register.jsp";
			}
			function renderCart() {
				var element=document.getElementById("cart");
				var totalbelanja=0;
				for (var i = 0; i < sessionStorage.length; i++) {
					var harga=getHarga(sessionStorage.key(i));
					totalbelanja+=harga*sessionStorage.getItem(sessionStorage.key(i));
					element.innerHTML+="<form name='"+sessionStorage.key(i)+"'>";
					element.innerHTML+="Nama barang: "+sessionStorage.key(i)+"<br>";
					element.innerHTML+="Jumlah: <input type='text' name='jumlah' id='"+sessionStorage.key(i)+"' value='"+sessionStorage.getItem(sessionStorage.key(i))+"'><br>"
					element.innerHTML+="Harga satuan: "+harga+"<br>"
					element.innerHTML+="Harga total: "+(harga*sessionStorage.getItem(sessionStorage.key(i)))+"<br>"
					element.innerHTML+="<button id='edit' type='button' onclick='editProduct(\""+sessionStorage.key(i)+"\")'>Save</button>";
					element.innerHTML+="<button id='delete' type='button' onclick='deleteProduct(\""+sessionStorage.key(i)+"\")'>Delete</button><br><br>";
				}
				element.innerHTML+="</form>Total Belanja : "+totalbelanja+"<br>";
				element.innerHTML+="<button id='buy' type='button' onclick='AJAXbuy()'>Buy</button>";
			}
			function editProduct(productname) {
				sessionStorage.removeItem(productname);
				AJAXaddtocart(productname);
			}
			function deleteProduct(productname) {
				sessionStorage.removeItem(productname);
				location.reload();
			}
			function getHarga(productname) {
				var xmlhttp;
				if (window.XMLHttpRequest)
					{// code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp=new XMLHttpRequest();
				}
				else
					{// code for IE6, IE5
					xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlhttp.open("POST","AJAXgetharga.jsp",false);
				xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xmlhttp.send("productname="+productname);
				return (xmlhttp.responseText.trim());
			}
			function AJAXbuy() {
				var xmlhttp;
				if (window.XMLHttpRequest)
					{// code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp=new XMLHttpRequest();
				}
				else
					{// code for IE6, IE5
					xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				}
				//Cek kartu
				xmlhttp.open("POST","AJAXcekkartu.jsp",false);
				xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xmlhttp.send("username="+localStorage.user);
				if (xmlhttp.responseText.trim()=="false") {
					alert("Silahkan isi data kartu kredit anda terlebih dahulu.");
					window.location = "card.jsp";
					return;
				}
				//Buy
				nProduk=sessionStorage.length;
				while (sessionStorage.length>0) {
					xmlhttp.open("POST","AJAXbuy.jsp",false);
					xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
					xmlhttp.send("productname="+sessionStorage.key(0)+"&qty="+sessionStorage.getItem(sessionStorage.key(0)));
					sessionStorage.removeItem(sessionStorage.key(0));
				}
				//Update transaksi user
				xmlhttp.open("POST","AJAXupdatetrans.jsp",false);
				xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xmlhttp.send("username="+localStorage.user);
				alert("Transaksi berhasil!");
				window.location = "index.jsp";
			}
		</script>
	</head>
<%@ include file="middle.jsp" %>
		<h2>Cart</h2>
		<div id="cart">
			<script>
				renderCart();
			</script>
		</div>
	</body>
</html>