<%@page import="bean.Barang"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="header.jsp" />
<%
	ArrayList<Barang> res = (ArrayList<Barang>) request.getAttribute("search_result");
	int pages = Integer.parseInt(request.getParameter("page"));
	String nama_barang = request.getParameter("nama_barang");
	String kategori = request.getParameter("kategori");
	String harga = request.getParameter("harga");
	String order = request.getParameter("order");
	int n_item = Integer.parseInt(request.getAttribute("n_item").toString());
%>
<div id="content" class="float_l">
	<%
		for (int i = 0; i < res.size(); i++) {
	%>
	<div class="product_box">
		<h3>
			<%
				out.println(res.get(i).getNama_barang());
			%>
		</h3>
		<a href="detail?id= <%out.print(res.get(i).getId_barang());%>">
			<img src="<%out.print(res.get(i).getGambar_barang());%>" />
		</a>
		<p class="product_price">
			Harga : Rp
			<%
			out.print(res.get(i).getHarga_barang());
		%><br> Stok :
			<%
			out.print(res.get(i).getStok());
		%>
			<br>
		<form name="beli" action="#" method="post">
			<input type="hidden" name="id_barang"
				value="<%out.print(res.get(i).getId_barang());%>"> <input
				type="hidden" name="request_tambahan" value="-"> Quantity <input
				type="text" name="qt" style="width: 20px; text-align: right" /> <input
				type="submit" value="Add to cart">
		</form>
		</p>
	</div>
	<%
		}
	%>

	<%
		if(n_item > 10) {
			if (pages == 1) { 
				out.println("<li> <a href='search?page="+(pages+1)+"&nama_barang="+nama_barang+"&harga="+harga+
						    "&kategori="+kategori+"&order="+order+"'>Berikutnya>>></a></li><br>");
				for (int x=1;x<=n_item/10;x++) {
					out.println("<li> <a href='search?page="+x+"&nama_barang="+nama_barang+"&harga="+harga+
						        "&kategori="+kategori+"&order="+order+"'>"+x+"</a></li><br>");
				}
			} else if (pages >= n_item/10) {
				out.println("<li> <a href='search?page="+(pages-1)+"&nama_barang="+nama_barang+"&harga="+harga+
					        "&kategori="+kategori+"&order="+order+"'><<<Sebelumnya</a></li><br>");
				for (int x=1;x<=n_item/10;x++) {
					out.println("<li> <a href='search?page="+x+"&nama_barang="+nama_barang+"&harga="+harga+
					        "&kategori="+kategori+"&order="+order+"'>"+x+"</a></li><br>");
				}
			} else {
				out.println("<li> <a href='search?page="+(pages+1)+"&nama_barang="+nama_barang+"&harga="+harga+
					    "&kategori="+kategori+"&order="+order+"'>Berikutnya>>></a></li><br>");
				for (int x=1;x<=n_item/10;x++) {
					out.println("<li> <a href='search?page="+x+"&nama_barang="+nama_barang+"&harga="+harga+
						        "&kategori="+kategori+"&order="+order+"'>"+x+"</a></li><br>");
				}
				out.println("<li> <a href='search?page="+(pages-1)+"&nama_barang="+nama_barang+"&harga="+harga+
				        "&kategori="+kategori+"&order="+order+"'><<<Sebelumnya</a></li><br>");
			}
			out.println("<p> Sort By : </p>");
			out.println("<li> <a href='search?page=1&nama_barang="+nama_barang+"&harga="+harga+"&kategori="+kategori+"&order=nama_barang'>Nama Barang</a></li><br>");
			out.println("<li> <a href='search?page=1&nama_barang="+nama_barang+"&harga="+harga+"&kategori="+kategori+"&order=harga_barang'>Harga Barang</a></li><br>");
		}
	%>

</div>
<jsp:include page="footer.jsp" />