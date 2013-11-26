<%@page import="bean.Barang"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="header.jsp" />
<%
	ArrayList<Barang> barang = (ArrayList<Barang>) request
			.getAttribute("barang");
	int pages = Integer.parseInt(request.getParameter("page"));
	String id = request.getParameter("id");
	String order = request.getParameter("order");
	int n_item = 30;
%>
<div id="content" class="float_l">
	<%
		for (int i = 0; i < barang.size(); i++) {
	%>
	<div class="product_box">
		<h3>
			<%
				out.println(barang.get(i).getNama_barang());
			%>
		</h3>
		<a href="detail?id= <%out.print(barang.get(i).getId_barang());%>">
			<img src="<%out.print(barang.get(i).getGambar_barang());%>" />
		</a>
		<p class="product_price">
			Harga : Rp
			<%
			out.print(barang.get(i).getHarga_barang());
		%><br> Stok :
			<%
			out.print(barang.get(i).getStok());
		%>
			<br>
		<form name="beli" action="#" method="post">
			<input type="hidden" name="id_barang"
				value="<%out.print(barang.get(i).getId_barang());%>"> <input
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
		if (pages == 1) { 
			out.println("<li> <a href='kategori?id="+id+"&page="+(pages+1)+"&order="+order+"'>Berikutnya>>></a></li><br>");
			for (int x=1;x<=n_item/10;x++) {
				out.println("<li> <a href='kategori?id="+id+"&page="+x+"&order="+order+"'>"+x+"</a></li><br>");
			}
		} else if (pages >= n_item/10) {
			out.println("<li> <a href='kategori?id="+id+"&page="+(pages-1)+"&order="+order+"'><<<Sebelumnya</a></li><br>");
			for (int x=1;x<=n_item/10;x++) {
				out.println("<li> <a href='kategori?id="+id+"&page="+x+"&order="+order+"'>"+x+"</a></li><br>");
			}
		} else {
			out.println("<li> <a href='kategori?id="+id+"&page="+(pages+1)+"&order="+order+"'>Berikutnya>>></a></li><br>");
			for (int x=1;x<=n_item/10;x++) {
				out.println("<li> <a href='kategori?id="+id+"&page="+x+"&order="+order+"'>"+x+"</a></li><br>");
			}
			out.println("<li> <a href='kategori?id="+id+"&page="+(pages-1)+"&order="+order+"'><<<Sebelumnya</a></li><br>");
		}
		out.println("<p> Sort By : </p>");
		out.println("<li> <a href='kategori?id="+id+"&page=1&order=nama_barang'>Nama Barang</a></li><br>");
		out.println("<li> <a href='kategori?id="+id+"&page=1&order=harga_barang'>Harga Barang</a></li><br>");
	%>

</div>
<jsp:include page="footer.jsp" />