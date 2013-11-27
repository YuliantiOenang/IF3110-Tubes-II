<%@ include file="header.jsp" %>
		<script src="AJAXaddtocart.js"></script>
		<script>
			if (localStorage.user=="admin") {
				window.location = "indexadmin.jsp"
			}
		</script>
		<link rel="stylesheet" href="layout.css">
	</head>
<%@ include file="middle.jsp" %>
		<div id="container-left">
		<div id="container">
		<h2><%= request.getParameter("nama").substring(0,1).toUpperCase()+request.getParameter("nama").substring(1) %></h2>
		<%
			out.print("<img src=\"/tubes2/images/"+request.getParameter("nama")+".jpg\" alt='gambar' width='400' height='300'><br>");
			out.print("Nama: "+request.getParameter("nama")+"<br>");
		%>
		<% String deskripsi = "/deskripsi//"+request.getParameter("nama")+".txt"; %>
		<jsp:include page="<%=deskripsi%>"/>
		<%
			out.print( "<br><br>Harga: "+request.getParameter("harga")+"<br>");
			out.print( "Banyak: <input type='text' name='qty' id='"+request.getParameter("nama")+"'><br>");
			out.print( "Catatan: <input type='text'><br>");
			out.print( "<button type='button' onclick='AJAXaddtocart(\""+request.getParameter("nama")+"\")'>Add to cart</button><br><br>");
		%>
		</div>
		</div>
	</body>
</html>