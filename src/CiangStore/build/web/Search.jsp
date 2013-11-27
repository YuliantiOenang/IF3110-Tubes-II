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
		
            <% if(request.getParameter("src")!=null) { %>
                <jsp:include page="Header.jsp"/>

                    <!-- Navbar Section -->
                    <p id="src-title">Search Result(s) for <span class="src-param">"<%= request.getParameter("src")%>"</span></p>
                    <!-- End of Navbar -->

                    <div id="dagangan">

                            <!-- Dagangan Baris 1 -->
                            <div class="frame">
                                <%                      
                                    Connection con = null;

                                    try {
                                            try { 
                                            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                                            }catch(ClassNotFoundException ce){out.println(ce);} 

                                    con = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");

                                    PreparedStatement st;
                                    ResultSet rs;
                                    
                                    String src =  request.getParameter("src");
                                    src = "%" + src + "%";

                                    st = con.prepareStatement("SELECT * FROM produk WHERE ((nama LIKE ?) OR (harga LIKE ?) OR (kategori LIKE ?))");
                                    st.setString(1,src);
                                    st.setString(2,src);
                                    st.setString(3,src);
                                    
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

                    <div id="pagination">
                            <ul>
                                    <li><a href="#">&laquo;First</a></li>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">Last&raquo;</a></li>
                            </ul>
                    </div>
                <% } %>
		
	</div>
	
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>
	
</body>
</html>