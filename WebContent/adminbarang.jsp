<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head><title>Edit Barang</title>
<link rel="stylesheet" href="css/adminbarang.css" type="text/css" />
<script>
	function submitdelete(form){
		form.submit();
	}
</script>
</head>
<div class="index">
<body>
<%@ include file="header.jsp" %>
<article id="featured" class="body">
	<%
	String kategori;
	String sort;
	if(request.getParameter("sort")!=null){
		sort = request.getParameter("sort");
	}else{
		sort = "nama";
	}
    out.println("<form name='check' action='admin' method='POST' target='_blank'>");
	if(request.getParameter("kategori")!=null){
		kategori = request.getParameter("kategori");
		out.println("<h3>Edit Barang - "+kategori+"</h3><hr>");
		out.println("<div class='headertools'>");
			out.println("<input type='image' src=images/Edit.jpg id='edit' onClick=''>");
			out.println("<input type='image' src=images/Plus.png id='add' onClick=''>");
			out.println("<input type='image' src=images/Delete.png id='delete' onClick='submitdelete(document.forms['check'])'>");
		out.println("</div>");	
		out.println("<div id='sort'>Sort by <a href='halamanbarang.jsp?kategori="+kategori+"&sort=nama'>Name</a> | <a href='halamanbarang.php?kategori="+kategori+"&sort=harga'>Harga</a></div>");
	}else{
		kategori = null;
		out.println("<h3>Edit Barang</h3><hr>");
		out.println("<div class='headertools'>");
			out.println("<input type='image' src=images/Edit.jpg id='edit' onClick=''>");
			out.println("<input type='image' src=images/Plus.png id='add' onClick=''>");
			out.println("<input type='image' src=images/Delete.png id='delete' onClick='submitdelete(document.forms['check'])'>");
		out.println("</div>");	
		out.println("<div id='sort'>Sort by <a href='halamanbarang.jsp?sort=nama'>Name</a> | <a href='halamanbarang.php?sort=harga'>Harga</a></div>");
	}
    out.println("</form>");
	%>
	<center id="indikator"></center>
</article>
<%@ include file="footer.jsp" %>
<!-- Paginasi halaman dengan auto-generated content -->
<script>	
	var currentpage = 0;
	function getcontent(pages){
		currentpage = pages;
		var xmlhttp;
		if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}else{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function(){
			if (xmlhttp.readyState==4 && xmlhttp.status==200){
				document.getElementById("featured").innerHTML+=xmlhttp.responseText;
				document.getElementById("featured").removeChild(document.getElementById("indikator"));
				var loader = document.createElement("center");
				loader.setAttribute("id", "indikator");
				document.getElementById("featured").appendChild(loader);
			}else{
				var loader ="<img src='images/loader.gif'><p>Memuat barang-barang yang lain...</p>";
				document.getElementById("indikator").innerHTML = loader;
			}
		}
		<% 
		if(request.getParameter("kategori")!=null){
			out.println("xmlhttp.open('GET','ajaxadminbarang?page='+pages+'&kategori="+kategori+"&sort="+sort+"',true);");
		}else{
			out.println("xmlhttp.open('GET','ajaxadminbarang?page='+pages+'&sort="+sort+"',true);");
		}
		%>
		xmlhttp.send();
	}
	window.onscroll = function() {
		if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
			//if(currentpage<maxpage){
				currentpage++;
				getcontent(currentpage);
			//}
		}
	};
	getcontent(1);
</script>
</div>
</body>
</html>