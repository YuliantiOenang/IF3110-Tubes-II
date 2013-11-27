<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="koneksi.koneksi"%>
<%
    koneksi db=new koneksi();
    Cookie cookie = null;
    Cookie[] cookies = null;
    boolean found=false;
    String nama=null;
                                    
                                    // Get an array of Cookies associated with this domain
    cookies = request.getCookies();

    if( cookies != null )
    {
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
    if(request.getParameter("jumlah").equals("0"))
    {
        %>
				<script type="text/javascript">
							window.alert("Tidak ada barang yang di beli");
							window.location="pembayaran.jsp";
				</script>
	<%
    }
    try
    {
        String haveCard=null;
        db.dbopen();
        ResultSet rs=db.stat.executeQuery("select card_number from customer where no_customer='"+nama+"'");
        while(rs.next())
        {
            haveCard=rs.getString(1);
        }
        
        if(haveCard==null)
        {
            %>
                <script type="text/javascript">
                        window.alert("Maaf Anda belum mendaftarkan kartu kredit anda");
                        window.location="registrasi_kartu.jsp?status=payment";
                </script>
            <%
        }
        boolean bool;
        bool=true;
        
        Statement stmt=db.con.createStatement();
        rs=stmt.executeQuery("select jumlah from keranjang where id_customer='"+nama+"'");
        while(rs.next())
        {
            PreparedStatement pstmt=db.con.prepareStatement("select jumlah from peralatan where no_alat='"+rs.getString(1)+"'");
            ResultSet rs2=pstmt.executeQuery();
            while(rs2.next())
            {
                if(Integer.parseInt(rs2.getString(1))<Integer.parseInt(rs.getString(1)))
                {
                    bool = false;
                }
            }
        }
        rs.close();
        boolean boolChek=true;
	if(bool)
	{   
            rs=stmt.executeQuery("select id_alat,pesan,jumlah from keranjang where id_customer='"+nama+"'");
            while(rs.next())
                {
                    PreparedStatement pstmt=db.con.prepareStatement("select jumlah from peralatan where no_alat='"+rs.getString(1) +"'");
                    ResultSet rs2=pstmt.executeQuery("select jumlah from peralatan where no_alat='"+rs.getString(1) +"'");
                    while(rs2.next())
                    {
                       if(Integer.parseInt(rs2.getString(1))<Integer.parseInt(rs.getString(3)))
                       {
                            bool = false;
                       }
                       db.stat.executeUpdate("INSERT INTO `terbayar`(`id_barang`, `jumlah`, `id_costumer`,`pesan`) VALUES ('"+rs.getString(1) +"','"+rs.getString(3) +"','"+nama+"','"+rs.getString(2)+"')");
                       int newCount=Integer.parseInt(rs2.getString(1))-Integer.parseInt(rs.getString(3));
                       db.stat.executeUpdate("UPDATE `peralatan` SET `jumlah`="+newCount+" WHERE no_alat='"+rs.getString(1) +"'");
                       db.stat.executeUpdate("DELETE FROM `keranjang` WHERE id_customer='"+nama+"'");
                    }  
                       
                }
        }
        else
        {
            %>
                <script type="text/javascript">
			window.alert("Gagal Membeli, benda kurang");
			window.location="index.jsp";
		</script>
            <%
        }
        %>
		<script type="text/javascript">
		window.alert("Berhasil Membeli");
		window.location="index.jsp";
		</script>
	<%
        
    }
    catch(Exception e)
    {
       out.print(e);
    }
%>
<%--<?php
  include "config/connect.php";
  if($_GET['jumlah'] == 0)
  {
  ?>
				<script type="text/javascript">
							window.alert("Tidak ada barang yang di beli");
							window.location="pembayaran.php";
				</script>
	<?php
  }
  
  $cekCreditCard= mysql_query("select card_number from customer where no_customer='".$_COOKIE['IdCustomer']."'");
	  while($cardNum=mysql_fetch_row($cekCreditCard))
	  {
		$haveCard=$cardNum[0];
	  }
	if($haveCard=='')
	{
		?>
				<script type="text/javascript">
							window.alert("Maaf Anda belum mendaftarkan kartu kredit anda");
							window.location="registrasi_kartu.php?status=payment";
				</script>
		<?php
	}
	
  
  $bool=true;
			$mysql1=mysql_query("select id_alat from keranjang where id_customer='".$_COOKIE['IdCustomer']."'");
			while($baris=mysql_fetch_row($mysql1))
			{
				$mysql=mysql_query("select jumlah from peralatan where no_alat='".$baris[0]."'");
				while($baris1=mysql_fetch_row($mysql))
				{	
					if($baris1[0]<$baris[0])
					{
						$bool=false;
					}
					
				}
			}
			$boolChek=true;
			if($bool)
			{
			$mysql1=mysql_query("select id_alat,pesan,jumlah from keranjang where id_customer='".$_COOKIE['IdCustomer']."'");
			while($baris=mysql_fetch_row($mysql1))
			{
				$mysql=mysql_query("select jumlah from peralatan where no_alat='".$baris[0]."'");
				while($baris1=mysql_fetch_row($mysql))
				{	
					if($baris1[0]<$baris[2])
					{
						$bool=false;
					}
					$mysql3=mysql_query("INSERT INTO `terbayar`(`id_barang`, `jumlah`, `id_costumer`,`pesan`) VALUES ('".$baris[0]."','".$baris[2]."','".$_COOKIE['IdCustomer']."','".$baris[1]."')")  or die(mysql_error());
					$newCount=$baris1[0]-$baris[2];
					$mysql4=mysql_query("UPDATE `peralatan` SET `jumlah`=".$newCount." WHERE no_alat='".$baris[0]."'");
					$mysql5=mysql_query("DELETE FROM `keranjang` WHERE id_customer='".$_COOKIE['IdCustomer']."'");
					if(!$mysql3 || !$mysql4 || !$mysql5)
					{
						$boolChek=false;
					}
					
				}
			}
			if($boolChek)
			{
			?>
				<script type="text/javascript">
							window.alert("Berhasil Membeli");
							window.location="index.php";
				</script>
			<?php
			}
			else
			{
				?>
				<script type="text/javascript">
							window.alert("Gagal membeli, terdapat kesalahan dalam akses database");
							window.location="index.php";
				</script>
			<?php
			}
			}
			else
			{
				?>
				<script type="text/javascript">
							window.alert("Gagal Membeli, benda kurang");
							window.location="index.php";
				</script>
			<?php
			}
			
         
     
?>--%>