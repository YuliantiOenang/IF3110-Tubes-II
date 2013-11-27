<%@page import="model.Model"%>
<%@page import="org.apache.catalina.connector.Request"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Browse</title>
</head>
<body>
	<% 
	String q = (String)request.getAttribute("q");
	String sort = (String)request.getAttribute("sort");
	String hal = (String)request.getAttribute("hal");
	String kat = (String)request.getAttribute("kat");
	String h1 = (String)request.getAttribute("h1");
	String h2 = (String)request.getAttribute("h2");
	Barang modelb = new Barang();
	modelb = (Barang)request.getAttribute("model");
	HashMap<String,String> query = new HashMap<String,String>();
	query.put("q",q); query.put("sort",sort); query.put("hal",hal); query.put("kat",kat); query.put("h1",h1); query.put("h2",h2);
	
	
	%>

<script type="text/javascript">
	var run = false;
	function fitbarang(obj) {
		fitimg(obj,180,175,true,true,false);
	}
	function backToPict(id) {
		if (!run) {
			var x,y,vara,varb,varc,vard;
			vara = 0;
			varb = 0;
			for (x=0;x<=11;x++){
				setTimeout(function(){
					if (x==0) run=true;
					document.getElementById('cart'+id).style.opacity = 1-(0.1*vara);
					if (vara==10) addClass(document.getElementById('cart'+id), " hidden");
					vara++;
					console.log(x+' : cart'+id);
				}, (50*(varb+1)));
				varb++;
			}
			setTimeout(function(){
				varc = 0;
				vard = 0;
				for (y=0;y<=11;y++){
					setTimeout(function(){
						if (varc==0) removeClass(document.getElementById('item'+id), "hidden");
						document.getElementById('item'+id).style.opacity = 0.1*varc;
						varc++;
						console.log(y+' : item'+id);
						if (varc==11) run=false;
					}, (120+(50*(vard+1))));
					vard++;
				}
			},600);
		}
	}
	function goToCart(id) {
		if (!run) {
			var x,y,vara,varb,varc,vard;
			vara = 0;
			varb = 0;
			for (x=0;x<=11;x++){
				setTimeout(function(){
					if (vara==0) run=true;
					document.getElementById('item'+id).style.opacity = 1-(0.1*vara);
					if (vara==10) addClass(document.getElementById('item'+id), " hidden");
					vara++;
					console.log(x+' : item'+id);
				}, (50*(varb+1)));
				varb++;
			}
			setTimeout(function(){
				varc = 0;
				vard = 0;
				for (y=0;y<=11;y++){
					setTimeout(function(){
						if (varc==0) removeClass(document.getElementById('cart'+id), "hidden");
						document.getElementById('cart'+id).style.opacity = 0.1*varc;
						varc++;
						console.log(y+' : cart'+id);
						if (varc==11) run=false;
					}, (120+(50*(vard+1))));
					vard++;
				}
			},600);
		}
	}
</script>


<div class='header_divider'>
	<h1 class='header'><%request.getAttribute("title"); %></h1>
</div>
<div class='header_divider'>
	<div class="sorting">
		Urutan : 
		<%
			query.put("sort", "sort=nama asc");
			if(!query.get("sort").equals(null) && query.get("sort").equals("nama asc"))
			{
				query.put("sort", "sort=nama desc");
			}
		%>
		<a href="?<%= StringUtils.join(query,"&") %>" class="btn small">Nama</a> 
		<%
			query.put("sort", "sort=harga asc");
			if(!query.get("sort").equals(null) && query.get("sort").equals("harga asc"))
			{
				query.put("sort", "sort=harga desc");
			}
		%>
		<a href="?<%= StringUtils.join(query,"&") %>" class="btn small">Harga</a>
	</div>
	<div class="pagination"><%request.getAttribute("paging"); %></div>
</div>

	<%
		
		modelb.formatAllCurrency();
		for (HashMap<String, String> value : modelb.getDataVector())
		{
			if (value.)
			
			if (i==0 || i%2==0){
				out.print("<div class='vertdiv'>");
			}
			out.print("<div class='itembox'> <div class='pict' id='item"+model.elementAt(i).get(id)+"'> <div title='");
			if (model.elementAt(i).get(stok)>0) out.print("Ready Stock"); else out.print("Out of Stock");
			out.print("' class='itembox_img'>");
			out.print("<img onload='fitbarang(this)' src='"+request.getContextPath()+"/img/barang/"+Model.elementAt(i).get(gambar)+"'/>");
			out.print("</div>");
			out.print("<div class='minicart_icon'>");
			out.print("<a href=# onclick='goToCart("+Model.elementAt(i).get(id)+")'><img src='"+request.getContextPath()+"/img/site/cart_black.png'/></a>");
			out.print("</div>");
			out.print("<div class='item_name'><a href='"+${pageContext.request.contextPath}+"/barang/"+Model.elementAt(i).get(id)+"'>"+Model.elementAt(i).get(nama)+"</a><br/>IDR "+Model."</div>
			out.print("</div>");
			out.print("<div class='minicart hidden' id='cart".$value->id."'>
			out.print("<form action = "+${pageContext.request.contextPath}+"barang/update"+" id='form-shop-".$value->id."' method='post' onsubmit='cekQuantity(".$value->id."); return false;'>");
								<label class='qty small'>Quantity</label>
								<input type='number' name='quantity' id='quantity_".$value->id."' class='qty' value=1></input>
								<input type='hidden' name='id_barang' id='id_barang_".$value->id."' value='".$value->id."'>
								<p>Request Message :</p>
								<textarea class='req_msg small' name='req_msg'></textarea>
								<input type='submit' class='cart small' value = 'Add to Cart'></input>
								<p class='back' href=# onclick='backToPict(".$value->id.")'>back</p>
							</form>
						</div>
					</div>";
			// VERTICAL DIV CLOSER
			if (($key%2)==1||($key==(count($model)-1))||($key==9))echo "</div>";
		}
	%>

<script src="<?php echo $this->getBaseUrl() ?>/js/validasiBarang.js"></script>
<script>
	var server = "<?php echo $this->getBaseUrl() ?>";
</script>
	
</body>
</html>