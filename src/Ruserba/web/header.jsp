<%-- 
    Document   : header
    Created on : Nov 24, 2013, 9:17:45 PM
    Author     : Aldo
--%>

<%@page import="Class.GetConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String nama="",password="",alamat="",provinsi="",kabupaten="",pos="",HP="",email="";%>
<!DOCTYPE html>
<html>
    <head>
        <title>Header</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="css/modal.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/header.js"></script>
    </head>
    <body onLoad="initialize()">

        <div id="header-left-side"><a href="index.jsp"><img src="image/logo.png" width="222px" height="60px"/></a>
            <div id="header-bottom-side">
                <div id="space"><a href="search_result.jsp?category=makanan">Makanan</a></div>
                <div id="space"><a href="search_result.jsp?category=minuman">Minuman</a></div>
                <div id="space"><a href="search_result.jsp?category=anak">Perawatan Anak-Anak</a></div>
                <div id="space"><a href="search_result.jsp?category=pribadi">Perawatan Pribadi</a></div>
                <div id="space"><a href="search_result.jsp?category=rumah">Perlengkapan Rumah</a></div>
            </div>
        </div>

        <div id="header-right-side">
            <div id="header-right-search">
                <form action="search_result.jsp" method="post" enctype="multipart/form-data">
                    <select name="modesearch" id="modesearch" onChange="filter()">
                        <option value="1">Nama Barang</option>
                        <option value="2">Harga</option>
                    </select> 
                    <input type="text" name="search_text" id="search_text" list="searching-auto" value=""" />
                    <input type="text" name="search_pricemin" id="search_pricemin" list="searching-auto" style="display: none;" value=""" />
                    <input type="text" name="search_pricemax" id="search_pricemax" list="searching-auto" style="display: none;" value=""" />
                    <input type="submit" value="Search"/>
                    <div id="list-search"></div> 

                </form>


                <%
                    /*session management*/
                    if (request.getSession().getAttribute("userlistapp") != null) {
                        GetConnection getCon = new GetConnection();
                        Connection conn = getCon.getConnection();
                        Statement stt = conn.createStatement();

                        String query = "SELECT * FROM userprofil WHERE profil_ID='" + session.getAttribute("userlistapp") + "'";

                        ResultSet rs = stt.executeQuery(query);
                        
                        rs.next();
                        nama=rs.getString("profil_name");
                        password=rs.getString("profil_password");
                        alamat=rs.getString("profil_address");
                        provinsi=rs.getString("profil_province");
                        kabupaten=rs.getString("profil_district");
                        pos=rs.getString("profil_zipcode");
                        HP=rs.getString("profil_mobile");
                        email=rs.getString("profil_email");
                        
                        out.print("<div id=\"login\">");
                        out.print("Welcome, <a href=\"profile.jsp\">" + request.getSession().getAttribute("userlistapp") + "</a></div>");
                        out.print("<div id=\"logout\">");
                        out.print("<form action=\"logout\">");
                        out.print("<input type=\"submit\" value=\"LOGOUT\" /></form>");
                        out.print("<a href=\"cart.jsp\">Keranjang Belanja</a></div>");

                    } else {
                        out.print("<div id=\"login\">");
                        out.print("<div id=\"add-category\"><a href=\"#login_button\"><button>LOGIN</button></a>&nbsp");
                        out.print("</div>");
                        out.print("<a href=\"#x\" class=\"overlay\" id=\"login_button\"></a>");
                        out.print("<div class=\"popup\">");
                        out.print("<h2>Login</h2><br>");
                        out.print("<form action=\"checklogin\" method=\"post\" enctype=\"multipart/form-data\">");
                        out.print("<div>");
                        out.print("<label for=\"login\">Username :</label>");
                        out.print("<input type=\"text\" id=\"loginusername\" name=\"username\"/>");
                        out.print("</div><div>");
                        out.print("<label for=\"asignee\">Password : </label>");
                        out.print("<input type=\"password\" id=\"loginPassword\" name=\"password\"/>");
                        out.print("</div><div>");
                        out.print("<input type=\"submit\" value=\"Login\"/>");
                        out.print("<a href=\"register.jsp\">Register</a></div></form>");
                        out.print("<a class=\"close\" href=\"#close\"></a>");
                        out.print("</div>");
                        out.print("</div>");
                    }
                %>
            </div>
        </div>
    </body>
</html>
