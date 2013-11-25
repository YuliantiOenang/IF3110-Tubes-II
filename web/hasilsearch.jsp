<%@page import="java.sql.ResultSet"%>
<%@page import="koneksi.koneksi"%>
<!DOCTYPE html> 
<?php 
				session_start();?>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->
<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>

</head>
<%@include file="header.jsp" %>


<div class = "bodymain">
	<%@include file="sidebar.jsp" %>

	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> SEARCH RESULTS</p></br></br>
		</div>
		
            <%
            
            koneksi db=new koneksi();
            int counter=0;
            String query=null;
            int jumlahPage=0;
            try
            {
                
                db.dbopen();
                if(request.getParameter("key")!=null)
                {
                    
                    if(request.getParameter("kategori").equals("all"))
                    {
                        
                        if(request.getParameter("range").equals("1"))
                        {
                                query="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where harga<50000 and nama like '%"+request.getParameter("key") +"%'";
                        }
                        if(request.getParameter("range").equals("2"))
                        {
                                query="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where harga>50000 and harga<100000 and nama like '%"+request.getParameter("key") +"%'";
                        }
                        if(request.getParameter("range").equals("3"))
                        {
                                query="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where harga>100000 and harga<150000 and nama like '%"+request.getParameter("key") +"%'";
                        }
                        if(request.getParameter("range").equals("4"))
                        {
                                query="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where harga>150000 and nama like '%"+request.getParameter("key") +"%'";
                        }
                        
                        ResultSet rs=db.stat.executeQuery(query);
                        while(rs.next())
                        {
                            
                            session.setAttribute("nama"+counter, rs.getString(1));
                            session.setAttribute("harga"+counter, rs.getString(3));
                            session.setAttribute("foto"+counter, rs.getString(5));
                            session.setAttribute("id"+counter, rs.getString(6));
                            counter++;
                        }
                    }
                    else
                    {
                        if(request.getParameter("range").equals("1"))
                        {
                                query="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='"+request.getParameter("kategori") +"' and harga<50000 and nama like '%"+request.getParameter("key") +"%'";
                        }
                        if(request.getParameter("range").equals("2"))
                        {
                                query="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='"+request.getParameter("kategori") +"' and harga>50000 and harga<100000 and nama like '%"+request.getParameter("key") +"%'";
                        }
                        if(request.getParameter("range").equals("3"))
                        {
                                query="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='"+request.getParameter("kategori") +"' and harga>100000 and harga<150000 and nama like '%"+request.getParameter("key") +"%'";
                        }
                        if(request.getParameter("range").equals("4"))
                        {
                                query="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='"+request.getParameter("kategori") +"' and harga>150000 and nama like '%"+request.getParameter("key") +"%'";
                        }
                        out.print(query);
                        ResultSet rs=db.stat.executeQuery(query);
                        while(rs.next())
                        {
                            session.setAttribute("nama"+counter, rs.getString(1));
                            session.setAttribute("harga"+counter, rs.getString(3));
                            session.setAttribute("foto"+counter, rs.getString(5));
                            session.setAttribute("id"+counter, rs.getString(6));
                            counter++;
                        }
                        rs.last();
                        jumlahPage=rs.getRow();
                    }
                }
                if(request.getParameter("page") ==null)
                {
                    int i;
                    i=0;
                    while(i<counter && i<10 && session.getAttribute("nama"+i)!=null)
                    {
                        out.print("<div class = 'searchres'>"
                        + "<div class = 'previmage'>"
                        + "<a href='detailbarang.jsp?id="+session.getAttribute("id"+i) +"'><img src= '"+session.getAttribute("foto"+i) +"' class='resizeimage'><img></a>"
                        + "</div>"
                        + "<p class = 'copyrightext'> "+session.getAttribute("nama"+i) +" </br>"
                        + "Rp"+session.getAttribute("harga"+i) +" </label> </br> </p>"
                        + ""
                        + ""
                        + "");
                        out.print("</div>");
                        i++;
                    }
                }
                else
                {
                    counter=0;
                    int batas=(Integer.parseInt(request.getParameter("page"))*10)+10;
                    counter=(Integer.parseInt(request.getParameter("page"))*10);
                    while(counter<batas && session.getAttribute("nama"+counter)!=null)
                    {
                        out.print("<div class = 'searchres'>"
                        + "<div class = 'previmage'>"
                        + "<a href='detailbarang.jsp?id="+session.getAttribute("id"+counter) +"'><img src= '"+session.getAttribute("foto"+counter) +"' class='resizeimage'><img></a>"
                        + "</div>"
                        + "<p class = 'copyrightext'> "+session.getAttribute("nama"+counter) +" </br>"
                        + "Rp"+session.getAttribute("harga"+counter) +" </label> </br> </p>"
                        + ""
                        + ""
                        + "</div>");
                        counter++;
                    }
                }
                
            }
            catch(Exception e)
            {
                
            }
            %>
 <%--           <?php
		
		include "config/connect.php";
		$counter=0;
		
		if(isset($_GET['key']))
		{
			session_unset();
			if($_GET['kategori'] == "all")
			{
				if($_GET['range']==1)
				{
				$hasil = mysql_query("select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where harga<50000 and nama like '%".$_GET['key']."%'");	
				$hasil_temp="select nama, kategori,harga,deskripsi,foto from peralatan where harga<50000 and nama like '%".$_GET['key']."%'";
				}
				if($_GET['range']==2)
				{
				$hasil = mysql_query("select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where harga>50000 and harga<100000 and nama like '%".$_GET['key']."%'");	
				$hasil_temp="select nama, kategori,harga,deskripsi,foto from peralatan where harga>50000 and harga<100000 and nama like '%".$_GET['key']."%'";
				}
				if($_GET['range']==3)
				{
				$hasil = mysql_query("select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where harga>100000 and harga<150000 and nama like '%".$_GET['key']."%'");	
				$hasil_temp="select nama, kategori,harga,deskripsi,foto from peralatan where harga>100000 and harga<150000 and nama like '%".$_GET['key']."%'";
				}
				if($_GET['range']==4)
				{
				$hasil = mysql_query("select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where harga>150000 and nama like '%".$_GET['key']."%'");	
				$hasil_temp="select nama, kategori,harga,deskripsi,foto from peralatan where harga>150000 and nama like '%".$_GET['key']."%'";
				}
				$_SESSION['hasil']=$hasil_temp;
					while(($baris=mysql_fetch_row($hasil)))
					{
						$_SESSION['nama'.$counter]=$baris[0];
						$_SESSION['harga'.$counter]=$baris[2];
						$_SESSION['foto'.$counter]=$baris[4];
						$_SESSION['id'.$counter]=$baris[5];
						$counter++;
					}
			}
			else
			{
				session_unset();
				if($_GET['range']==1)
				{
				$hasil = mysql_query("select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='".$_GET['kategori']."' and harga<50000 and nama like '%".$_GET['key']."%'");	
				$hasil_temp="select nama, kategori,harga,deskripsi,foto from peralatan where kategori='".$_GET['kategori']."' and harga<50000 and nama like '%".$_GET['key']."%'";
				}
				if($_GET['range']==2)
				{
				$hasil = mysql_query("select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='".$_GET['kategori']."' and harga>50000 and harga<100000 and nama like '%".$_GET['key']."%'");	
				$hasil_temp="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='".$_GET['kategori']."' and harga>50000 and harga<100000 and nama like '%".$_GET['key']."%'";
				}
				if($_GET['range']==3)
				{
				$hasil = mysql_query("select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='".$_GET['kategori']."' and harga>100000 and harga<150000 and nama like '%".$_GET['key']."%'");	
				$hasil_temp="select nama, kategori,harga,deskripsi,foto from peralatan where kategori='".$_GET['kategori']."' and harga>100000 and harga<150000 and nama like '%".$_GET['key']."%'";
				}
				if($_GET['range']==4)
				{
				$hasil = mysql_query("select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='".$_GET['kategori']."' and harga>150000 and nama like '%".$_GET['key']."%'");	
				$hasil_temp="select nama, kategori,harga,deskripsi,foto from peralatan where kategori='".$_GET['kategori']."' and harga>150000 and nama like '%".$_GET['key']."%'";
				}
				$_SESSION['hasil']=$hasil_temp;
					while(($baris=mysql_fetch_row($hasil)))
					{
						$_SESSION['nama'.$counter]=$baris[0];
						$_SESSION['harga'.$counter]=$baris[2];
						$_SESSION['foto'.$counter]=$baris[4];
						$_SESSION['id'.$counter]=$baris[5];
						$counter++;
					}
			}
			//$_SESSION['hasil']=$hasil;
		}
		
		else
		{
		$hasil=$_SESSION['hasil'];
		
		$_SESSION['hasil']=$hasil;
		}
		if(!isset($_GET['page']))
		{
			$i=0;
			while($i<$counter && $i<10 && isset($_SESSION['nama'.$i]))
			{
			
			echo '<div class = "searchres">
					<div class = "previmage">
						<a href="detailbarang.php?id='.$_SESSION['id'.$i].'"><img src= "'.$_SESSION["foto".$i].'" class="resizeimage"><img></a>
					</div>
					<p class = "copyrightext"> '.$_SESSION["nama".$i].' </br>
						  Rp'.$_SESSION["harga".$i].' </label> </br> </p>
				</div>';
			$i++;
			}
		}
		else
		{
			
			$counter=0;
			$batas=($_GET['page']*10)+10;
			$counter=$_GET['page']*10;
			while($counter<$batas && isset($_SESSION['nama'.$counter]))
			{
			echo '<div class = "searchres">
					<div class = "previmage">
						<a href="detailbarang.php?id='.$_SESSION['id'.$counter].'"><img src= "'.$_SESSION["foto".$counter].'" class="resizeimage"><img></a>
					</div>
					<p class = "copyrightext"> '.$_SESSION["nama".$counter].' </br>
						  Rp'.$_SESSION["harga".$counter].' </label> </br> </p>
				</div>';
			$counter++;
			}
		}
		?>--%>
			 <div class = "searchnext">
                             <%
                         int tambah=0;
                            if(jumlahPage%10!=0 && jumlahPage>10)
                            {
                                tambah=1;
                                
                            }
                            else
                            {
                                tambah=0;
                            }
                            String sort=request.getParameter("sort");
                            String key=request.getParameter("key");

                            int jumlah=jumlahPage/10+tambah;
                            out.print("page : ");
                            for(int j=0;j<jumlah;j++)
                            {
                               out.print("<a href='hasilsearch.jsp?page="+j+">"+(j+1)+"  </a>"); 
                            }
                         
                         %>

			 <%--<?php
			 $hasil_temp=$_SESSION['hasil'];
			 $hasil=mysql_query($_SESSION['hasil']);
			 $num_rows = mysql_num_rows($hasil);
			 
			 if($num_rows%10!=0 && $num_rows>10)
			 {
				$tambah=1;
			 }
			 else
			 {
				$tambah=0;
			 }
			 $jumlahPage=$num_rows/10 + $tambah;
			 
			 $i=0;
			 for($i=0;$i<$jumlahPage;$i++)
			{
			echo 'Page <a href="hasilsearch.php?page='.$i.'">'.($i+1).'  </a>';
			}
			?>--%>
			</div>
			  
	</div>
</div>
			
	<div class = "footer">
		<div class = "info">

		</div>
		
				
		
	</div>

</body>
</html>