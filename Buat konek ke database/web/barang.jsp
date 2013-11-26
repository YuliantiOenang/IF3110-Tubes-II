<%-- 
    Document   : barang
    Created on : Nov 26, 2013, 10:57:32 AM
    Author     : Aidil Syaputra
--%>

<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" media="all" href="css/main.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Halaman Barang </title>
    </head>
    <body>
        <%
            Connection koneksi = null;
        %>
        <%
            try {
                String connectionURL = "jdbc:mysql://localhost:3306/ruserba"; //isi dengan server dan nama database
                Class.forName("com.mysql.jdbc.Driver").newInstance();                
                koneksi = DriverManager.getConnection(connectionURL, "root", ""); //username dan password database
            }
            catch(Exception ex){
                out.println("Unable to connect to database."+ex);
            }
            Statement stm = koneksi.createStatement();
                    
            ResultSet hasil = stm.executeQuery("SELECT * FROM barang WHERE id_kategori=1");
        %>
        <h3 class="judul_halaman">
            <%
                out.println("Barang Kategori 1");
            %>
        </h3>
        <%
        while(hasil.next()){
            %>
            <div class="halaman_category_container">
               <div class="barang_container">
                   <div class="barang">
                        <% 
                        out.print("<a href='index.jsp'>");
                        out.print("<img src='assets/barang/"+hasil.getString("gambar")+"' heigth=100%/");
                        out.print("</a>");
                        %>
                   </div>
                   <div class="barang">
                        <% 
                             out.print("Nama Barang : ");
                        %>
                        <span class="barang_nama">
                            <%
                             out.print("<a href='index.jsp'>");
                             out.print(hasil.getString("nama_barang"));
                             out.print("</a>");
                             %>
                        </span>
                        </br>
                         <% 
                             out.print("Harga Barang : ");
                        %>
                        <span class="barang_harga">
                             <% 
                             out.print("Rp "+hasil.getString("harga_barang")+",00");
                             %>
                        </span>
                   </div>
               </div>
            </div>
            <% 
        }
        %>
    </body>
</html>
