<h3 class='judul_halaman'>Barang terpopuler</h3>
<%-- 
    Document   : home
    Created on : Nov 26, 2013, 11:32:43 PM
    Author     : Muhammad Iqbal
--%>

<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            Connection koneksi = null;
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
            Statement stm = koneksi.createStatement();                    
            ResultSet hasil = stm.executeQuery("select * from kategori");
			while(hasil.next()){
				out.print("<div class='category_container'>");
				out.print("<span class='category'>");
				out.print("<img src='assets/icon_recommend.png' height='16'/>'");
				out.print("");
				out.print("<a href='barang.jsp?kategori="+hasil.getString("id_kategori")+"'>");
				out.print(hasil.getString("nama_kategori"));
				out.print("</a>");
				out.print("</span>");
				out.print("<br>");
				out.print("<br>");
				Statement stm1 = koneksi.createStatement();                    
				ResultSet hasil1 = stm1.executeQuery("select * from barang where barang.id_kategori = "+hasil.getString("id_kategori")+" order by dibeli desc limit 0, 3");
				out.print("<div class='barang_container'>");
				while(hasil1.next()){
					out.print("<div class='barang'>");
					out.print("<a href='detilbarang.jsp?id="+hasil1.getString("id_barang")+"'>");
					out.print("<img src='assets/barang/"+hasil1.getString("gambar")+"' height='100%'/>");
					out.print("</a>");
					out.print("<br>");
					out.print("<span class='barang_nama'>");
					out.print("<a href='detilbarang.jsp?id="+hasil1.getString("id_barang")+"'>");
					out.print(hasil1.getString("nama_barang"));
					out.print("</a>");
					out.print("</span>");
					out.print("<br>");
					if(hasil1.getString("tersedia")=="0"){
						out.print("<span class='barang_tersedia'>");
						out.print("Barang tidak tersedia");
						out.print("</span>");
						out.print("<br>");
					}
					else{
						out.print("<span class='barang_tersedia'>");
						out.print("Barang tersedia ("+hasil1.getString("tersedia")+" unit)");
						out.print("</span>");
						out.print("<br>");
					}
					out.print("<span class='barang_harga'>");
					out.print("Rp "+hasil1.getString("harga_barang")+",00'");
					out.print("</span>");
					out.print("<br>");
					out.print("</div>");
				}
				out.print("<br>");
				out.print("<br>");
				out.print("</div>");
				out.print("</div>");
				out.print("<hr/>");
				}
        %>
