<%@page import="bean.Barang"%>
<%@page import="java.util.ArrayList"%>

<% ArrayList<Barang> barang = (ArrayList<Barang>) request.getAttribute("barang");
	
%>
<div id="content" class="float_l">
	<% for(int i=0;i<barang.size();i++) { %>
		<div class="product_box">
			<h3><% out.println(barang.get(i).getNama_barang()); %></h3>
			<a href="detail.jsp?id= <% out.print(barang.get(i).getId_barang()); %>">
			<img src="<% out.print(barang.get(i).getGambar_barang()); %>" /></a>
			<p class="product_price">
				Harga : Rp <% out.print(barang.get(i).getHarga_barang()); %><br> 
				Stok : <% out.print(barang.get(i).getStok()); %> <br>
			<form name="beli" action="#" method="post">
				<input type="hidden" name="id_barang"
					value="<% out.print(barang.get(i).getId_barang()); %>"> 
					<input type="hidden" name="request_tambahan" value="-"> Quantity 
					<input type="text" name="qt" style="width: 20px; text-align: right" /> 
					<input type="submit" value="Add to cart">
			</form>
			</p>
		</div>
	<% } %>
</div>
<jsp:include page="footer.jsp" />