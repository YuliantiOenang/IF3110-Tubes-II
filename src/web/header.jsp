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
				<a href="index.jsp"><img src = "images/logo.png" class = "logo"></a>
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
                                    if(cookies[i].getName().equals("IdCustomer")){
                                        adaCookie = true;
                                        break;
                                    }
                                }
                                
                                
                                if(!adaCookie){
                                %>
                                
					<img src = "images/login.png" class = "login" onclick="popClik()" id="loginButton"></img>
                                <%
                                    }
                                    else
                                    {
                                %>
                                <%--?php
				}
				else
				{
				?--%>
					<img src = "images/logout.png" class = "login" onclick="logout()" id="loginButton"></img>
				<%--?php
				}
                                ?--%>
                                <%
                                    }
                                %>
				</div>
				<div >
					<img src = "images/cart.png" class = "cart" onclick="window.location='shoppingbag.jsp'"></img>
				</div>
			</div>
			<div class = "signupplace">
				
				<div>
				<%--?php
				if(!isset($_COOKIE['user1']))
				{
				?--%>
                                <%
                                    if(!adaCookie){
                                %>
                                
				<img src = "images/signup.png" class = "signup" id="signup" onclick="window.location='registrasi.jsp'"></img>
				<%--?php
				}
				?--%>
                                <%
                                    }
                                %>
					
				</div> 
				
			<a href="see_profile.jsp"><p class="welctext" id="welcome"><%--?php if(isset($_COOKIE['user1'])) echo "WELCOME,".$_COOKIE['user1'].""; ?--%>
                            <%
                                if(adaCookie){
                                    //MENULISKAN SELAMAT DATANG
                                    for(int i = 0;i<cookies.length;i++){
                                        if(cookies[i].getName().equals("user1")){
                                            cookie = cookies[i];
                                            out.print("WELCOME," + cookie.getValue());
                                            break;
                                        }
                                    }
                                }
                            %>
                            </p></a>
			</div>
		</div>
		<div class = "menu">
				<div>
					<a href="kategori.jsp?key=Jaket"><img src = "images/jacket.png" class = "jacket"></img></a>
				</div>
				<div>
					<a href="kategori.jsp?key=Sweater"><img src = "images/sweaters.png" class = "tshirt"></img>
				</div>
				<div >
					<a href="kategori.jsp?key=TShirt"><img src = "images/tshirt.png" class = "wristband"></img></a>
				</div>
				<div>
					<a href="kategori.jsp?key=Misc"><img src = "images/misc.png"  class = "emblem"></img></a>
				</div>
				<div>
					<a href="kategori.jsp?key=Pokemon"><img src = "images/pokemon.png"  class = "pokemon"></img></a>
				</div>
		</div>
		<div class = "main">
		</div>
	
</div>

<?php
		include "config/connect.php";
		
?>