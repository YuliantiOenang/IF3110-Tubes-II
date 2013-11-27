<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">

            window.onload = function() {

                var conf = document.getElementById("confpass");

                conf.onkeyup = checkButtonAvailable;
                function checkButtonAvailable() {
                    if (confirmpassok.value === "Nah, ini sama.")
                        document.getElementById("registerButton").disabled = false;
                    else
                        document.getElementById("registerButton").disabled = true;
                }
            }

            function checkUser() {
                var xmlhttp;
                var user = document.getElementById("username").value;
                var urls = "checkuser.jsp?u=" + user;

                if (window.XMLHttpRequest) {
                    xmlhttp = new XMLHttpRequest();
                } else {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function() {
                    if (xmlhttp.readyState == 4) {
                        document.getElementById("usernameavail").innerHTML = xmlhttp.responseText;
                    }
                }
                xmlhttp.open("GET", urls, true);
                xmlhttp.send();
            }

            function checkMail() {
                var xmlhttp;
                var mail = document.getElementById("email").value;
                var pass = document.getElementById("password").value;
                var urls = "checkmail.jsp?m=" + mail;

                if (window.XMLHttpRequest) {
                    xmlhttp = new XMLHttpRequest();
                } else {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function() {
                    if (xmlhttp.readyState == 4) {
                        document.getElementById("emailavail").innerHTML = xmlhttp.responseText;
                    }
                }
                xmlhttp.open("GET", urls, true);
                xmlhttp.send();

                if (user === pass) {
                    document.getElementById("emailavail").innerHTML += ", but it's the same with the password!";
                }

            }

            function checkPass() {
                var user = document.getElementById("username").value;
                var pass = document.getElementById("password").value;

                if (user === pass) {
                    document.getElementById("passwordok").innerHTML = "Password harus beda ama username";
                    document.getElementById("registerButton").disabled = true;
                } else {
                    document.getElementById("passwordok").innerHTML = "Password OK";
                    document.getElementById("registerButton").disabled = false;
                }
            }

            function checkConf() {
                var pass = document.getElementById("password").value;
                var conf = document.getElementById("confpass").value;

                if (pass !== conf) {
                    document.getElementById("confirmpassok").innerHTML = "Passwordnya kok beda?";
                } else {
                    document.getElementById("confirmpassok").innerHTML = "Nah, ini sama."
                }
            }

        </script>
    </head>
    <body>
        <form name="input" action="submituser.jsp" method="post">
            User Name: <input type="text" name="username" pattern="^[a-zA-Z0-9]{5,20}$" id="username" onkeyup="checkUser();checkPass();" onchange="checkUser();checkPass();">
            <span id="usernameavail"> </span>
            <br>
            Password: <input type="password" name="password" pattern="^[a-zA-Z0-9]{8,20}$" id="password" onkeyup="checkPass()" onchange="checkPass()">
            <span id="passwordok"> </span>
            <br>
            Confirm Password: <input type="password" pattern="^[a-zA-Z0-9]{8,20}$" name="password" id="confpass" onkeyup="checkConf()" onchange="checkConf()">
            <span id="confirmpassok"> </span>
            <br>
            Nama Lengkap: <input type="text" name="fullname" pattern="^[A-Za-z]+(\s[A-Za-z]*)+$">
            <br>
            Email: <input type="email" name="email" id="email" onkeyup="checkMail()">
            <span id="emailavail"> </span>
            <br>
            <input type="submit" value="Register" id="registerButton" >
        </form>
    </body>
</html>