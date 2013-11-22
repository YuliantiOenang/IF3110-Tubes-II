<%-- 
    Document   : index
    Created on : Nov 9, 2013, 7:48:30 AM
    Author     : elfinositompul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <script type="text/javascript" src="js/fungsi.js"></script>
        <link rel="stylesheet" type="text/css" href="css/satu.css">
        <link rel="shortcut icon" href="imgs/favicon.ico">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="index.jsp">
            <img src="imgs/icon.jpg" alt="Home " width="155" height="100">
        </a>

        <div class="" id="loginform" >



            <form id="loginformid">

                <fieldset>
                    username : <input type="text" value="" name="usernamelogin" onchange="gas()"> <br><br>
                    password : <input type="password" name="passwordlogin">   
                </fieldset>
                <fieldset>

                    <button id="loginButton" type="submit" onclick="checkLogin()">Login</button>   
                </fieldset>
            </form>
            <script type="text/javascript">
                        document.onload = showForm(1);
            </script>
            <button  id="showFormButton" onclick="showForm(2)">I want to login</button>

        </div>
        <a href="register.jsp">Register</a><br>

        This Web have been viewed for 
        <%
            int a;
            a = webs.Counter.getCount();
            out.println(a);
            if (a == 1) {

                out.println(" time");
            } else {

                out.println(" times");
            }
        %>
    </body>
</html>
