<%-- 
    Document   : AdminTambahProduk
    Created on : Nov 26, 2013, 9:52:56 PM
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
                    
                    if(request.getParameter("operation")!=null) {
                        
                        if(request.getParameter("operation").equals("insert")) {
                            
                            		Connection con = null;
					try {
						try { 
						Class.forName("com.mysql.jdbc.Driver").newInstance(); 
						}catch(ClassNotFoundException ce){out.println(ce);} 

					con = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");
					
					PreparedStatement st;
					String nama = request.getParameter("nama");
					String kategori = request.getParameter("kategori");
					String harga = request.getParameter("harga");
					String stok = request.getParameter("stok");
					String deskripsi = request.getParameter("deskripsi");
					String gambar = request.getParameter("gambar");
					
					st = con.prepareStatement("INSERT INTO produk(nama, kategori, harga, stok, deskripsi, gambar) VALUES (?,?,?,?,?,?)");
					st.setString(1,nama);
					st.setString(2,kategori);
					st.setString(3,harga);
					st.setString(4,stok);
					st.setString(5,deskripsi);
					st.setString(6,gambar);
					
					st.executeUpdate();
					st.clearParameters();
                                        
                                        out.println(nama + " sudah berhasil ditambahkan ke dalam database");
					
					con.close();
					} catch (Exception e) {out.println(e.toString()); };
                                                                               
                        }
                    }
                        
            %>               

                    <jsp:include page="Header.jsp"/>
                    <jsp:include page="AdminNavbar.jsp"/>  
                    
                    <div id="dagangan">

                        <!-- Dagangan Baris 1 -->
                        <div class="frame">


                                <div class="kolom-12 product">					
                                        <div class="frame">
                                                <div class="kolom-12 product-desc">
                                                    <form action="AdminTambahProduk.jsp" method="GET">
                                                        <p class="harga">Nama: <br/> <input name="nama" type="text"/></p>
                                                        <p class="harga">Kategori: <br/> <input name="kategori" type="text"/></p>
                                                        <p class="harga">Harga: <br/> <input name="harga" type="text"/></p>
                                                        <p class="harga">Stok:  <br/> <input name="stok" type="text"/></p>
                                                        <p class="harga">Deskripsi:  <br/> <input name="deskripsi" type="text"/></p>
                                                        <p class="harga">Gambar:  <br/> <input name="gambar" type="text"/></p>
                                                        <input name="operation" type="hidden" value="insert"/>
                                                        <input type="submit" class="btn" value="Tambah Produk"/>
                                                    </form>
                                                </div>
                                        </div>
                                </div>                                    
                        </div>
                        <!--End of Dagangan-->                    

                    </div>
            
            <%                  
                } else { %>
            
                <jsp:include page="ForbiddenPage.jsp"/>
            
            <% } %>
		
	</div>
	
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>	

</body>
</html>


