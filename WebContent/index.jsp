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
<link rel='stylesheet' type='text/css' href="${pageContext.request.contextPath}/css/style.css" />
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
			//---- WELCOME PROCESS ----\\
				var n = 0;
				var m = 1;
				// WELCOME FADE IN
				for (x=0;x<=20;x++){
					setTimeout(function(){
						document.getElementById('starter').style.opacity = 0.05*n;
						n++;
					}, ((50*(m+1))));
				m++;
				}
				// WELCOME FADE OUT
				m=0;
				for (x=0;x<=21;x++){
					setTimeout(function(){
						document.getElementById('starter').style.opacity = (0.05*n);
						n--;
					}, (3000+(50*(m+1))));
				m++;
				}
			//---- PREFACE PROCESS ----\\
			var b = 0;
			var a = 1;
				// PREFACE FADE IN
				for (x=0;x<=20;x++){
					setTimeout(function(){
						document.getElementById('starter2').style.opacity = 0.05*b;
						b++;
					}, (4000+(50*(a+1))));
				a++;
				}
				// PREFACE FADE OUT
				a=0;
				for (x=0;x<=21;x++){
					setTimeout(function(){
						document.getElementById('starter2').style.opacity = (0.05*b);
						b--;
					}, (10000+(50*(a+1))));
				a++;
				}
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
		@SuppressWarnings("unchecked")
		ArrayList<KategoriBean> kategoriBean = (ArrayList<KategoriBean>) request
				.getAttribute("items");
	%>
	<%
		if (kategoriBean == null)
			kategoriBean = new ArrayList<KategoriBean>();
	%>
	<jsp:include page="layout.jsp" />
	<div id='content_frame' name='page'>
	<script>fadein();</script>
	
	<!-- Added by @freedomofkeima -->
	<% for (int i = 0; i < kategoriBean.size(); i++) { %>
		<% ArrayList<BarangBean> barangBean = kategoriBean.get(i).getItemList(); %>
		<% if (i == 0) { %>
			<div onmouseover='setRun(false, <%= kategoriBean.get(i).getId() %>)' onmouseout='setRun(true, <%= kategoriBean.get(i).getId() %>)' class='home_categori' id='cont<%= kategoriBean.get(i).getId()%>'>
		<% } else { %>
			<div onmouseover='setRun(false, <%= kategoriBean.get(i).getId() %>)' onmouseout='setRun(true, <%= kategoriBean.get(i).getId() %>)' class='home_categori hidden' id='cont<%= kategoriBean.get(i).getId()%>'>
		<% } %>
		</div>
		<h1 class='header'><%= kategoriBean.get(i).getName() %></h1>
		<div class='triplebest'>
		<% for (int j = 0; j < 4; j++) { %>
			<a href='./barang/detail?id=<%= barangBean.get(j).getId() %>'>
				<div class='best'>
					<img title='<%= barangBean.get(j).getName() %> (IDR <%= barangBean.get(j).getPrice() %>)' onload='fitBest(this)' src='./img/barang/<%= barangBean.get(j).getPicture() %>' />
				</div>
			</a>
		<% } %>
		</div>
	<% } %>
	
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
		
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>