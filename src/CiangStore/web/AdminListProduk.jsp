<%-- 
    Document   : AdminListProduk
    Created on : Nov 26, 2013, 12:46:29 PM
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
	<title>AdminPanel</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
</head>
<body>

	<div id="container">
		
            <% if (session.getAttribute("Role").equals(1)) { %>
                
                <jsp:include page="Header.jsp"/>
                <jsp:include page="AdminNavbar.jsp"/>

                
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
                        
                        if(request.getParameter("operation")!=null) {
                            if(request.getParameter("operation").equals("delete")) {
                                Connection con_delete = null;
                                try {
                                    con_delete = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");
                                    
                                    PreparedStatement st_delete;
                                    st_delete = con_delete.prepareStatement("DELETE FROM produk WHERE id=?");
                                    st_delete.setString(1,request.getParameter("id"));
                                    st_delete.executeUpdate();
                                    st_delete.clearParameters();
                                    
                                } catch(Exception e) {
                                    out.println(e.toString());
                               }
                            }
                        }

                        st = con.prepareStatement("SELECT * FROM produk");

                        rs = st.executeQuery();
                        st.clearParameters();

                        while(rs.next()){

                    %>
                            
                            <div class="kolom-6 product">					
                                    <div class="frame">
                                            <div class="kolom-6">
                                                    <img class="gambar" src="res/img/product/<%=rs.getString(6) %>" alt=""/>
                                            </div>
                                            <div class="kolom-6 product-desc">
                                                    <p class="nama-produk-b"><a href="AdminDetailBarang.jsp?operation=passing&id=<%=rs.getString(1) %>"><%=rs.getString(3) %></a></p>
                                                    <p class="harga">Harga: Rp<%=rs.getString(4) %>,00 /kg</p>
                                                    <p class="harga">Stok: <%=rs.getString(7) %> pcs</p>
                                                    <a href="AdminListProduk.jsp?operation=delete&id=<%=rs.getString(1)%>" class="btn btn-delete">Hapus Item</a>
                                            </div>
                                    </div>
                            </div>

                    <%
                        }
                        con.close();
                        } catch (Exception e) {out.println(e.toString()); };
                    %>
                    </div>
                    <!--End of Dagangan-->                    
                    
                </div>
                
            <% } else { %>
            
                <jsp:include page="ForbiddenPage.jsp"/>
            
            <% } %>
		
	</div>
	
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>	

</body>
</html>
