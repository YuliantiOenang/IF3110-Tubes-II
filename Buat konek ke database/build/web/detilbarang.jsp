<%-- 
    Document   : detilbarang
    Created on : Nov 26, 2013, 7:41:37 PM
    Author     : Aidil Syaputra
--%>
<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Connection koneksi = null;
            int id = Integer.valueOf(request.getParameter("id"));
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
            Statement stm1 = koneksi.createStatement();                    
            ResultSet hasil1 = stm1.executeQuery("SELECT * FROM barang WHERE id_barang="+id);
            hasil1.next();
            Statement stm2 = koneksi.createStatement();                    
            ResultSet hasil2 = stm2.executeQuery("SELECT * FROM kategori WHERE id_kategori="+hasil1.getString("id_kategori"));
            hasil2.next();
        %>
        <link rel="stylesheet" type="text/css" media="all" href="css/main.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <%
                out.println(hasil1.getString("nama_barang"));
            %>
        </title>
    </head>
    <body>
        <h3 class="judul_halaman">
            <%
                out.println(hasil1.getString("nama_barang"));
            %>
        </h3>
        </br>
        </br>
        </br>
        <div class="barang_container">
            <div class="barang_gambar_detail">
                <%
                out.print("<img src='assets/barang/"+hasil1.getString("gambar")+"' width=100%/");
                %>
            </div>
            <div class="barang_detail">
                <%
                out.print("Kategori : ");
                %>
                <span class="barang_nama">
                    <%
                    out.print("<a href='barang.jsp?kategori="+hasil1.getString("id_kategori")+"'>");
                    out.print(hasil2.getString("nama_kategori"));
                    out.print("</a>");
                    %>
                </span>
                <span class="barang_nama">
                </span>
                </br>
                <%
                out.print("Harga : ");
                %>
                <span class="barang_harga">
                    <% 
                    out.print("Rp "+hasil1.getString("harga_barang")+",00");
                    %>
                </span>
                </br>
                </br>
                </br>
                <%
                out.print("Jumlah : ");
                out.print("<input type='number' class='inputjumlah' name='jumlah' value=1 min=1 max=10>");
                %>
                </br>
                <%
                out.print("<a class='button beli' name='"+hasil1.getString("id_barang")+"' href='javascript:void(0)'><div>Pesan Barang</div></a>");
                %>                
            </div>
        </div>
    </body>
</html>
