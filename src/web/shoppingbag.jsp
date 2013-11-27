<%@page import="java.sql.ResultSet"%>
<%@page import="koneksi.koneksi"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->

<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>
<script src="js/function1.js" language="javascript"></script>

</head>

<body>
 <%@include file="header.jsp" %>
<%
if(!found)
{
	%>
			<script type="text/javascript">
						window.alert("Maaf Anda harus LOGIN terlebih dahulu");
						window.location="index.jsp";
						</script>
		<%
}

%>

<div class = "bodymain">
	<%@include file="sidebar.jsp" %>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> MY SHOPPING BAG</p><br><br>
		</div>
                <%
                cookie = null;
                cookies = null;


                                            // Get an array of Cookies associated with this domain
                cookies = request.getCookies();


                if( cookies != null ){
                                               //out.println("<h2> Found Cookies Name and Value</h2>");

                for (int i = 0; i < cookies.length; i++)
                {
                    cookie = cookies[i];

                    String name=cookie.getName();
                    if(name.equals("IdCustomer"))
                    {
                      found=true;
                      nama=cookie.getValue();

                    }

                }
            }
                    int counter=0;
                    koneksi db=new koneksi();
                    try
                    {
                        db.dbopen();
                        ResultSet rs=db.stat.executeQuery("SELECT peralatan.no_alat, peralatan.foto, peralatan.nama, peralatan.harga, keranjang.jumlah,keranjang.pesan,keranjang.id_keranjang FROM keranjang,peralatan where id_customer='"+nama+"' and peralatan.no_alat=keranjang.id_alat");
                        while(rs.next())
                        {
                            out.print("<div class = 'toppreview'>"
                                     + "<div class = 'previmage'>"
                                     + "<img src='"+rs.getString(2)+"' class='resizeimage'>"
                                     + "</div>"
                                     + "<p class = 'copyrightext'> "+rs.getString(3) +" </br>"
                                     + "Rp"+rs.getString(4) +" </label> </br> Pesan : "+rs.getString(6) +" </br>"
                                     + "<input type='text' id='idKeranjang' value='"+rs.getString(7) +"' hidden/>"
                                     + "<input type='text' id='idBarang' value='"+rs.getString(1) +"' hidden/>"
                                     + "Jumlah: <input type='text' size=4 id='jumlahBarang' value='"+rs.getString(5) +"'/></br>"
                                     + "<input type='submit' value='change' onclick='cekJumlah()'></p>"
                                     + "</div>" );
                        }
                    }
                    catch(Exception e)
                    {
                        
                    }
                %>
		<%--<?php
			include "config/connect.php";
			
				$count=0;
				$hasil = mysql_query("SELECT peralatan.no_alat, peralatan.foto, peralatan.nama, peralatan.harga, keranjang.jumlah,keranjang.pesan FROM keranjang,peralatan where id_customer='".$_COOKIE['IdCustomer']."' and peralatan.no_alat=keranjang.id_alat");
				
				while(($baris=mysql_fetch_row($hasil)))
				{
				echo "<div class = 'toppreview'>
				<div class = 'previmage'>
					<img src='".$baris[1]."' class='resizeimage'>
				</div>
				
				<p class = 'copyrightext'> ".$baris[2]." </br>
					  Rp".$baris[3]." </label> </br> Pesan : ".$baris[5]." </br> 
					  
				<input type='text' id='idBarang' value='".$baris[0]."' hidden/>
				Jumlah: <input type='text' size=4 id='jumlahBarang' value='".$baris[4]."'/></br>
				
				<input type='submit' value='change' onclick='cekJumlah()'></p>
				</div>";
				}
			
		?>--%>
			<div class = "checkout">
			<input type="button" value="Detail Pembayaran" onclick="window.location='pembayaran.jsp'"/>
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