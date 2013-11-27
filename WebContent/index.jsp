<jsp:include page="contentBegin.jsp"></jsp:include>

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
<!-- <?php if (isset($effect)&&$effect) {?> -->
	<script>fadein();</script>
<!-- <?php } ?>	-->
	<div onmouseover='setRun(false,1)' onmouseout='setRun(true,1)' class='home_categori' id='cont1'>
		<h1 class='header'>KATEGORI1</h1>
		<div class='triplebest'>
			 <a href='${pageContext.request.contextPath}/barang/view/1'>
			 	<div class='best'><img title='Barang (IDR HARGA)' onload='fitBest(this)' src='${pageContext.request.contextPath}/img/barang/1.jpg'/></div>
			 </a>
			 <a href='${pageContext.request.contextPath}/barang/view/1'>
			 	<div class='best'><img title='Barang (IDR HARGA)' onload='fitBest(this)' src='${pageContext.request.contextPath}/img/barang/1.jpg'/></div>
			 </a>
			 <a href='${pageContext.request.contextPath}/barang/view/1'>
			 	<div class='best'><img title='Barang (IDR HARGA)' onload='fitBest(this)' src='${pageContext.request.contextPath}/img/barang/1.jpg'/></div>
			 </a>
			 <a href='${pageContext.request.contextPath}/barang/view/1'>
			 	<div class='best'><img title='Barang (IDR HARGA)' onload='fitBest(this)' src='${pageContext.request.contextPath}/img/barang/1.jpg'/></div>
			 </a>
		</div>
	</div>
	<div onmouseover='setRun(false,2)' onmouseout='setRun(true,2)' class='home_categori hidden' id='cont2'>
		<h1 class='header'>KATEGORI1</h1>
		<div class='triplebest'>
			 <a href='${pageContext.request.contextPath}/barang/view/1'>
			 	<div class='best'><img title='Barang (IDR HARGA)' onload='fitBest(this)' src='${pageContext.request.contextPath}/img/barang/1.jpg'/></div>
			 </a>
			 <a href='${pageContext.request.contextPath}/barang/view/1'>
			 	<div class='best'><img title='Barang (IDR HARGA)' onload='fitBest(this)' src='${pageContext.request.contextPath}/img/barang/1.jpg'/></div>
			 </a>
			 <a href='${pageContext.request.contextPath}/barang/view/1'>
			 	<div class='best'><img title='Barang (IDR HARGA)' onload='fitBest(this)' src='${pageContext.request.contextPath}/img/barang/1.jpg'/></div>
			 </a>
			 <a href='${pageContext.request.contextPath}/barang/view/1'>
			 	<div class='best'><img title='Barang (IDR HARGA)' onload='fitBest(this)' src='${pageContext.request.contextPath}/img/barang/1.jpg'/></div>
			 </a>
		</div>
	</div>
	<div onmouseover='setRun(false,3)' onmouseout='setRun(true,3)' class='home_categori hidden' id='cont3'>
		<h1 class='header'>KATEGORI1</h1>
		<div class='triplebest'>
			 <a href='${pageContext.request.contextPath}/barang/view/1'>
			 	<div class='best'><img title='Barang (IDR HARGA)' onload='fitBest(this)' src='${pageContext.request.contextPath}/img/barang/1.jpg'/></div>
			 </a>
			 <a href='${pageContext.request.contextPath}/barang/view/1'>
			 	<div class='best'><img title='Barang (IDR HARGA)' onload='fitBest(this)' src='${pageContext.request.contextPath}/img/barang/1.jpg'/></div>
			 </a>
			 <a href='${pageContext.request.contextPath}/barang/view/1'>
			 	<div class='best'><img title='Barang (IDR HARGA)' onload='fitBest(this)' src='${pageContext.request.contextPath}/img/barang/1.jpg'/></div>
			 </a>
			 <a href='${pageContext.request.contextPath}/barang/view/1'>
			 	<div class='best'><img title='Barang (IDR HARGA)' onload='fitBest(this)' src='${pageContext.request.contextPath}/img/barang/1.jpg'/></div>
			 </a>
		</div>
	</div>
	<div onmouseover='setRun(false,4)' onmouseout='setRun(true,4)' class='home_categori hidden' id='cont4'>
		<h1 class='header'>KATEGORI1</h1>
		<div class='triplebest'>
			 <a href='${pageContext.request.contextPath}/barang/view/1'>
			 	<div class='best'><img title='Barang (IDR HARGA)' onload='fitBest(this)' src='${pageContext.request.contextPath}/img/barang/1.jpg'/></div>
			 </a>
			 <a href='${pageContext.request.contextPath}/barang/view/1'>
			 	<div class='best'><img title='Barang (IDR HARGA)' onload='fitBest(this)' src='${pageContext.request.contextPath}/img/barang/1.jpg'/></div>
			 </a>
			 <a href='${pageContext.request.contextPath}/barang/view/1'>
			 	<div class='best'><img title='Barang (IDR HARGA)' onload='fitBest(this)' src='${pageContext.request.contextPath}/img/barang/1.jpg'/></div>
			 </a>
			 <a href='${pageContext.request.contextPath}/barang/view/1'>
			 	<div class='best'><img title='Barang (IDR HARGA)' onload='fitBest(this)' src='${pageContext.request.contextPath}/img/barang/1.jpg'/></div>
			 </a>
		</div>
	</div>

<!-- 
<?php
	foreach ($model as $key => $value) {
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
?>
-->
	<div class='howto'>
		<h4>
			how to get our product?
		</h4>
		<ol>
			<li>Before you get transaction with us, you must register as member.</li>
			<li>Browse our product by category or search it.</li>
			<li>Click add to cart if you want to buy our product.</li>
			<li>Check out and give us your credit card data</li>
			<li>Submit and wait us in front your home :)</li>
		</ol>
		<img src='${pageContext.request.contextPath}/img/site/howto.jpg'/>
		<img src='${pageContext.request.contextPath}/img/site/store.jpg'/>
	</div>
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

<jsp:include page="contentEnd.jsp"></jsp:include>