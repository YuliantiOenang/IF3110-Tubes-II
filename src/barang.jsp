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
        <%
            Connection koneksi = null;
            int kategori = Integer.valueOf(request.getParameter("kategori"));
            String query = "SELECT * FROM barang WHERE id_kategori="+kategori+" ORDER BY ";
            int pages;
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
            ResultSet hasil1 = stm1.executeQuery("SELECT * FROM barang WHERE id_kategori="+kategori);
            hasil1.last();
            int banyakBarang = hasil1.getRow();
            hasil1.beforeFirst();
            if(request.getParameter("page")==null){
                pages=1;
            } else {
                pages = Integer.valueOf(request.getParameter("page"));
            }
            int limit = 10;
            int mulai_dari = limit * (pages - 1);
            hasil1 = stm1.executeQuery("SELECT * FROM barang WHERE id_kategori="+kategori+" LIMIT "+mulai_dari+", "+limit);
            Statement stm2 = koneksi.createStatement();                    
            ResultSet hasil2 = stm2.executeQuery("SELECT * FROM kategori WHERE id_kategori="+kategori);
            hasil2.next();
        %>
        <link rel="stylesheet" type="text/css" media="all" href="css/main.css"/>
        <script type="text/javascript" src="js/sort.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <%
                out.println(hasil2.getString("nama_kategori"));
            %>
        </title>
    </head>
    <body>
        <div id='wrapper'>
            <div id='header'>
                <%@include file="header.jsp" %>
            </div>
            <div class='divider'></div>
            <div id="content">
                <h3 class="judul_halaman">
                    <%
                    out.println("Kategori : "+hasil2.getString("nama_kategori"));
                    %>
                </h3>
                <div id="dropdownsort">
                    Urutkan berdasarkan : 
                    <select id="selectorder">
                        <%
                        if (request.getParameter("order")==null || request.getParameter("order").equals("nama")){ 
                        %>
                            <option selected=true>Nama</option>
                            <option>Harga</option>
                        <%
                            query = query + "nama_barang ";
                        } else if (request.getParameter("order").equals("harga")) {
                        %>
                            <option>Nama</option>
                            <option selected=true>Harga</option>
                        <%
                            query = query + "harga_barang ";
                        }
                        %>
                   </select>
                   <select id="selectsort">
                       <%
                        if (request.getParameter("sort")==null || request.getParameter("sort").equals("asc")){ 
                        %>
                            <option selected=true>Membesar</option>
                            <option>Mengecil</option>
                        <%
                            query = query + "asc";
                        } else if (request.getParameter("sort").equals("desc")) {
                        %>
                            <option>Membesar</option>
                            <option selected=true>Mengecil</option>
                        <%
                            query = query + "desc";
                        }
                        %>
                   </select>
                </div>
                <br/>
                <br/>
                <%
                query = query +" LIMIT "+mulai_dari+" ,"+limit;
                hasil1 = stm1.executeQuery(query);
                while(hasil1.next()){
                    %>
                    <div class="halaman_category_container">
                       <div class="barang_container">
                           <div class="barang">
                                <% 
                                out.print("<a href='detilbarang.jsp?id="+hasil1.getString("id_barang")+"'>");
                                out.print("<img src='assets/barang/"+hasil1.getString("gambar")+"' height=100%/>");
                                out.print("</a>");
                                %>
                           </div>
                           <div class="barang">
                                <span class="barang_nama">
                                    <%
                                     out.print("<a href='detilbarang.jsp?id="+hasil1.getString("id_barang")+"'>");
                                     out.print(hasil1.getString("nama_barang"));
                                     out.print("</a>");
                                     %>
                                </span>
                                <br/>
                                <span class="barang_tersedia"></span>
                                <span class="barang_harga">
                                     <% 
                                     out.print("Rp "+hasil1.getString("harga_barang")+",00");
                                     %>
                                </span>
                                <br/>
                                <br/>
                                <br/>
                                <%
                                out.print("Jumlah : ");
                                out.print("<input type='number' class='inputjumlah' name='jumlah' value=1 min=1 max=10>");
                                %>
                                <br/>
                                <%
                                out.print("<a class='button beli' name='"+hasil1.getString("id_barang")+"' href='javascript:void(0)'><div>Pesan Barang</div></a>");
                                %>  
                           </div>
                       </div>
                    </div>
                    <hr>
                <% 
                }
                int banyakHalaman = (int) Math.ceil(banyakBarang / limit);
                if (banyakHalaman > 1) {
                    out.print("<div class='paginasi'>");
                    out.print("Halaman : "); 
                        for(int i = 1; i <= banyakHalaman; i++){
                                if(pages != i){
                                        out.print("<a href='search.jsp?kata"+request.getParameter("kata")+"&pilihan="+request.getParameter("pilihan")+"&page="+i+"'>["+i+"]</a>");
                                } else {
                                        out.print("["+i+"]");
                                }
                        }
                     out.print("</div>");
                }
                %>
            </div>
            <div class='divider'></div>
            <div id='footer'>
                <%@include file="footer.jsp"%>
            </div>
            <br /><br /><br /><br /><br /><br />
        </div>
    </body>
</html>
