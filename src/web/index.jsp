<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="koneksi.koneksi"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->

</head>
<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>

<body>
    <%@include file="header.jsp" %>


<div class = "bodymain">
	<%@include file="sidebar.jsp" %>	
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> TOP THREE JACKETS</p></br>
		</div>
		<div class = "topthreecat">
			
                <%
                    int count=0;
                    koneksi db=new koneksi();
                    try
                    {
                           db.dbopen();
                           ResultSet rs2=db.stat.executeQuery("SELECT peralatan.no_alat,peralatan.nama,peralatan.harga,terbayar.jumlah,peralatan.foto FROM `terbayar`,`peralatan` where peralatan.no_alat=terbayar.id_barang and peralatan.kategori='Jaket' group by peralatan.nama order by terbayar.jumlah desc");
                           while(rs2.next() && count<3)
                           {
                              out.print("<div class='toppreview'>"
                              + "<div class = 'previmage'>"
                              + "<a href='detailbarang.php?id="+rs2.getString(1) +"'><img src='"+rs2.getString(5) +"' class='resizeimage'></a></div>"
                              + "<p class = 'copyrightext'> "+rs2.getString(2) +" </br>"
                              + "RP "+rs2.getString(3)+"</br></p>"
                              + "</div>");
                              count++; 
                           }
                   }
              catch(Exception e )
              {
                 out.println("error"+e);
              }
               db.con.close();
                %>
		</div>
		<div class = "topfivetitle">
		<p class = "title"> TOP THREE SWEATER</p></br>
		</div>
		<div class = "topthreecat">
		<%
                    count=0;
                    
                    try
                    {
                           db.dbopen();
                           ResultSet rs2=db.stat.executeQuery("SELECT peralatan.no_alat,peralatan.nama,peralatan.harga,terbayar.jumlah,peralatan.foto FROM `terbayar`,`peralatan` where peralatan.no_alat=terbayar.id_barang and peralatan.kategori='Sweater' group by peralatan.nama order by terbayar.jumlah desc");
                           while(rs2.next() && count<3)
                           {
                              out.print("<div class='toppreview'>"
                              + "<div class = 'previmage'>"
                              + "<a href='detailbarang.php?id="+rs2.getString(1) +"'><img src='"+rs2.getString(5) +"' class='resizeimage'></a></div>"
                              + "<p class = 'copyrightext'> "+rs2.getString(2) +" </br>"
                              + "RP "+rs2.getString(3)+"</br></p>"
                              + "</div>");
                              count++; 
                           }
                   }
              catch(Exception e )
              {
                 out.println("error"+e);
              }
                db.con.close();
                %>
		</div>
		<div class = "topfivetitle">
		<p class = "title"> TOP THREE T-SHIRTS</p></br>
		</div>
		<div class = "topthreecat">
                <%
                    count=0;
                    
                    try
                    {
                           db.dbopen();
                           ResultSet rs2=db.stat.executeQuery("SELECT peralatan.no_alat,peralatan.nama,peralatan.harga,terbayar.jumlah,peralatan.foto FROM `terbayar`,`peralatan` where peralatan.no_alat=terbayar.id_barang and peralatan.kategori='TShirt' group by peralatan.nama order by terbayar.jumlah desc");
                           while(rs2.next() && count<3)
                           {
                              out.print("<div class='toppreview'>"
                              + "<div class = 'previmage'>"
                              + "<a href='detailbarang.php?id="+rs2.getString(1) +"'><img src='"+rs2.getString(5) +"' class='resizeimage'></a></div>"
                              + "<p class = 'copyrightext'> "+rs2.getString(2) +" </br>"
                              + "RP "+rs2.getString(3)+"</br></p>"
                              + "</div>");
                              count++; 
                           }
                   }
              catch(Exception e )
              {
                 out.println("error"+e);
              }
                db.con.close();
                %>
		</div>
		<div class = "topfivetitle">
		<p class = "title"> TOP THREE MISC.</p></br>
		</div>
		<div class = "topthreecat">
                <%
                    count=0;
                    
                    try
                    {
                           db.dbopen();
                           ResultSet rs2=db.stat.executeQuery("SELECT peralatan.no_alat,peralatan.nama,peralatan.harga,terbayar.jumlah,peralatan.foto FROM `terbayar`,`peralatan` where peralatan.no_alat=terbayar.id_barang and peralatan.kategori='Misc' group by peralatan.nama order by terbayar.jumlah desc");
                           while(rs2.next() && count<3)
                           {
                              out.print("<div class='toppreview'>"
                              + "<div class = 'previmage'>"
                              + "<a href='detailbarang.php?id="+rs2.getString(1) +"'><img src='"+rs2.getString(5) +"' class='resizeimage'></a></div>"
                              + "<p class = 'copyrightext'> "+rs2.getString(2) +" </br>"
                              + "RP "+rs2.getString(3)+"</br></p>"
                              + "</div>");
                              count++; 
                           }
                   }
              catch(Exception e )
              {
                 out.println("error"+e);
              }
                db.con.close();
                %>
		</div>
		<div class = "topfivetitle">
		<p class = "title"> TOP THREE POKEMON</p></br>
		</div>
		<div class = "topthreecat">
                		<%
                    count=0;
                    
                    try
                    {
                           db.dbopen();
                           ResultSet rs2=db.stat.executeQuery("SELECT peralatan.no_alat,peralatan.nama,peralatan.harga,terbayar.jumlah,peralatan.foto FROM `terbayar`,`peralatan` where peralatan.no_alat=terbayar.id_barang and peralatan.kategori='Pokemon' group by peralatan.nama order by terbayar.jumlah desc");
                           while(rs2.next() && count<3)
                           {
                              out.print("<div class='toppreview'>"
                              + "<div class = 'previmage'>"
                              + "<a href='detailbarang.php?id="+rs2.getString(1) +"'><img src='"+rs2.getString(5) +"' class='resizeimage'></a></div>"
                              + "<p class = 'copyrightext'> "+rs2.getString(2) +" </br>"
                              + "RP "+rs2.getString(3)+"</br></p>"
                              + "</div>");
                              count++; 
                           }
                   }
              catch(Exception e )
              {
                 out.println("error"+e);
              }
                db.con.close();
                %>
		</div>
                </br>
                </br>
                </br>
                </br>
                </br>
                </br>
                               </br>
                </br>
                </br>
                </br>
                </br>
                </br>
		<div class = "mekanisme">
		<p class = "copyrightext"> Mekanisme Pembayaran </br></br>
		1. Pembeli melakukan login atau sign up
		2. Pembeli memesan produk-produk yang ingin dibeli </br>
		3. Pembeli melakukan checkout dengan memilih cart </br>
		4. Pembeli memilih mekanisme pembayaran, yaitu dengan kartu kredit yang dipilih </br>
		</div>
	</div>
	</div>
	<div class = "footer">
		<div class = "info">

		</div>
		
				
		
	</div>
</div>
</body>
</html> 


