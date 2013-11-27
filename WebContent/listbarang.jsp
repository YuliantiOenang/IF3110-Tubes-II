<%@page import="bean.Barang"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Barang> pangan = (ArrayList<Barang>) request.getAttribute("pangan");
	ArrayList<Barang> pakaian = (ArrayList<Barang>) request.getAttribute("pakaian");
	ArrayList<Barang> elektronik = (ArrayList<Barang>) request.getAttribute("elektronik");
	ArrayList<Barang> rumahtangga = (ArrayList<Barang>) request.getAttribute("rumahtangga");
	ArrayList<Barang> olahraga = (ArrayList<Barang>) request.getAttribute("olahraga");
%>

<div id="content" class="float_l">
<% if (pangan!=null) { %>
	<h2>TOP Pangan</h2>
	<% for (int x = 0; x < 3; x++) { %>
		<div class="product_box">
			<h3> <% out.print(pangan.get(x).getNama_barang()); %> </h3>
			<a href="detail?id= <% out.print(pangan.get(x).getId_barang()); %>">
			<img src="<%out.print(pangan.get(x).getGambar_barang());%>" /></a>
			<p class="product_price">
				Harga : Rp <% out.print(pangan.get(x).getHarga_barang()); %><br> 
				Stok : <% out.print(pangan.get(x).getStok()); %> <br>
			<form name="beli" action="addcart" method="post">
				<input type="hidden" name="id_barang"
					value="<% out.print(pangan.get(x).getId_barang()); %>"> 
					<input type="hidden" name="request_tambahan" value="-"> Quantity 
					<input type="number" min="1" max="10" value=1 name="qt" style="width: 60px; text-align: right" > 
					<input type="submit" value="Add to cart">
			</form>
			</p>
		</div>
	<% } %>
	<h2>TOP Pakaian</h2>
	<% for (int x = 0; x < 3; x++) { %>
		<div class="product_box">
			<h3> <% out.print(pakaian.get(x).getNama_barang()); %> </h3>
			<a href="detail?id= <% out.print(pakaian.get(x).getId_barang()); %>">
			<img src="<%out.print(pakaian.get(x).getGambar_barang());%>" /></a>
			<p class="product_price">
				Harga : Rp <% out.print(pakaian.get(x).getHarga_barang()); %><br> 
				Stok : <% out.print(pakaian.get(x).getStok()); %> <br>
			<form name="beli" action="addcart" method="post">
				<input type="hidden" name="id_barang"
					value="<% out.print(pakaian.get(x).getId_barang()); %>"> 
					<input type="hidden" name="request_tambahan" value="-"> Quantity 
					<input type="number" min="1" max="10" value=1 name="qt" style="width: 60px; text-align: right" /> 
					<input type="submit" value="Add to cart">
			</form>
			</p>
		</div>
	<% } %>
	<h2>TOP Elektronik</h2>
	<% for (int x = 0; x < 3; x++) { %>
		<div class="product_box">
			<h3> <% out.print(elektronik.get(x).getNama_barang()); %> </h3>
			<a href="detail?id= <% out.print(elektronik.get(x).getId_barang()); %>">
			<img src="<%out.print(elektronik.get(x).getGambar_barang());%>" /></a>
			<p class="product_price">
				Harga : Rp <% out.print(elektronik.get(x).getHarga_barang()); %><br> 
				Stok : <% out.print(elektronik.get(x).getStok()); %> <br>
			<form name="beli" action="addcart" method="post">
				<input type="hidden" name="id_barang"
					value="<% out.print(elektronik.get(x).getId_barang()); %>"> 
					<input type="hidden" name="request_tambahan" value="-"> Quantity 
					<input type="number" min="1" max="10" value=1 name="qt" style="width: 60px; text-align: right" /> 
					<input type="submit" value="Add to cart">
			</form>
			</p>
		</div>
	<% } %>
	
	<h2>TOP Rumah Tangga</h2>
	<% for (int x = 0; x < 3; x++) { %>
		<div class="product_box">
			<h3> <% out.print(rumahtangga.get(x).getNama_barang()); %> </h3>
			<a href="detail?id= <% out.print(rumahtangga.get(x).getId_barang()); %>">
			<img src="<%out.print(rumahtangga.get(x).getGambar_barang());%>" /></a>
			<p class="product_price">
				Harga : Rp <% out.print(rumahtangga.get(x).getHarga_barang()); %><br> 
				Stok : <% out.print(rumahtangga.get(x).getStok()); %> <br>
			<form name="beli" action="addcart" method="post">
				<input type="hidden" name="id_barang"
					value="<% out.print(rumahtangga.get(x).getId_barang()); %>"> 
					<input type="hidden" name="request_tambahan" value="-"> Quantity 
					<input type="number" min="1" max="10" value=1 name="qt" style="width: 60px; text-align: right" /> 
					<input type="submit" value="Add to cart">
			</form>
			</p>
		</div>
	<% } %>
	<h2>TOP Olahraga</h2>
	<% for (int x = 0; x < 3; x++) { %>
		<div class="product_box">
			<h3> <% out.print(olahraga.get(x).getNama_barang()); %> </h3>
			<a href="detail?id= <% out.print(olahraga.get(x).getId_barang()); %>">
			<img src="<%out.print(olahraga.get(x).getGambar_barang());%>" /></a>
			<p class="product_price">
				Harga : Rp <% out.print(olahraga.get(x).getHarga_barang()); %><br> 
				Stok : <% out.print(olahraga.get(x).getStok()); %> <br>
			<form name="beli" action="addcart" method="post">
				<input type="hidden" name="id_barang"
					value="<% out.print(olahraga.get(x).getId_barang()); %>"> 
					<input type="hidden" name="request_tambahan" value="-"> Quantity 
					<input type="number" min="1" max="10" value=1 name="qt" style="width: 60px; text-align: right" /> 
					<input type="submit" value="Add to cart">
			</form>
			</p>
		</div>
	<% } %>
<% } %>
</div>

