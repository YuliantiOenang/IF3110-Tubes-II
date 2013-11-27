<div id="lightbox">	
		<div class="loginpoptop"><!--pop up-->
		<h4 id="loginHeader">LOGIN</h4>
		</div>
		<form id="test">
			<div class="forms">
			Username : <input type="text" id="user" required placeholder = "Username" /></br>
			</div>
			<div class="forms">
			Password : <input type="password" id="pass" required placeholder = "Password"></br>
			</div>
			<div class="forms">
			<input type="button" value="LogIn" onclick="login()"></input>
			<input type="button" value="Cancel" onclick="cancel()"></input>
			</div>
			<div class="error">
			<p id="Error"></p>
			</div>
			</form>

		</div>
<div class = "main">
	<div class = "header">
		
		<div class = "logohead">
			<div >
				<a href="homeadmin.jsp"><img src = "images/logo.png" class = "logo"></a>
				</img>
				</div>
			<div class = "loginplace">
				<div>
				<%--?php
				if(!isset($_COOKIE['user1']))
				{
				?--%>
                                <%
                                Cookie cookie = null;
                                Cookie cookies[] = null;
                                cookies = request.getCookies();
                                
                                boolean adaCookie = false;
                                
                                for(int i = 0;i<cookies.length;i++){
                                    if(cookies[i].getName().equals("username") && cookies[i].getValue().equals("admin")){
                                        adaCookie = true;
                                        break;
                                    }
                                }
                                
                                if(!adaCookie){
                                    %>
                                    <script>
                                        window.alert("ANDA BUKAN ADMIN!");
                                        window.location = "admintrap.jsp";
                                    </script>
                                    <%
                                }
                                
                                %>
					<img src = "images/logout.png" class = "login" onclick="logout()" id="loginButton"></img>
			</div>
		</div>
                </div>
		<div class = "menu">
                        <div class = "space"> 
				
                            <button onclick="playVid()" type="button">Play Music</button>
	<button onclick="pauseVid()" type="button">Pause Music</button> 
	<br>
	
	<audio id="audio1">
		<source src="Sound/Bubble Pop.mp3" type="audio/mp3">
		Your browser does not support HTML5 video.
	</audio>

	<script> 
		var myVideo=document.getElementById("audio1"); 

		function playVid()
		{ 
			myVideo.play(); 
		} 

		function pauseVid()
		{ 
			myVideo.pause(); 
		} 
	</script> 
                            
			</div>	
		</div>
		<div class = "main">
		</div>
	
</div>

<?php
		include "config/connect.php";
		
?>