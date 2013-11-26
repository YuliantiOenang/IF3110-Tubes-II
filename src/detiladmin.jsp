<%@ include file="header.jsp" %>
		<script src="AJAXaddtocart.js"></script>
		<link rel="stylesheet" href="layout.css">
	</head>
<%@ include file="middleadmin.jsp" %>
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
			
		%>
		</div>
		</div>
	</body>
</html>