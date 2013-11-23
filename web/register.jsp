<script type="text/javascript" src="js/fungsi.js"></script>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>Register Page</h1>
        <div class="registerform">

            <form id="registerformid" action="registerlogic.jsp">
                <fieldset>
                    Username : <input type="text" required="required" placeholder="Write your username" name="regusername" onchange="checkUsername();"> <br><br>
                    Password : <input type="password" required="required" name="regpassword" onchange="checkPassword();"> <br><br>
                    Confirm password : <input type="password" required="required" name="regconfirmpassword" onchange="checkConfirmPassword();"> <br><br>
                    Full Name : <input type="text" required="required" name="regfullname"> <br><br>
                    E-mail : <input type="email" required="required" name="regemail"> 
                </fieldset>
                <fieldset>
                    <button id="registerButton" type="submit" onclick="" value="halo"></button>
                </fieldset>
            </form>


        </div>
    </body>
</html>
