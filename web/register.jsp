<%-- 
    Document   : register
    Created on : Nov 13, 2013, 5:29:33 PM
    Author     : elfinositompul
--%>
<script type="text/javascript" src="js/fungsi.js"></script>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Register Page</h1>
        <div class="registerform">
            <form id="registerformid">
                <fieldset>
                     username : <input type="text" value="" name="regusername" onchange="gas()"> <br><br>
                    password : <input type="password" name="regpassword">   
                    confirm password : <input type="password" name="regconfirmpassword">  <br><br>
                    nama lengkap : <input type="text" name="regfullname">  <br><br>
                    email : <input type="text" name="regemail">  
                </fieldset>
                <fieldset>
                    <button id="registerButton" type="submit" onclick="alert('register done')">Submit Registration</button>
                </fieldset>
            </form>


        </div>
    </body>
</html>
