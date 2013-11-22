<%-- 
    Document   : index
    Created on : Nov 9, 2013, 7:48:30 AM
    Author     : elfinositompul
--%>
<script type="text/javascript" src="fungsi.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@include file="header.jsp" %>

<%@include file="ConnectDB.jsp" %>
<%@include file="login.jsp" %> --%>
<html>
    <head>
    <h1>Welcome to The Store</h1>
</head>
<body>
    <p>For test</p>
     <form>
                <fieldset>
                    <p>
                        <label>Username <abbr title="Required">*</abbr></label>
                        <input value="" id="usernamelogin"
                              
                               title="Your username"
                               type="text" spellcheck="false" size="20" />
                    </p>
                    <p>
                        <label>Password <abbr title="Required">*</abbr></label>
                        <input value=""  id="passwordlogin"
                               
                               title="Your password"
                               type="password" spellcheck="false" size="20" />
                    </p>
                </fieldset>
                <fieldset>
                    <button id="login" onclick="checkLogin();
                                return false;">Login</button>
                </fieldset>
            </form>
    <% String namauser = request.getParameter("usr");
        session.setAttribute("pelanggan", namauser);
    %>

    <A href="login.jsp">sapa</A>
</body>
</html>

