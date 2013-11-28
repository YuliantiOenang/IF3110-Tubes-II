<%-- 
    Document   : index
    Created on : Nov 24, 2013, 9:01:00 PM
    Author     : Aldo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Class.GetConnection"%>
<%-- Session
<?php 
        session_start();
        if (isset($_SESSION["userlistapp"]))
                header("Location: page/dashboard.php");
?>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>RuSerBa Online</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script type="text/javascript" src="index.js"></script>
        <script src="calendar.js"></script>
        <link href="calendar.css" rel="stylesheet">
    </head>
    <body>
        <div id="header">
            <%@ include file="header.jsp" %>	
        </div>
        <div id="index-page-body">
            <div id="index-body">
                <div id="left-body">
                    Makanan:
                    <div id="user-result">
                        <%                            String query = "SELECT goods_name,goods_sold FROM goods,categorymeetup WHERE cata_ID='cata0001' and categorymeetup.goods_ID=goods.goods_ID ORDER BY goods_sold DESC";

                            GetConnection getCon = new GetConnection();
                            Connection conn = getCon.getConnection();
                            Statement stt = conn.createStatement();

                            ResultSet rs = stt.executeQuery(query);

                            int count = 0;
                            while (rs.next() && count < 3) {
                                out.print("<a href=\"detailbarang.jsp?namabarang=" + rs.getString("goods_name") + "&hasil=\"><img id=\"photo\" src=\"image/goods/" + rs.getString("goods_name") + ".jpg\" width=\"100\" height=\"120\"/></a>");
                                count++;
                            }

                        %>
                    </div>

                    Minuman:
                    <div id="user-result">
                        <%                        
                            query = "SELECT goods_name,goods_sold FROM goods,categorymeetup WHERE cata_ID='cata0002' and categorymeetup.goods_ID=goods.goods_ID ORDER BY goods_sold DESC";

                            getCon = new GetConnection();
                            conn = getCon.getConnection();
                            stt = conn.createStatement();

                            rs = stt.executeQuery(query);

                            count = 0;
                            while (rs.next() && count < 3) {
                                out.print("<a href=\"detailbarang.jsp?namabarang=" + rs.getString("goods_name") + "&hasil=\"><img id=\"photo\" src=\"image/goods/" + rs.getString("goods_name") + ".jpg\" width=\"100\" height=\"120\"/></a>");
                                count++;
                            }

                        %>
                    </div>

                    Perawatan Anak-Anak:
                    <div id="user-result">
                        <%                        query = "SELECT goods_name,goods_sold FROM goods,categorymeetup WHERE cata_ID='cata0003' and categorymeetup.goods_ID=goods.goods_ID ORDER BY goods_sold DESC";

                            getCon = new GetConnection();
                            conn = getCon.getConnection();
                            stt = conn.createStatement();

                            rs = stt.executeQuery(query);

                            count = 0;
                            while (rs.next() && count < 3) {
                                out.print("<a href=\"detailbarang.jsp?namabarang=" + rs.getString("goods_name") + "&hasil=\"><img id=\"photo\" src=\"image/goods/" + rs.getString("goods_name") + ".jpg\" width=\"100\" height=\"120\"/></a>");
                                count++;
                            }

                        %>
                    </div>

                    Perawatan Pribadi:
                    <div id="user-result">
                        <%                        query = "SELECT goods_name,goods_sold FROM goods,categorymeetup WHERE cata_ID='cata0004' and categorymeetup.goods_ID=goods.goods_ID ORDER BY goods_sold DESC";

                            getCon = new GetConnection();
                            conn = getCon.getConnection();
                            stt = conn.createStatement();

                            rs = stt.executeQuery(query);

                            count = 0;
                            while (rs.next() && count < 3) {
                                out.print("<a href=\"detailbarang.jsp?namabarang=" + rs.getString("goods_name") + "&hasil=\"><img id=\"photo\" src=\"image/goods/" + rs.getString("goods_name") + ".jpg\" width=\"100\" height=\"120\"/></a>");
                                count++;
                            }

                        %>
                    </div>

                    Perlengkapan Rumah:
                    <div id="user-result">
                        <%                        query = "SELECT goods_name,goods_sold FROM goods,categorymeetup WHERE cata_ID='cata0005' and categorymeetup.goods_ID=goods.goods_ID ORDER BY goods_sold DESC";

                            getCon = new GetConnection();
                            conn = getCon.getConnection();
                            stt = conn.createStatement();

                            rs = stt.executeQuery(query);

                            count = 0;
                            while (rs.next() && count < 3) {
                                out.print("<a href=\"detailbarang.jsp?namabarang=" + rs.getString("goods_name") + "&hasil=\"><img id=\"photo\" src=\"image/goods/" + rs.getString("goods_name") + ".jpg\" width=\"100\" height=\"120\"/></a>");
                                count++;
                            }

                        %>
                    </div>
                </div>
                <div id="right-body">
                    Mekanisme Pembelian:</br>
                    1.Mendaftar sebagai user.</br>
                    2.Login.</br>
                    3.Pilih barang yang dibeli serta jumlahnya.</br>
                    4.Lihat barang yang dibeli pada cart.</br>
                    5.Konfirmasi pembelian dengan mendaftar kartu kredit.</br>
                    6.Barang yang anda pesan sudah dibeli dan akan diantar ke alamat anda.</br>
                </div>
            </div>
        </div>
    </body>
</html>
