<%@page import="java.util.ArrayList"%>
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
				<%--<?php
				if(!isset($_COOKIE['user1']))
				{
				?>--%>
                                <%
                                    Cookie cookie = null;
                                    Cookie[] cookies = null;
                                    boolean found=false;
                                    String nama=null;
                                    
                                    // Get an array of Cookies associated with this domain
                                    cookies = request.getCookies();
                                    
                                    ArrayList<Cookie> ArrayCookie=new ArrayList<Cookie>();
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("userAdmin"))
                                          {
                                            found=true;
                                            nama=cookie.getValue();
                                            ArrayCookie.add(cookie);
                                          }
                                          
                                       }
                                   }
                                   
                                   if(!found)
                                   {
                                     
                                %>
					<img src = "images/login.png" class = "login" onclick="popClik()" id="loginButton"></img>
				<%
                                   }
                                    else
                                   {
                                        
                                %>
                                <%--<?php
				}
				else
				{
				?>--%>

					<img src = "images/logout.png" class = "login" onclick="logout()" id="loginButton"></img>
				
                                <%
                                }
                                %>        
                                <%--<?php
				}
				?>--%>
				</div>
			</div>
			<div class = "signupplace">
				
				<div>
				<%--<?php
				if(!isset($_COOKIE['user1']))
				{
				?>--%>
                                <%
                                if(!found)
                                {
                                %>
				<p class = "signup" id="signup" ></p>
				<%--<?php
				}
				?>--%>
                                <%
                                }
                                %>
					
				</div> 
				
                            <a href="index.jsp"><p class="welctext" id="welcome"><%if(found){out.print("WELCOME,"+nama);
                        }%><%--<?php if(isset($_COOKIE['user1'])) echo "WELCOME,".$_COOKIE['user1'].""; ?>--%></p></a>
			</div>
		</div >
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