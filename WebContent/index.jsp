<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.frexesc.model.BarangBean"%>
<%@ page import="com.frexesc.model.KategoriBean"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css'
	href="${pageContext.request.contextPath}/css/style.css" />
<script>
		function RefreshCartandShow(){
			//REFRESH CART
				var obj = document.getElementById('cart_frame');
				obj.src=obj.src;
			//SHOW
				if (document.getElementById('content_frame').style.opacity<1){
					// CONTENT FADE IN
					var n = 10;
					var m = 1;
					for (x=0;x<=11;x++){
						setTimeout(function(){
							document.getElementById('content_frame').style.opacity = 0.1*n;
							n++;
						}, (500+(50*(m+1))));
					m++;
					}
					// LOGO FADE OUT
					var o = 0;
					var p = 1;
					for (x=0;x<=11;x++){
						setTimeout(function(){
							document.getElementById('trans').style.opacity = (0.1*p);
							p--;
						}, (400+(50*(o+1))));
						o++;
					}
				}
		}
		
		function fadein(){
			// CONTENT FADE IN
			var o = 0;
			var p = 1;
			for (x=0;x<=20;x++){
				setTimeout(function(){
					document.getElementById('content').style.opacity = (0.05*p);
					p++;
				}, (12000+(50*(o+1))));
			o++;
			}
		}
		
		function transition(link){
			var n = 10;
			var m = 1;
			// CONTENT FADE OUT
			for (x=0;x<=10;x++){
				setTimeout(function(){
					document.getElementById('content_frame').style.opacity = 0.1*n;
					n--;
				}, (50*(m+1)));
			m++;
			}
			// LOGO FADE IN
			var o = 0;
			var p = 1;
			for (x=0;x<=10;x++){
				setTimeout(function(){
					document.getElementById('trans').style.opacity = (0.1*p);
					p++;
				}, (300+(50*(o+1))));
				o++;
			}
			//CHANGE LINK
				setTimeout(function(){
					document.getElementById('content_frame').src=link;
				}, 2000);
		}
</script>

</head>
<body>
	<!-- notes: layout on progress -->
	<%
		if (request.getAttribute("login") != null) {
	%>
			<script>alert("Login failed!")</script>
	<%
		}
	%>
	<%
		@SuppressWarnings("unchecked")
			ArrayList<KategoriBean> kategoriBean = (ArrayList<KategoriBean>) request
			.getAttribute("items");
	%>
	<%
		if (kategoriBean == null)
		kategoriBean = new ArrayList<KategoriBean>();
	%>
	<jsp:include page="layout.jsp" />
	<!--  	<div class='background' id='content'>-->
	<div id='content_frame' name='page' onLoad="RefreshCartandShow()">

		<%
			boolean effect = true; 
				if (effect) {
		%>
		<script>fadein();</script>
		<%
			}
		%>
		<!-- Added by @freedomofkeima -->
		<%
			for (int i = 0; i < kategoriBean.size(); i++) {
		%>
		<%
			ArrayList<BarangBean> barangBean = kategoriBean.get(i).getItemList();
		%>
		<%
			if (i == 0) {
		%>
		<div onmouseover='setRun(false, <%=kategoriBean.get(i).getId()%>)'
			onmouseout='setRun(true, <%=kategoriBean.get(i).getId()%>)'
			class='home_categori' id='cont<%=kategoriBean.get(i).getId()%>'>
			<%
				} else {
			%>
			<div onmouseover='setRun(false, <%=kategoriBean.get(i).getId()%>)'
				onmouseout='setRun(true, <%=kategoriBean.get(i).getId()%>)'
				class='home_categori hidden'
				id='cont<%=kategoriBean.get(i).getId()%>'>
				<%
					}
				%>
				<h1 class='header'><%=kategoriBean.get(i).getName()%></h1>
				<div class='triplebest'>
					<%
						for (int j = 0; j < 4; j++) {
					%>
					<a href='./barang/detail?id=<%=barangBean.get(j).getId()%>'>
						<div class='best'>
							<img
								title='<%=barangBean.get(j).getName()%> (IDR <%=barangBean.get(j).getPrice()%>)'
								onload='fitBest(this)'
								src='./img/barang/<%=barangBean.get(j).getPicture()%>' />
						</div>
					</a>
					<%
						}
					%>
				</div>
				<%
					}
				%>
			</div>
		</div>

		<!--  	foreach ($model as $key => $value) {
		echo "	<div onmouseover='setRun(false,".$key.")' onmouseout='setRun(true,".$key.")' class='home_categori ";
		if ($key!=1) echo "hidden";
		echo "' id='cont".$key."'>
					<h1 class='header'>".$value['kat_data']->nama_kategori."<h1>
					<div class='triplebest'>";
		for ($i=0; $i < 4; $i++) 
			echo "<a href='".$this->getBaseUrl()."/barang/view/".$value[$i]->id."''><div class='best'><img title='".$value[$i]->nama." (IDR ".$this->toCurrency($value[$i]->harga).")' onload='fitBest(this)' src='".$this->getBaseUrl()."/img/barang/".$value[$i]->gambar."'/></div></a>";
		echo "		</div>
				</div>";
	}
-->


		<jsp:include page="footer.jsp" />
</body>
</html>

<script type="text/javascript">
	function fitBest(obj) {
		fitimg(obj,220,150,true,true,false);
	}
</script>

<script type="text/javascript">
function showCategory() {
	var n = 1;
	while (document.querySelectorAll('#cont'+n).length) {
		if (!document.querySelectorAll('#cont'+n+'.hidden').length) return n;
		n++;
	}
	return 0;
}

var show = showCategory();
var items = document.querySelectorAll('.home_categori').length;
var run = true;
function setRun(isrun,id) {
	if (id==show) {
		run = isrun;
		console.log('setRun by '+id+' -> '+isrun);
	}
}

setTimeout(function(){
 		effect();
 	}, 5000);

function effect() {
	if (run) {
		var x,y,vara,varb,varc,vard;
		vara = 0;
		varb = 0;
		console.log('hide : '+show);
		for (x=0;x<=11;x++){
			setTimeout(function(){
				document.getElementById('cont'+show).style.opacity = 1-(0.1*vara);
				if (vara==10) addClass(document.getElementById('cont'+show), " hidden");
				vara++;
			}, (30*(varb+1)));
			varb++;
		}
		setTimeout(function(){
			if (show<items) {
				show++;
			}
			else {
				show=1;
			}
			console.log('show : '+show);
			varc = 0;
			vard = 0;
			for (y=0;y<=11;y++){
				setTimeout(function(){
					if (varc==0) removeClass(document.getElementById('cont'+show), "hidden");
					document.getElementById('cont'+show).style.opacity = 0.1*varc;
					varc++;
				}, ((30*(vard+1))));
				vard++;
			}
		},400);
	}
	setTimeout(function(){
 		effect();
 	}, 5000);
}
</script>
