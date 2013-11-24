<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Nov 24, 2013, 9:57:20 AM
    Author     : Setyo Legowo <setyo.legowo@live.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ruserba 2.0</title>
        <link type="text/css" rel="stylesheet" href="asset/home.css">
    </head>
    <body>
        <h1>Hello World!</h1>
        <sql:query var="r_query" dataSource="jdbc/DB">
            SELECT nama FROM barang_data
        </sql:query>
    </body>
</html>
