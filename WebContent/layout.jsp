<!DOCTYPE html>
<html>
<head>
	<title>layout</title>
	<link rel='stylesheet' type='text/css' href="${pageContext.request.contextPath}/css/style.css" />
	<script type="text/javascript">
		function hasClass(ele,cls) {
			return ele.className.match(new RegExp('(\\s|^)'+cls+'(\\s|$)'));
		}
		 
		function addClass(ele,cls) {
			if (!this.hasClass(ele,cls)) ele.className += " "+cls;
		}
		 
		function removeClass(ele,cls) {
			if (hasClass(ele,cls)) {
			var reg = new RegExp('(\\s|^)'+cls+'(\\s|$)');
			ele.className=ele.className.replace(reg,' ');
			}
		}
		function fitimg(obj,width,height,xfit,yfit,overlay)
		{
			var objheight = obj.offsetHeight;
			var objwidth = obj.offsetWidth;
			var screen = objheight/objwidth;
			var fit = height/width;
			if (Math.abs(screen-fit)<=0.1) {
				obj.width = width;
				obj.height = height;
			}
			else if (((screen<fit)&&overlay)||((screen>fit)&&!overlay)){
					obj.height = height;
					if (xfit) {
						obj.width = ((height*1.0)/(screen*1.0));
						obj.style.marginLeft = (((1.0*width)-((1.0*height)/(1.0*screen)))/2).toString()+"px";
					}
					else {
						obj.width = width;
					}
				}
			else {
					obj.width = width;
					if (yfit) {
						obj.height = (width*screen);
						obj.style.marginTop = ((height-(width*screen))/2).toString()+"px";
					}
					else {
						obj.height = height;
					}
			}
		}
		function showLogin() {
			document.getElementById('login_cont').style.opacity = 0;
			document.getElementById('login_cont').style.top = "0px";
			document.getElementById('login_username').focus();
			var x,aa,bb;
			aa = 0;
			bb = 0;
			for (x=0;x<=11;x++){
				setTimeout(function(){
					document.getElementById('login_cont').style.opacity = 0.1*aa;
					aa++;
				}, (50*(bb+1)));
				bb++;
			}
		}
		function hideLogin() {
			document.getElementById('login_cont').style.opacity = 1;
			var x,aa,bb;
			aa = 0;
			bb = 0;
			for (x=0;x<=11;x++){
				setTimeout(function(){
					document.getElementById('login_cont').style.opacity = 1-(0.1*aa);
					if (aa>=10) document.getElementById('login_cont').style.top = "-100%";
					aa++;
				}, (50*(bb+1)));
				bb++;
			}
		}
	</script>
</head>
<body>
<!-- for first animation -->
	
	<div class='conctr'>
			<div class='head'>
			<a href='/index/home'><div class='logo'></div></a>
			
			<div class='menu'>

						<a href=''><div class='permenu per5'>
							<div class='menuborder'></div>
							<div class='menutxt'><h1 id='txtmenu1' class='menu'>Ladies Dress</h1></div>
							<div class='menuborder'></div>
							</div>
						</a>
						<a href=''><div class='permenu per5'>
							<div class='menuborder'></div>
							<div class='menutxt'><h1 id='txtmenu1' class='menu'>Ladies Shoes</h1></div>
							<div class='menuborder'></div>
							</div>
						</a>
						
						<a href=''><div class='permenu per5'>
							<div class='menuborder'></div>
							<div class='menutxt'><h1 id='txtmenu1' class='menu'>Man Shirt</h1></div>
							<div class='menuborder'></div>
							</div>
						</a>
						
						<a href=''><div class='permenu per5'>
							<div class='menuborder'></div>
							<div class='menutxt'><h1 id='txtmenu1' class='menu'>Man Shoes</h1></div>
							<div class='menuborder'></div>
							</div>
						</a>
						
						<a href=''><div class='permenu per5'>
							<div class='menuborder'></div>
							<div class='menutxt'><h1 id='txtmenu1' class='menu'>Man Hat</h1></div>
							<div class='menuborder'></div>
							</div>
						</a>
						
			</div>
			
			<div class='status'>
					
					<!-- <p class="left"> welcome, <a href=''>name_here</a>! (<a href=''>Logout</a>)
					</p> -->
					<p>You are not login. (<a href='#' onclick='showLogin()'>Login</a> or <a href='${pageContext.request.contextPath}/register.jsp'>Register now</a>)</p>
				<?php endif ?>
					
					<p class="right">
						<a href="/shop/">Shopping Cart</a> <img src='${pageContext.request.contextPath}/img/site/cart_white.png' style='margin-right:5px;'/>
					</p>
			</div>
			
			<div class='menu'>
				<a href='/index/shop'> </a>

			</div>
			
		</div>
		<h2 id='footer_txt'><b>www.jayset.com Oficial Website</b></br>Cause jay & set is something.</h2>
		<a href='https://twitter.com/dave_rex'><img title='@calvinsalvy' src='${pageContext.request.contextPath}/img/site/twitter.png' id='footer_img'/></a>
	</div>
	
	<div id='login_cont'>
		<div id='login_box'>
			<h1>LOGIN</h1>
			<a class='exit' onclick='hideLogin()'>x</a>
			<div id="loading"></div>
			<form>
				<label>Username</label><input type='text' id="login_username" name="Login[username]"></input><br/>
				<label>Password</label><input type='password' id="login_password" name="Login[password]"></input><br/>
				<button type='submit' onclick="login(); return false;" class='btn right'>Login</button>
			</form>
		</div>
	</div>
	
</body>
</html>