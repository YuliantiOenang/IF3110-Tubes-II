<%-- 
    Document   : Header
    Created on : Nov 26, 2013, 12:59:13 PM
    Author     : RiandyRN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Header Section -->
<div id="header" class="frame">
        <div class="kolom-7">
            <a href="index.jsp"><img src="res/img/logo.png" alt="" id="logo"/></a>
        </div>
        <div class="kolom-4">
                <div id="user-panel">

                        <div id="user" class="frame">
                                <img id="user-pict" class="kolom-5" src="res/img/userpict_h.png" alt=""/>
                                <div id="user-text" class="kolom-7">
                                        <h3>Welcome, <span class="user-name">Riandy</span>!</h3>
                                        <p id="user-control">
                                                <span class="edit-logout"><a href="">Edit Profile</a></span>
                                                &nbsp;or&nbsp;
                                                <span class="edit-logout"><a href="">Logout</a></span>
                                        </p>

                                        <% if (session.getAttribute("Role").equals(1)) { %>
                                            <a href="AdminPanel.jsp" class="btn btn-admin">Admin Panel</a>
                                        <% } else { %>                                   
                                            <a href="#" class="btn">Check Your Cart</a>
                                        <% } %>
                                </div>
                        </div>

                        <div id="search-bar" class="frame">
                                <form name="search-form" method="GET" action="Search.jsp" onsubmit="return validateForm('search-form', 'src', 'Ketikkan barang yang dicari...')">
                                        <input id="search-box" class="kolom-9" type="text" name="src" value="Ketikkan barang yang dicari..." onfocus="checkclear(this)" onblur="checkempty(this, 'Ketikkan barang yang dicari...')">
                                        <input id="search-button" class="kolom-1" type="submit" value="">
                                </form>					
                        </div>
                </div>
        </div>			
</div>
<!-- End of Header -->
