		<h2 id='footer_txt'><b>www.jayset.com Oficial Website</b></br>Cause jay & set is something.</h2>
		<a href='https://twitter.com/dave_rex'><img title='@calvinsalvy' src='${pageContext.request.contextPath}/img/site/twitter.png' id='footer_img'/></a>
	</div>
	
<!--  </div>-->
	
	<div id='login_cont'>
		<div id='login_box'>
			<h1>LOGIN</h1>
			<a class='exit' onclick='hideLogin()'>x</a>
			<div id="loading"></div>
			<form action="login" method="post">
				<label>Username</label><input type='text' id="username" name="username"></input><br/>
				<label>Password</label><input type='password' id="password" name="password"></input><br/>
				<!--   <button type="submit" onclick="login(); return false;" class="btn right">Login</button> -->
				<button type="submit" class="btn right"></button>
			</form>
		</div>
	</div>
	
</body>
</html>