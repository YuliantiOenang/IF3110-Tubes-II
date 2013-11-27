<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
    <head>
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>Whatshop Front Gate</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script type="text/javascript" src="scripts/ajaxrequest.js"></script>
		<script type="text/javascript" src="scripts/frontpage.js"> </script>
		<link rel="shortcut icon" href="favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
    </head>
    <body>
        <div class="container">
            <header>
                <h1>just a few seconds to access a tons of <span>wonderful item</span></h1>
            </header>
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="loginwelcome.php" autocomplete="on" method="post"> 
                                <h1>Log in</h1> 
								<p>
									<div id="rsp_username"><!-- --></div>
								</p>
                                <p> 
                                    <label for="username" class="uname" data-icon="u" > Username </label>
                                    <input id="username" name="username" required="required" type="text"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Password </label>
                                    <input id="password" name="password" required="required" type="password"/> 
                                </p>
                                <p class="keeplogin"> 
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for="loginkeeping">Keep me logged in</label>
								</p>
                                <p class="login button"> 
                                    <input type="submit" value="Login" /> 
								</p>
                                <p class="change_link">
									Not a member yet ?
									<a href="#toregister" class="to_register">Join us</a>
								</p>
                            </form>
                        </div>

                        <div id="register" class="animate form">
                            <form  action="registerlogin.php" autocomplete="on" method="post"> 
                                <h1> Sign up </h1>
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Username</label>
                                    <input id="usernamesignup" name="usernamesignup" required="required" type="text" onchange="if(this.value != '') validateWithAjax('checkUsername', usernamesignup.value, fullnamesignup.value, emailsignup.value, passwordsignup.value, passwordsignup_confirm.value, this.id);"/>
									<div id="rsp_usernamesignup"><!-- --></div>
                                </p>
								<p> 
                                    <label for="fullnamesignup" class="fullname" data-icon="u">Nama lengkap</label>
                                    <input id="fullnamesignup" name="fullnamesignup" required="required" type="text" onchange="if(this.value != '') validateWithAjax('checkFullName', usernamesignup.value, fullnamesignup.value, emailsignup.value, passwordsignup.value, passwordsignup_confirm.value, this.id);"/>
									<div id="rsp_fullnamesignup"><!-- --></div>
                                </p>
                                <p> 
                                    <label for="emailsignup" class="youmail" data-icon="e" > Email</label>
                                    <input id="emailsignup" name="emailsignup" required="required" type="email" onchange="if(this.value != '') validateWithAjax('checkEmail', usernamesignup.value, fullnamesignup.value, emailsignup.value, passwordsignup.value, passwordsignup_confirm.value, this.id);"/>
									<div id="rsp_emailsignup"><!-- --></div>
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">Password </label>
                                    <input id="passwordsignup" name="passwordsignup" required="required" type="password" onchange="if(this.value != '') validateWithAjax('checkPassword', usernamesignup.value, fullnamesignup.value, emailsignup.value, passwordsignup.value, passwordsignup_confirm.value, this.id);"/>
									<div id="rsp_passwordsignup"><!-- --></div>
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="p"> Konfirmasi password </label>
                                    <input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" onchange="if(this.value != '') validateWithAjax('checkPasswordConfirm', usernamesignup.value, fullnamesignup.value, emailsignup.value, passwordsignup.value, passwordsignup_confirm.value, this.id);"/>
									<div id="rsp_passwordsignup_confirm"><!-- --></div>
                                </p>
								</br>
								<h1> More Info </h1>
								</br>
								
								<p> 
                                    <label for="handphone" class="handphone">Handphone</label>
                                    <input id="handphone" name="handphone" type="text" />
                                </p>
								<p> 
                                    <label for="alamat" class="alamat">Alamat</label>
                                    <input id="alamat" name="alamat" type="text" />
                                </p>
								<p> 
                                    <label for="kecamatan" class="kecamatan">Kecamatan</label>
                                    <input id="kecamatan" name="kecamatan" type="text" />
                                </p>
								<p> 
                                    <label for="provinsi" class="provinsi">Provinsi</label>
                                    <input id="provinsi" name="provinsi" type="text" />
                                </p>
								<p> 
                                    <label for="kodepos" class="kodepos">Kode pos</label>
                                    <input id="kodepos" name="kodepos" type="text"/>
                                </p>
                                <p class="signin button" id="signupbutton"> 
									
								</p>
                                <p class="change_link">  
									Already a member ?
									<a href="#tologin" class="to_register"> Go and log in </a>
								</p>
                            </form>
                        </div>
						
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>