<%-- 
    Document   : AdminDetailBarang
    Created on : Nov 26, 2013, 7:04:31 PM
    Author     : RiandyRN
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>AdminPanel</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
</head>
<body>

	<div id="container">
		
            <% 

                if (session.getAttribute("Role").equals(1)) { 

                    String operation = request.getParameter("operation");
                    if(operation.equals("passing")) {
                
            %>               

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

                            st = con.prepareStatement("SELECT * FROM produk WHERE id=?");
                            st.setString(1, request.getParameter("id"));

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
                                                    <form action="AdminDetailBarang.jsp" method="POST">
                                                        <p class="harga">Nama: <br/> <input name="nama" value="<%=rs.getString(3)%>" /></p>
                                                        <p class="harga">Kategori: <br/> <input name="kategori" value="<%=rs.getString(2)%>" /></p>
                                                        <p class="harga">Harga: <br/> <input name="harga" value="<%=rs.getString(4) %>" type="text"/></p>
                                                        <p class="harga">Stok:  <br/> <input name="stok" value="<%=rs.getString(7) %>" type="text"/></p>
                                                        <p class="harga">Deskripsi:  <br/> <input name="deskripsi" value="<%=rs.getString(5) %>" type="text"/></p>
                                                        <p class="harga">Gambar:  <br/> <input name="gambar" value="<%=rs.getString(6) %>" type="text"/></p>
                                                        <input name="operation" type="hidden" value="update"/>
                                                        <input name="id" type="hidden" value="<%=rs.getString(1) %>"/>
                                                        <input type="submit" class="btn" value="Update"/>
                                                    </form>
                                                </div>
                                        </div>
                                </div>
                        <%
                            }
                            con.close();
                            } catch (Exception e) {out.println("Unable to connect to database."); };
                        %>                                     
                        </div>
                        <!--End of Dagangan-->                    

                    </div>
                
                        <%   } else if(operation.equals("update")){
                                
                                Connection con = null;
                                try {
                                        try { 
                                        Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                                        }catch(ClassNotFoundException ce){out.println(ce);} 

                                con = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");

                                PreparedStatement pst;
                                String nama = request.getParameter("nama");
                                String kategori = request.getParameter("kategori");
                                String harga = request.getParameter("harga");
                                String stok = request.getParameter("stok");
                                String deskripsi = request.getParameter("deskripsi");
                                String gambar = request.getParameter("gambar");
                                String id = request.getParameter("id");
                                
                                pst = con.prepareStatement("UPDATE produk SET nama=? ,kategori=? ,harga=? ,stok=? ,deskripsi=? ,gambar=? WHERE id=?");
                                pst.setString(1,nama);
                                pst.setString(2,kategori);
                                pst.setString(3,harga);
                                pst.setString(4,stok);
                                pst.setString(5,deskripsi);
                                pst.setString(6,gambar);
                                pst.setString(7,id);

                                pst.executeUpdate();
                                pst.clearParameters();

                                con.close();
                                out.println("Update sudah berhasil dilakukan");
                                
                                %>
                                
                                <br />
                                <a href="AdminListProduk.jsp">Kembali ke laman List Produk-Produk</a>
                                
                                <%
                                } catch (Exception e) {out.println(e.toString()); };                           
                            
                             }
              } else { 
            %>
            
                <jsp:include page="ForbiddenPage.jsp"/>
            
            <% } %>
		
	</div>
	
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>	

</body>
</html>

