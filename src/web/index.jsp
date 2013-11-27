<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connect.connect"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->
<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>
</head>


<body>
<%@include file="header.jsp"%>
    
<div class = "bodymain">
    <%@include file="sidebar.jsp"%>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> TOP THREE JACKETS</p></br>
		</div>
		<div class = "topthreecat">
                    <%
                        int count = 0;
                        connect koneksion = new connect();
                        koneksion.dbopen();
                        PreparedStatement st1 = koneksion.con.prepareStatement("SELECT peralatan.no_alat,peralatan.nama,peralatan.harga,terbayar.jumlah,peralatan.foto FROM `terbayar`,`peralatan` where peralatan.no_alat=terbayar.id_barang and peralatan.kategori='Jaket' group by peralatan.nama order by terbayar.jumlah desc");
                        ResultSet rs1 = st1.executeQuery();
                        rs1.last();
                        if(rs1.getRow()!=0){
                            rs1.beforeFirst();
                            while(!rs1.isLast() && count < 3){
                                rs1.next();
                                out.println("<div class = 'toppreview'><div class = 'previmage'><a href='detailbarang.jsp?id="+ rs1.getString(1) + "'><img src='" + rs1.getString(5) +"' class='resizeimage'></a></div><p class = 'copyrightext'>"+ rs1.getString(2) + "</br>Rp"+ rs1.getString(3) +" </label> </br> </p></div>");
                                count++;
                            }
                        }
                    %>
                    <%--
                    <?php
				$count=0;
				$hasil = mysql_query("SELECT peralatan.no_alat,peralatan.nama,peralatan.harga,terbayar.jumlah,peralatan.foto FROM `terbayar`,`peralatan` where peralatan.no_alat=terbayar.id_barang and peralatan.kategori='Jaket' group by peralatan.nama order by terbayar.jumlah desc");
				while(($baris=mysql_fetch_row($hasil)) && $count<3)
				{
				echo "<div class = 'toppreview'>
					<div class = 'previmage'>
						<a href='detailbarang.jsp?id=".$baris[0]."'><img src='".$baris[4]."' class='resizeimage'></a>
					</div>
					<p class = 'copyrightext'> ".$baris[1]." </br>
					  Rp".$baris[2]." </label> </br> </p>
				</div>";
						$count++;
				}
			?>
                        --%>
		</div>
		<div class = "topfivetitle">
		<p class = "title"> TOP THREE SWEATER</p></br>
		</div>
		<div class = "topthreecat">
                    <%
                        count = 0;
                        
                        PreparedStatement st2 = koneksion.con.prepareStatement("SELECT peralatan.no_alat,peralatan.nama,peralatan.harga,terbayar.jumlah,peralatan.foto FROM `terbayar`,`peralatan` where peralatan.no_alat=terbayar.id_barang and peralatan.kategori='Sweater' group by peralatan.nama order by terbayar.jumlah desc");
                        ResultSet rs2 = st2.executeQuery();
                        rs2.last();
                        if(rs2.getRow()!=0){
                            rs2.beforeFirst();
                            while(!rs2.isLast() && count < 3){
                                rs2.next();
                                out.println("<div class = 'toppreview'><div class = 'previmage'><a href='detailbarang.jsp?id="+ rs2.getString(1) + "'><img src='" + rs2.getString(5) +"' class='resizeimage'></a></div><p class = 'copyrightext'>"+ rs2.getString(2) + "</br>Rp"+ rs2.getString(3) +" </label> </br> </p></div>");
                                count++;
                            }
                        }
                    %>
			<%--
                        <?php
				$count=0;
				$hasil = mysql_query("SELECT peralatan.no_alat,peralatan.nama,peralatan.harga,terbayar.jumlah,peralatan.foto FROM `terbayar`,`peralatan` where peralatan.no_alat=terbayar.id_barang and peralatan.kategori='Sweater' group by peralatan.nama order by terbayar.jumlah desc");
				while(($baris=mysql_fetch_row($hasil)) && $count<3)
				{
				echo "<div class = 'toppreview'>
					<div class = 'previmage'>
						<a href='detailbarang.jsp?id=".$baris[0]."'><img src='".$baris[4]."' class='resizeimage'></a>
					</div>
					<p class = 'copyrightext'> ".$baris[1]." </br>
					  Rp".$baris[2]." </label> </br> </p>
				</div>";
						$count++;
				}
			?>
                        --%>
		</div>
		<div class = "topfivetitle">
		<p class = "title"> TOP THREE T-SHIRTS</p></br>
		</div>
		<div class = "topthreecat">
                    <%
                        count = 0;
                        
                        PreparedStatement st3 = koneksion.con.prepareStatement("SELECT peralatan.no_alat,peralatan.nama,peralatan.harga,terbayar.jumlah,peralatan.foto FROM `terbayar`,`peralatan` where peralatan.no_alat=terbayar.id_barang and peralatan.kategori='TShirt' group by peralatan.nama order by terbayar.jumlah desc");
                        ResultSet rs3 = st3.executeQuery();
                        rs3.last();
                        if(rs3.getRow()!=0){
                            rs3.beforeFirst();
                            while(!rs3.isLast() && count < 3){
                                rs3.next();
                                out.println("<div class = 'toppreview'><div class = 'previmage'><a href='detailbarang.jsp?id="+ rs3.getString(1) + "'><img src='" + rs3.getString(5) +"' class='resizeimage'></a></div><p class = 'copyrightext'>"+ rs3.getString(2) + "</br>Rp"+ rs3.getString(3) +" </label> </br> </p></div>");
                                count++;
                            }
                        }
                    %>
			<%--
                        <?php
				$count=0;
				$hasil = mysql_query("SELECT peralatan.no_alat,peralatan.nama,peralatan.harga,terbayar.jumlah,peralatan.foto FROM `terbayar`,`peralatan` where peralatan.no_alat=terbayar.id_barang and peralatan.kategori='TShirt' group by peralatan.nama order by terbayar.jumlah desc");
				while(($baris=mysql_fetch_row($hasil)) && $count<3)
				{
				echo "<div class = 'toppreview'>
					<div class = 'previmage'>
						<a href='detailbarang.jsp?id=".$baris[0]."'><img src='".$baris[4]."' class='resizeimage'></a>
					</div>
					<p class = 'copyrightext'> ".$baris[1]." </br>
					  Rp".$baris[2]." </label> </br> </p>
				</div>";
						$count++;
				}
			?>
                        --%>
		</div>
		<div class = "topfivetitle">
		<p class = "title"> TOP THREE MISC.</p></br>
		</div>
		<div class = "topthreecat">
                    <%
                        count = 0;
                        
                        PreparedStatement st4 = koneksion.con.prepareStatement("SELECT peralatan.no_alat,peralatan.nama,peralatan.harga,terbayar.jumlah,peralatan.foto FROM `terbayar`,`peralatan` where peralatan.no_alat=terbayar.id_barang and peralatan.kategori='Misc' group by peralatan.nama order by terbayar.jumlah desc");
                        ResultSet rs4 = st4.executeQuery();
                        rs4.last();
                        if(rs4.getRow()!=0){
                            rs4.beforeFirst();
                            while(!rs4.isLast() && count < 3){
                                rs4.next();
                                out.println("<div class = 'toppreview'><div class = 'previmage'><a href='detailbarang.jsp?id="+ rs4.getString(1) + "'><img src='" + rs4.getString(5) +"' class='resizeimage'></a></div><p class = 'copyrightext'>"+ rs4.getString(2) + "</br>Rp"+ rs4.getString(3) +" </label> </br> </p></div>");
                                count++;
                            }
                        }
                    %>
			<%--
                        <?php
				$count=0;
				$hasil = mysql_query("SELECT peralatan.no_alat,peralatan.nama,peralatan.harga,terbayar.jumlah,peralatan.foto FROM `terbayar`,`peralatan` where peralatan.no_alat=terbayar.id_barang and peralatan.kategori='Misc' group by peralatan.nama order by terbayar.jumlah desc");
				while(($baris=mysql_fetch_row($hasil)) && $count<3)
				{
				echo "<div class = 'toppreview'>
					<div class = 'previmage'>
						<a href='detailbarang.jsp?id=".$baris[0]."'><img src='".$baris[4]."' class='resizeimage'></a>
					</div>
					<p class = 'copyrightext'> ".$baris[1]." </br>
					  Rp".$baris[2]." </label> </br> </p>
				</div>";
						$count++;
				}
			?>
                        --%>
		</div>
		<div class = "topfivetitle">
		<p class = "title"> TOP THREE POKEMON</p></br>
		</div>
		<div class = "topthreecat">
                    <%
                        count = 0;
                        
                        PreparedStatement st5 = koneksion.con.prepareStatement("SELECT peralatan.no_alat,peralatan.nama,peralatan.harga,terbayar.jumlah,peralatan.foto FROM `terbayar`,`peralatan` where peralatan.no_alat=terbayar.id_barang and peralatan.kategori='Pokemon' group by peralatan.nama order by terbayar.jumlah desc");
                        ResultSet rs5 = st5.executeQuery();
                        rs5.last();
                        if(rs5.getRow()!=0){
                            rs5.beforeFirst();
                            while(!rs5.isLast() && count < 3){
                                rs5.next();
                                out.println("<div class = 'toppreview'><div class = 'previmage'><a href='detailbarang.jsp?id="+ rs5.getString(1) + "'><img src='" + rs5.getString(5) +"' class='resizeimage'></a></div><p class = 'copyrightext'>"+ rs5.getString(2) + "</br>Rp"+ rs5.getString(3) +" </label> </br> </p></div>");
                                count++;
                            }
                        }
                    %>
                    <%--
                    <?php
				$count=0;
				$hasil = mysql_query("SELECT peralatan.no_alat,peralatan.nama,peralatan.harga,terbayar.jumlah,peralatan.foto FROM `terbayar`,`peralatan` where peralatan.no_alat=terbayar.id_barang and peralatan.kategori='Pokemon' group by peralatan.nama order by terbayar.jumlah desc");
				while(($baris=mysql_fetch_row($hasil)) && $count<3)
				{
				echo "<div class = 'toppreview'>
					<div class = 'previmage'>
						<a href='detailbarang.jsp?id=".$baris[0]."'><img src='".$baris[4]."' class='resizeimage'></a>
					</div>
					<p class = 'copyrightext'> ".$baris[1]." </br>
					  Rp".$baris[2]." </label> </br> </p>
				</div>";
						$count++;
				}
			?>
                    --%>
		</div>
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