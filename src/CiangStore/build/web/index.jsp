<%-- 
    Document   : index
    Created on : Nov 26, 2013, 12:32:00 PM
    Author     : RiandyRN
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>CiangStore</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
</head>
<body>
	
	<div id="container">
		
                <jsp:include page="Header.jsp"/>
                <jsp:include page="Navbar.jsp"/>
		
		<br/>
		<a id="best-buy-btn" href="#best-buy" class="btn">See Best Buy!!</a>
		
		<!-- Slideshow Section -->
		<div id="slideshow" class="frame">
			<div class="item">
				<img class="img-konten" src="res/img/slideshow/sayuran_world.jpg" alt=""/>
				<div class="caption">
					<p class="text">
						Check out our snack section! We have a lot of snack 
						from Gulali World!!
					</p>
				</div>
			</div>
			<a href="#" class="btn-left">&lsaquo;</a>
			<a href="#" class="btn-right">&rsaquo;</a>
		</div>
		<img src="res/img/baloon.png" alt=""/>
		<!-- End of Section -->
		
		<div id="best-buy" class="frame">
			<div id="bbuy-text" class="kolom-4">
				<p id="bbuy-a">Best Buy</p>
				<p id="bbuy-b">Products</p>
			</div>
			<div class="kolom-8">
				<div class="frame">
					<div class="kolom-4 product">
						<%                      
                                                    Connection con = null;

                                                    try {
                                                            try { 
                                                            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                                                            }catch(ClassNotFoundException ce){out.println(ce);} 

                                                    con = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");

                                                    PreparedStatement st;
                                                    ResultSet rs;
                                                    
                                                    String kategori = "Daging";
                                                    st = con.prepareStatement("SELECT * FROM produk WHERE kategori=? ORDER BY jumlah_beli DESC LIMIT 0,1");
                                                    st.setString(1, kategori);
                                                    
                                                    rs = st.executeQuery();
                                                    st.clearParameters();

                                                    while(rs.next()){ 


                                                %>
                                                    <a href="DetailBarang.jsp?operation=passing&id=<%= rs.getString(1) %>">
                                                            <img class="gambar" src="res/img/product/<%= rs.getString(6) %>" alt=""/>
                                                            <p class="nama-produk"><%= rs.getString(3) %></p>
                                                            <p class="asal-produk">from <%= rs.getString(2) %></p>
                                                    </a>
                                                <% }
                                                    } catch(Exception e) {
                                                        out.println(e.toString());
                                                    }
                                                %>
					</div>
					<div class="kolom-4 product">
						<%                      
                                                    con = null;

                                                    try {
                                                            try { 
                                                            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                                                            }catch(ClassNotFoundException ce){out.println(ce);} 

                                                    con = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");

                                                    PreparedStatement st;
                                                    ResultSet rs;
                                                    
                                                    String kategori = "Sayuran";
                                                    st = con.prepareStatement("SELECT * FROM produk WHERE kategori=? ORDER BY jumlah_beli DESC LIMIT 0,1");
                                                    st.setString(1, kategori);
                                                    
                                                    rs = st.executeQuery();
                                                    st.clearParameters();

                                                    while(rs.next()){ 


                                                %>                                            
                                                    <a href="DetailBarang.jsp?operation=passing&id=<%= rs.getString(1) %>">
                                                            <img class="gambar" src="res/img/product/<%= rs.getString(6) %>" alt=""/>
                                                            <p class="nama-produk"><%= rs.getString(3) %></p>
                                                            <p class="asal-produk">from <%= rs.getString(2) %></p>
                                                    </a>
                                                <% }
                                                    } catch(Exception e) {
                                                        out.println(e.toString());
                                                    }
                                                %>                                                
					</div>
					<div class="kolom-4 product">
                                                <%                      
                                                    con = null;

                                                    try {
                                                            try { 
                                                            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                                                            }catch(ClassNotFoundException ce){out.println(ce);} 

                                                    con = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");

                                                    PreparedStatement st;
                                                    ResultSet rs;
                                                    
                                                    String kategori = "Beras";
                                                    st = con.prepareStatement("SELECT * FROM produk WHERE kategori=? ORDER BY jumlah_beli DESC LIMIT 0,1");
                                                    st.setString(1, kategori);
                                                    
                                                    rs = st.executeQuery();
                                                    st.clearParameters();

                                                    while(rs.next()){ 


                                                %> 
                                                    <a href="DetailBarang.jsp?operation=passing&id=<%= rs.getString(1) %>">
                                                            <img class="gambar" src="res/img/product/<%= rs.getString(6) %>" alt=""/>
                                                            <p class="nama-produk"><%= rs.getString(3) %></p>
                                                            <p class="asal-produk">from <%= rs.getString(2) %></p>
                                                    </a>
                                                <% }
                                                    } catch(Exception e) {
                                                        out.println(e.toString());
                                                    }
                                                %>
					</div>
					<div class="kolom-4 product">
                                                <%                      
                                                    con = null;

                                                    try {
                                                            try { 
                                                            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                                                            }catch(ClassNotFoundException ce){out.println(ce);} 

                                                    con = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");

                                                    PreparedStatement st;
                                                    ResultSet rs;
                                                    
                                                    String kategori = "FrozenFood";
                                                    st = con.prepareStatement("SELECT * FROM produk WHERE kategori=? ORDER BY jumlah_beli DESC LIMIT 0,1");
                                                    st.setString(1, kategori);
                                                    
                                                    rs = st.executeQuery();
                                                    st.clearParameters();

                                                    while(rs.next()){ 


                                                %>
                                                    <a href="DetailBarang.jsp?operation=passing&id=<%= rs.getString(1) %>">
                                                            <img class="gambar" src="res/img/product/<%= rs.getString(6) %>" alt=""/>
                                                            <p class="nama-produk"><%= rs.getString(3) %></p>
                                                            <p class="asal-produk">from <%= rs.getString(2) %></p>
                                                    </a>	
                                                <% }
                                                    } catch(Exception e) {
                                                        out.println(e.toString());
                                                    }
                                                %>   
					</div>
					<div class="kolom-4 product">
                                                <%                      
                                                    con = null;

                                                    try {
                                                            try { 
                                                            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                                                            }catch(ClassNotFoundException ce){out.println(ce);} 

                                                    con = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");

                                                    PreparedStatement st;
                                                    ResultSet rs;
                                                    
                                                    String kategori = "Snack";
                                                    st = con.prepareStatement("SELECT * FROM produk WHERE kategori=? ORDER BY jumlah_beli DESC LIMIT 0,1");
                                                    st.setString(1, kategori);
                                                    
                                                    rs = st.executeQuery();
                                                    st.clearParameters();

                                                    while(rs.next()){ 


                                                %>                                            
                                                    <a href="DetailBarang.jsp?operation=passing&id=<%= rs.getString(1) %>">
                                                            <img class="gambar" src="res/img/product/<%= rs.getString(6) %>" alt=""/>
                                                            <p class="nama-produk"><%= rs.getString(3) %></p>
                                                            <p class="asal-produk">from <%= rs.getString(2) %></p>
                                                    </a>
                                                <% }
                                                    } catch(Exception e) {
                                                        out.println(e.toString());
                                                    }
                                                %>                                                     
					</div>					
				</div>
			</div>
		</div>
	</div>
	
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>
	
</body>
</html>
