<%@page import="java.sql.ResultSet"%>
<%@page import="koneksi.koneksi"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->
<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>

</head>

<body>
 <%@include file="header.jsp" %>


<div class = "bodymain">
	<%@include file="sidebar.jsp" %>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> PRODUCT DETAIL</p></br></br>
		</div>
		
			<div class = "toppreview">
				<div class = "previmage">
					
                        <%
                            koneksi db=new koneksi();
                            String namaa=null;
                            String kategori=null;
                            String deskripsii=null;
							String harga=null;
							String jumlah=null;
							String foto=null;
                            try
                            {
                                db.dbopen();
                                ResultSet rs=db.stat.executeQuery("select nama, kategori,harga,deskripsi,foto,jumlah from peralatan where no_alat="+request.getParameter("id") +"");
                                while(rs.next())
                                {
                                    
                                    out.print("<img src= '../"+rs.getString(5)+"' class='resizeimage'><img>");
                                    namaa=rs.getString(1);
                                    kategori=rs.getString(3);
                                    deskripsii=rs.getString(4);
									harga=rs.getString(2);
									jumlah=rs.getString(6);
									foto=rs.getString(5);
                                }
                            }
                            catch(Exception e)
                            {
                                
                            }
                        %>
			<%--<?php
				
				$hasil = mysql_query("select nama, kategori,harga,deskripsi,foto from peralatan where no_alat=".$_GET['id']."");
				while(($baris=mysql_fetch_row($hasil)))
				{
				echo '<img src= "../'.$baris[4].'" class="resizeimage"><img>';
				$nama=$baris[0];
				$kategori=$baris[2];
				$deskripsi=$baris[3];
				}
			?>--%>
				</div>
			 
			</div>
			 <div class = "detail">
                    <p> Nama Produk : <% out.print(namaa);%></p>
					<p> Harga Produk : <% out.print("Rp "+kategori);%></p>
					<p> Deskripsi : <% out.print(deskripsii);%></p>
                                        <input hidden id='id' name='id' value="<% out.print(request.getParameter("id"));%>"/>
					<% if(found)
					{
					%>
					<a href="update.jsp?id=<%out.print(request.getParameter("id")+"&nama1="+namaa+"&kategori="+harga+"&harga="+kategori+"&deskripsi="+deskripsii+"&jumlah="+jumlah+"");%>"><input type="button" value="Update"/></a>
					<a href="delete.jsp?id=<%out.print(request.getParameter("id")+"&nama="+namaa+"&foto="+foto+"");%>"><input type="button" value="Delete"/></a>
					<%
					}
					%>
					</div>
			</div>
			</div>
			
			
			
	
	<div class = "footer">
		<div class = "info">

		</div>
		
				
		
	</div>

</body>
</html>