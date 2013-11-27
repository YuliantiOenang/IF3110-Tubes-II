<!DOCTYPE html>
<html lang="en" >
    <head>
    <script src ="UserAJAX.js"></script>
    <link rel="stylesheet" href="css/modal.css" type="text/css">
    </head>
    <body onload="InitializeBar()">
        <!-- Tombol Login/Logout -->
        <div class="main">
            <div class="panel">
            	<a href = "Registration.jsp" id = "regislink">Register</a>
          		<input type="button" id = "logbutton" value ="Log In" onclick = 'location.href="#login_form"'></input>
            </div>
        </div>

        <!-- Pop Up -->
        <a href="#x" class="overlay" id="login_form"></a>
        <div class="popup">
            <h2>RuSerBa Login</h2>
            <div>
                <label for="login">Username</label>
                <input type="text" id="login" value="" />
            </div>
            <div>
                <label for="password">Password</label>
                <input type="password" id="password" value="" />
            </div>
            <input type="button" value="Log In" onclick="Login()" />

            <a class="close" href="#close"></a>
        </div>
    </body>
</html>