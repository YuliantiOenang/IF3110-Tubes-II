<%@page import="bean.Barang"%>
<jsp:include page="header.jsp" />
<% Barang br = (Barang) request.getAttribute("selected"); %>

<h1><% out.print(br.getNama_barang()); %></h1><br>';
	<% 
		out.println("<img src='"+br.getGambar_barang()+"' width='300px' height='300px'/><br>");
		out.println("<br><h2>Deskripsi : </h2><p>"+br.getKeterangan()+"</p><br>");
		out.println("Request tambahan   : <br>");
	%>
	<form action="addcart" method="post" id="usrform">
		<textarea rows="4" cols="50"  name="request_tambahan" form="usrform"></textarea><br>
		<input type="hidden" 		  name="id_barang" value="'.$idbarang.'">
		Quantity : <input type="text" name="qt" style="width: 20px; text-align: right" /><br>
	<input type="submit" value="Add to cart">
	</form>
	<br>';

<jsp:include page="footer.jsp" />