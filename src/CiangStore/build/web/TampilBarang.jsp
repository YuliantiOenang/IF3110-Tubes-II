<%-- 
    Document   : Search
    Created on : Nov 27, 2013, 7:57:36 AM
    Author     : RiandyRN
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>Search Result</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
</head>
<body>
	
	<div id="container">
		
            <% if(request.getParameter("kategori")!=null) { %>
                    <jsp:include page="Header.jsp"/>
                    <jsp:include page="Navbar.jsp"/>

                    <div id="dagangan">

                            <div id="sort-bar" class="frame">
                                    <div class="kolom-4">&nbsp;</div>
                                        <select name="sort-combo-box" id="sort-box" class="kolom-5" onChange="document.location = this.value" value="GO">
                                                <option value="">Urutkan berdasarkan...</option>
                                                <option value="TampilBarang.jsp?kategori=<%=request.getParameter("kategori")%>&sortby=nama&mode=ASC">Sort By Nama ASC</option>
                                                <option value="TampilBarang.jsp?kategori=<%=request.getParameter("kategori")%>&sortby=harga&mode=ASC">Sort By Harga ASC</option>
                                                <option value="TampilBarang.jsp?kategori=<%=request.getParameter("kategori")%>&sortby=nama&mode=DESC">Sort By Nama DESC</option>
                                                <option value="TampilBarang.jsp?kategori=<%=request.getParameter("kategori")%>&sortby=harga&mode=DESC">Sort By Harga DESC</option>
                                        </select>  
                            </div>
        
                            
                            <!-- Dagangan Baris 1 -->
                            <div class="frame">
                                <%                      
                                    Connection con = null;

                                    try {
                                            try { 
                                            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                                            }catch(ClassNotFoundException ce){out.println(ce);} 

                                    con = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");

                                    PreparedStatement st = null;
                                    ResultSet rs;
                                    
                                    String kategori =  request.getParameter("kategori");
                                    
                                    if(request.getParameter("sortby")==null) {
                                        st = con.prepareStatement("SELECT * FROM produk WHERE kategori=?");
                                        st.setString(1,kategori);
                                    } else {
                                 
                                        st = con.prepareStatement("SELECT * FROM produk WHERE kategori=? ORDER BY " + request.getParameter("sortby") + " " + request.getParameter("mode"));
                                        st.setString(1,kategori);
          
                                    }
                                    
                                    rs = st.executeQuery();
                                    st.clearParameters();

                                    while(rs.next()){ 
                                    
                                    
                                %>
                                    <div class="kolom-6 product">					
                                            <div class="frame">
                                                    <div class="kolom-6">
                                                            <img class="gambar" src="res/img/product/<%=rs.getString(6) %>" alt=""/>
                                                    </div>
                                                    <div class="kolom-6">
                                                            <p class="nama-produk-b"><a href="DetailBarang.jsp?operation=passing&id=<%=rs.getString(1) %>"><%=rs.getString(3) %></a></p>
                                                            <p class="harga">Harga: Rp<%=rs.getString(4) %>,00 /kg</p>
                                                            <div class="frame buy-bar">
                                                                    <form name="buy-form" action="buy.php" onsubmit="return validateForm('buy-form', 'buy', 'Banyaknya barang..')">
                                                                            <input class="kolom-9 buy-box" type="text" name="buy" value="Banyaknya barang.." onfocus="checkclear(this)" onblur="checkempty(this, 'Banyaknya barang..')"> 
                                                                            <input class="kolom-1 buy-button" type="submit" value="">
                                                                            <input type="hidden" name="jenis-dagangan" value="Daging Sapi">
                                                                    </form>					
                                                            </div>
                                                    </div>
                                            </div>
                                    </div>
                                 <% }
                                            } catch(Exception e) {
                                                out.println(e.toString());
                                            }
                                    %>

                            </div>
                            <!--End of Dagangan-->	

                    </div>

                <% }  else { %>
                    <div class="forbidden">Terjadi kesalahan pengaksesan halaman</div>
                <% } %>
		
	</div>
	
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>
	
</body>
</html>
