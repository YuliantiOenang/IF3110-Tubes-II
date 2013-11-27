<%!
   String url = "http://localhost:8080/tugas_web2/"; 
%>
<%-- 
    Document   : barangadmin
    Created on : Nov 27, 2013, 12:44:05 PM
    Author     : IHSAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.if3110.web.JSONResponder" %>
<%@page import="java.lang.*" %>
<!DOCTYPE html>
<%
   String kateg = request.getParameter( "cat" );
   int intkateg = Integer.parseInt(kateg);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=url %>assets/css/home.css" type="text/css">
        <link rel="stylesheet" href="<%=url %>assets/css/loginpopup.css" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <%! JSONResponder jsr = new JSONResponder(); %>
        <% String jstr = jsr.subkategori(); %>
        <% String jstrtabel = jsr.tabelbarang(intkateg+1); %>
        <p id="header_kat"></p>
        <p id="tabel"></p>
    <script>
        var categ = JSON.parse('<%= jstr%>');
        var tabel = JSON.parse('<%= jstrtabel%>');
        var htmlout = "<h1>" + categ.data[<%= intkateg %>] + "</h1>";
        for (var i=0; i<categ.data.length; i++) {
            htmlout += "<div class=\"box_barang\">";
            htmlout += "<img class=\"gambar_barang\" src=\"<%=url %>assets/image/1.jpg\" alt=\"" + tabel.data[i] + "\" height=\"100\" width=\"100\">";
            htmlout += "<span class=\"harga\">Rp." + tabel.price[i] + "</span>";
            htmlout += "<p>" + tabel.data[i] + "</p>";
            htmlout += "</div>";
        }
        document.getElementById("header_kat").innerHTML = '<%= intkateg+1 %>';
        document.getElementById("tabel").innerHTML = htmlout;
    </script>
    </body>
</html>
