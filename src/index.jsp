<%-- 
    Document   : index
    Created on : Nov 26, 2013, 9:34:27 PM
    Author     : Iqbal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel='stylesheet' media='only screen and (min-width:1224px)' href='css/main.css' />

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ruserba</title>
    </head>
    <div id='wrapper'>
            <div id='header'>
                <%@include file="header.jsp" %>
            </div>
            <div class='divider'></div>
            <div id="content">
                <%@include file="home.jsp"%>
            </div>
            <div class='divider'></div>
            <div id='footer'>
                <%@include file="footer.jsp"%>
            </div>
            <br /><br /><br /><br /><br /><br />
        </div>
</html>
