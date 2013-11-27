<%-- 
    Document   : barang
    Created on : Nov 27, 2013, 4:16:57 PM
    Author     : Aurelia H B Matondang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ruserba.database.DatabaseHelper" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/desktop.css">
        <script src='js/addtocart.js'></script>
        <title>Detail Barang</title>
    </head>
    <body>
        <%
            String query = "select * from kategori";
            DatabaseHelper.Connect();
            ResultSet result = DatabaseHelper.executeQuery(query);
        %>
            <div class='barang_container'>
                <%
                    query = "select * from barang where barang.id_kategori=" + result.getInt("id_kategori") + " order by dibeli desc limit 0, 3";
                    ResultSet resultKategori = DatabaseHelper.executeQuery(query);
                    while (resultKategori.next()) {
                %>
                <div class='barang'>
                    <div class='barang_gambar_detail'>
                        <a href='/ruserba/barang/<%= resultKategori.getInt("id_barang")%>'> 
                           <img src='/ruserba/assets/barang<%= resultKategori.getString("gambar")%>' height='100'/>
                        </a>
                    </div>
                    <div class="barang_detail">
                      <h2> Nama Barang      : <%= resultKategori.getString("nama_barang") %></h2>
                      <h2> Kategori Barang  : <%= result.getString("nama_kategori") %></h2>
                      <h2> Harga Barang     : Rp <%= resultKategori.getInt("harga_barang") %>,00 </h2>
                      <h2> Jumlah tersedia  :<%
                                                  int tersedia = resultKategori.getInt("tersedia");
                                                  if (tersedia == 0) {
                                                  out.println("Barang tidak tersedia");
                                                  }
                                                  else {
                                                  out.println("Barang tersedia (" + resultKategori.getInt("tersedia") + " unit)");
                                                  }
                                             %></h2>
                       <a class='button'></a>
                                             
                    </div>
                </div>
                <%
                  }
                    resultKategori.close();
                %>                             
            </div>
    </body>
</html>
