		<!-- Header Section -->
		<div id="header" class="frame">
			<div class="kolom-7">
				<a href="index.jsp"><img src="res/img/logo.png" alt="" id="logo"/></a>
			</div>
			<div class="kolom-4">
				<div id="user-panel">
					
					<div id="user" class="frame">
						<img id="user-pict" class="kolom-5" src="res/img/userpict_h.png" alt=""/>
						<div id="user-text" class="kolom-7">
						
							<%
								String name="";
								String value="";
								String valuelagi=null;
								Cookie[] cookies = request.getCookies();
								if (cookies!=null){
								for (int i = 0; i < cookies.length; i++) {
									Cookie c = cookies[i];
									name = c.getName();
									value = c.getValue();
									
									if (name.equals("username")){
										valuelagi=value;
									}
									session.setAttribute(name, value); 
								}
								}
								
								if(valuelagi!=null){ 
									
							%>
							
							
							<h3>Welcome, <span class="user-name"><a href="edit-profile.jsp" id="member"><% out.println(valuelagi); %></a></span>!</h3>
							<p id="user-control">
								<span class="edit-logout">	<a href='logout.jsp' id='logout2'>Logout</a></span>
							</p>
							<% }else {
								
								
							%>
							<div id = "logreg">
							<p id="user-control">
								
									<span class="edit-logout">	<a id="login2" href="javascript:login('show')">Login</a></span>
									&nbsp;or&nbsp;
									<span class="edit-logout">	<a id="register2" href="registrasi.jsp">Register</a></span>
								
							</p>
							<br/></div>
							<% } %>
							<a href="ShoppingBag.jsp" class="btn">Check Your Cart</a>
						</div>
					</div>
					
					<div id="search-bar" class="frame">
						<form name="search-form" action="getsearch" onsubmit="return validateForm('search-form', 'src', 'Ketikkan barang yang dicari...')">
							<input id="search-box" class="kolom-9" type="text" name="src" value="Ketikkan barang yang dicari..." onfocus="checkclear(this)" onblur="checkempty(this, 'Ketikkan barang yang dicari...')">
							<input id="search-button" class="kolom-1" type="submit" value="">
						</form>					
					</div>
				</div>
			</div>			
		</div>
		
			<form name="login" id="login" method="post">
			<div id="popupbox"> 
				<a href="javascript:login('hide')" id ="close">[X] close</a> <br/><br/>
				Username:
				<input name="username" size="14" /><br/>
				Password:
				<input name="password" type="password" size="14" /><br/><br/>
				<input type="button" name="button" id= "sbmtlogin" onclick="forLogin()" value="login" />
				</div> 
			
			</form>
		
		
		<!-- End of Header -->
		
			<!-- Navbar Section -->
		<div id="navbar" class="frame">
			<ul>
				<li><a href="Beras.jsp">Beras</a></li>
				<li><a href="Daging.jsp">Daging</a></li>
				<li><a href="Sayuran.jsp">Sayuran</a></li>
				<li><a href="FrozenFood.jsp">Frozen Food</a></li>
				<li><a href="Snack.jsp">Snack</a></li>
			</ul>
		</div>
		<!-- End of Navbar -->
		
	<script src="popup.js"></script> 
	<script src="Ajaxlogin.js"></script> 
	<script>
	function forLogin(){
		var username = AJAXPost();
		
		if (username.length!=3){
			
			document.getElementById('sbmtlogin').value="Login\nLogin Sukses";
			var newhtml =		'<h3>Welcome, <span class="user-name"><a href="edit-profile.jsp" id="member">'+username+'</a></span>!</h3><p id="user-control"><span class="edit-logout">	<a href="logout.jsp" id="logout2">Logout</a></span></p>';
			document.getElementById("logreg").innerHTML=newhtml;
	
		}else{
			document.getElementById('sbmtlogin').value="Login\nusername/password salah";
		}
	}
	</script>	