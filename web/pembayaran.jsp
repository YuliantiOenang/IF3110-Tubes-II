<%@page import="java.sql.ResultSet"%>
<%@page import="koneksi.koneksi"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->
<%--<?php
if(!isset($_COOKIE['user1']))
{
	?>
			<script type="text/javascript">
						window.alert("Maaf Anda harus LOGIN terlebih dahulu");
						window.location="index.php";
						</script>
		<?php
}

?>--%>
<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>

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
		<p class = "title"> CHECKOUT</p></br></br>
		</div>
		<div class= "bayar"> 
			<div class= "isibayar">
			<label>Produk</label>
			</div>
			<div class= "isibayar">
			<label>Jumlah</label>
			</div>
			<div class= "isibayar">
			<label>Harga</label>
			</div>
		</div>
		
		<div class= "bayar"> 
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
                    koneksi db=new koneksi();
                    int total=0;
                    int jumlahBarang=0;
                    try
                    {
                        db.dbopen();
                        ResultSet rs=db.stat.executeQuery("SELECT peralatan.no_alat, peralatan.foto, peralatan.nama, peralatan.harga, keranjang.jumlah,keranjang.pesan FROM keranjang,peralatan where id_customer='"+nama+"' and peralatan.no_alat=keranjang.id_alat");
                        while(rs.next())
                        {
                            out.print("<div class= 'isibayar'>"
                                    +rs.getString(3)+"</div>"
                                    + "<div class= 'isibayar'>"
                                    + rs.getString(5)+"</div>"
                                    + "<div class= 'isibayar'>"
                                    + rs.getString(4)+"</div>");
					total+=Integer.parseInt(rs.getString(4))*Integer.parseInt(rs.getString(5));
					jumlahBarang+=Integer.parseInt(rs.getString(5));
                        }
                    }
                    catch(Exception e)
                    {
                        
                    }
                %>
		<%--<?php
			include "config/connect.php";
			
				$total=0;
				$jumlahBarang=0;
				$hasil = mysql_query("SELECT peralatan.no_alat, peralatan.foto, peralatan.nama, peralatan.harga, keranjang.jumlah,keranjang.pesan FROM keranjang,peralatan where id_customer='".$_COOKIE['IdCustomer']."' and peralatan.no_alat=keranjang.id_alat");
				
				while(($baris=mysql_fetch_row($hasil)))
				{
				
				echo "<div class= 'isibayar'>
						".$baris[2]."
					</div>
					<div class= 'isibayar'>
					".$baris[4]."
					</div>
					<div class= 'isibayar'>
					".$baris[3]."
					</div>";
					$total+=$baris[3]*$baris[4];
					$jumlahBarang+=$baris[4];
				}
			
		?>--%>
			
		</div>
		<div class= "bayar"> 
		<div class= "isitotal">
		<label>Total</label>
			</div>
			<div class= "isibayar">
                            <% out.print(total) ; %>
			</div>
			
			
		</div>	</br></br>
			<div class = "registerspace">
			<input type="button" value = "Confirm" onclick="window.location='payment.jsp?jumlah=<%  out.print(total) ; %>'"><br>
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