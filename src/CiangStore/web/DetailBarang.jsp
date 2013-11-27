<%-- 
    Document   : DetailBarang
    Created on : Nov 27, 2013, 12:42:35 PM
    Author     : RiandyRN
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>DetailBarang</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
</head>
<body>
	
	<div id="container">
		
                <jsp:include page="Header.jsp"/>
                <jsp:include page="Navbar.jsp"/>
		
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

                                    PreparedStatement st = null;
                                    ResultSet rs;
                                    
                                    String id =  request.getParameter("id");
                                                                    
                                    st = con.prepareStatement("SELECT * FROM produk WHERE id=?");
                                    st.setString(1,id);
                                          
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
							<p class="nama-produk-b"><a href="#"><%=rs.getString(3)%></a></p>
							<p class="harga">Harga: Rp<%=rs.getString(4) %>,00 /kg</p>
                                                        <p class="harga">Stok: <%=rs.getString(7) %> pcs</p>
							<div class="frame buy-bar">
								<form name="buy-form" action="cart.jsp" onsubmit="return validateForm('buy-form', 'buy', 'Banyaknya barang..')">
                                                                        Deskripsi: <br/> <textarea name="desc"></textarea>
                                                                        <input class="kolom-9 buy-box" type="text" name="buy" value="Banyaknya barang.." onfocus="checkclear(this)" onblur="checkempty(this, 'Banyaknya barang..')"> 
									<% if(session.getAttribute("login_user")!=null) { %>
                                                                            <input class="kolom-1 buy-button" type="submit" value="">
                                                                        <% } %>
									<input type="hidden" name="nama" value="<%=rs.getString(3) %>">
									<input type="hidden" name="id" value="<%=rs.getString(1) %>">
									<input type="hidden" name="harga" value="<%=rs.getString(4) %>">
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
                </div>

		
	</div>
	
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>
	
</body>
</html>