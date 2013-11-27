<%-- 
    Document   : AdminPanel
    Created on : Nov 26, 2013, 12:46:29 PM
    Author     : RiandyRN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>AdminPanel</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
</head>
<body>
	
	<div id="container">
		
            <% if (session.getAttribute("user_role").equals(1)) { %>
            
                <jsp:include page="Header.jsp"/>
                <jsp:include page="AdminNavbar.jsp"/>
                
                <div class="frame">
                    <div class="kolom-2"></div>
                    <div class="kolom-8">
                        
                        <img src="res/img/mascot_vectorized.png" />
                        <div class="welcome-text">Selamat Datang di AdminPanel!</div>
                        <p>Silakan klik navbar untuk mengakses menu admin</p>
                    </div>
                    <div class="kolom-2"></div>
                </div>
            <% } else { %>
            
                <jsp:include page="ForbiddenPage.jsp"/>
            
            <% } %>
		
	</div>
	
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>	

</body>
</html>
