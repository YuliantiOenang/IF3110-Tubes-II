<!DOCTYPE HTML>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>Masukkan Judul Dokumen</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
</head>
<body>
	
                <jsp:include page="Header.jsp"/>
                <jsp:include page="Navbar.jsp"/>
		
		<div id="nama">
		<div id="form-registrasi" class="frame">
			<p id="registration-title">Pembelian</p>
			
				<p>&nbsp;</p>
		<%

           Connection con5 = null;

            try {
                    try { 
                    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                    }catch(ClassNotFoundException ce){out.println(ce);} 

            con5 = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");

            PreparedStatement st;
			
            ResultSet rs;
			String id = request.getParameter("id");
            st = con5.prepareStatement("SELECT total FROM cart where id =" +id);

            rs = st.executeQuery();
            st.clearParameters();

            while(rs.next()){

        %>
				<div class="kolom-6 product">					
					<div class="frame">
						<div class="kolom-6">
							<div class='kotak2' align="left"><%="Jumlah Harga :"%> <%= rs.getString(1) %></div>
							</div>
					</div>
				</div>
			      
			      
        <%
            }
            con5.close();
            } catch (Exception e) {out.println("boom1223"); };
        %>
		
		<%

            Connection con1 = null;

            try {
                    try { 
                    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                    }catch(ClassNotFoundException ce){out.println(ce);} 

            con1 = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");

            PreparedStatement st2;
			
         			
			String id = request.getParameter("id");
			String nama = request.getParameter("nama");
			String jumlah = request.getParameter("buy");
			String harga = request.getParameter("harga");
			String IdName = session.getAttribute("login_user").toString();

            
			st2 = con1.prepareStatement("DELETE FROM cart WHERE id =" +id);
			
			
			st2.executeUpdate("DELETE FROM cart WHERE id =" +id);
                        
                        st2 = con1.prepareStatement("update Customer set Transaksi = Transaksi+1 where IdName=?");
			st2.setString(1,IdName);		
			
			st2.executeUpdate();
			
            st2.clearParameters();
            

        %>
			
		<%
           
            con1.close();
            } catch (Exception e) {out.println("Unable to "); };
        %>
		
		<%

            Connection con7 = null;

            try {
                    try { 
                    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                    }catch(ClassNotFoundException ce){out.println(ce);} 

            con7 = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");

            PreparedStatement st2;
		
         			
			String id = request.getParameter("id");
			String nama = request.getParameter("nama");
			String jumlah = request.getParameter("buy");
			String harga = request.getParameter("harga");
			
                        PreparedStatement st_select;
                        ResultSet rs_select;
                        int Stok = 0;

                        st_select = con7.prepareStatement("SELECT stok FROM produk WHERE id=" +id);

                        rs_select = st_select.executeQuery();
                        st_select.clearParameters();
                        
                        while(rs_select.next()) {
                            Stok = rs_select.getInt(1);
                        }
                       
                        if(Stok-Integer.valueOf(jumlah) >= 0) {
                            st2 = con7.prepareStatement("update produk set stok = stok -" +jumlah+ " where id =" + id);						
                            st2.executeUpdate("update produk set stok = stok -" +jumlah+ " where id =" + id);			
                            st2.clearParameters();
                            
                            st2 = con7.prepareStatement("update produk set jumlah_beli = jumlah_beli + " + jumlah + " where id =" + id);
                            st2.executeUpdate();
                            st2.clearParameters();
                        } 
                        else 
                        {
                           
            

        %>
			
                            <p>Jumlah stok tidak mencukupi untuk dibeli. Jumlah stok tersedia: <%= Stok %></p>
        
        <%
                        }
            con7.close();
            } catch (Exception e) {out.println(e.toString()); };
        %>
		
				
		</div>
		<p>&nbsp;</p>
		<p id="thanks">Terima Kasih</p>
	</div>
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>
</body>
</html>