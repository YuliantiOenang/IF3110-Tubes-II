<%@page import="javax.jms.Session"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="connect.connect"%>
<!DOCTYPE html> 
<?php session_start(); ?>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->
<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>
<script type="text/javascript">
    
function getCookie(c_name)
//FUNGSI PENGAMBIL COOCIE
{
var c_value = document.cookie;
var c_start = c_value.indexOf(" " + c_name + "=");
if (c_start == -1)
  {
  c_start = c_value.indexOf(c_name + "=");
  }
if (c_start == -1)
  {
  c_value = null;
  }
else
  {
  c_start = c_value.indexOf("=", c_start) + 1;
  var c_end = c_value.indexOf(";", c_start);
  if (c_end == -1)
  {
c_end = c_value.length;
}
c_value = unescape(c_value.substring(c_start,c_end));
}
return c_value;
}
    
function cekJumlah(no)
{
	//mengambil semua variable dalam form login
	var id = document.getElementById('idBarang'+no).value;	
	

	var jumlah = document.getElementById('jumlahBarang'+no).value;
	if(jumlah=="")
	{
		alert("maaf anda harus mengisi jumlah barang terlebih dahulu");
	}
        if(getCookie("jumlahBarang"+no)<jumlah){
            alert("Jumlah stok tidak mencukupi");
        }
	else
	{
		//request ke file php
		http.open('get', 'addCart2.jsp?id='+id+'&jumlah='+jumlah+"&permintaan=standart",true);
		//cek hasil request 4 jika berhasil
		http.onreadystatechange = function()
		  {
			
			if (http.readyState==4 && http.status==200)
			{
				try
				{
				
				var decodeJSON = JSON.parse(http.responseText);
				
				alert("Maaf barang yang ada di stok tidak cukup.\n jumlah stok "+http.responseText);
				}
				catch(e)
				{
				alert("Berhasil daftar ke keranjang.");
				}
			}
		  }
		http.send(); 
		
	}	
}

</script>
</head>

<body>
    <%@include file="header.jsp"%>


<div class = "bodymain">
    <%@include file="sidebar.jsp" %>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> CATEGORY</p></br></br>
		<form method="get" action="kategori.jsp">
                    <input type="key" name="key" hidden value="<% out.print(request.getParameter("key")); %>"/>
		<select name="sort">
                    <option selected="<%--<?php if (isset($_GET['sort']) and $_GET['sort']=='nama') echo "true"; else if(!isset($_GET['sort'])) echo 'false' ?>--%><% if(request.getParameter("sort")!=null && request.getParameter("sort").equals("nama")){out.print("true");} else if(request.getParameter("sort") == null){out.print("false");}%>" value="nama"> Nama Barang </option>
                    <option selected="<%--<?php if (isset($_GET['sort']) and $_GET['sort']=='harga') echo "true"; else echo 'false' ?>--%><% if(request.getParameter("sort")!=null && request.getParameter("sort").equals("harga")){out.print("true");}else{out.print("false");} %>" value="harga">Harga Barang</option>
		</select>
		<input type="submit" value="Sort">
		</form>
		</div>
		
                <%
                    int jumlahPage = 0;
                    Cookie cookiess[] = request.getCookies();
                    boolean found = false;
                    for(int i = 0;i<cookiess.length;i++){
                        if(cookiess[i].getName().equals("user1")){
                            found = true;
                            break;
                        }
                    }
                    connect koneksion = new connect();
                    koneksion.dbopen();
                    
                    int counter = 0;
                    if(request.getParameter("key")!=null){
                        if(request.getParameter("sort")!=null){
                            PreparedStatement statement1 = koneksion.con.prepareStatement("select nama, kategori,harga,deskripsi,foto,no_alat,jumlah from peralatan where kategori='" + request.getParameter("key") + "' order by "+request.getParameter("sort"));
                            System.out.println("select nama, kategori,harga,deskripsi,foto,no_alat,jumlah from peralatan where kategori='" + request.getParameter("key") + "' order by "+request.getParameter("sort"));
                            String hasil_temp = "select nama, kategori,harga,deskripsi,foto,no_alat,jumlah from peralatan where kategori='" + request.getParameter("key") + "' order by "+request.getParameter("sort");
                            System.out.println(hasil_temp);
                            session.setAttribute("hasil", hasil_temp);
                            ResultSet rs1 = statement1.executeQuery();
                            while(!rs1.isLast()){
                                rs1.next();
                                session.setAttribute("nama"+counter, rs1.getString(1));
                                session.setAttribute("harga" +counter, rs1.getString(3));
                                session.setAttribute("foto"+counter, rs1.getString(5));
                                session.setAttribute("id"+counter, rs1.getString(6));
                                Cookie jumlahBarangCookie = new Cookie("jumlahBarang"+counter, rs1.getString(7));
                                jumlahBarangCookie.setMaxAge(60*60*3600);
                                response.addCookie(jumlahBarangCookie);
                                counter++;
                            }
                            rs1.last();
                            jumlahPage = rs1.getRow();
                        }else{
                            PreparedStatement statement1 = koneksion.con.prepareStatement("select nama, kategori,harga,deskripsi,foto,no_alat,jumlah from peralatan where kategori='" + request.getParameter("key") + "' order by nama");
                            String hasil_temp = "select nama, kategori,harga,deskripsi,foto,no_alat,jumlah from peralatan where kategori='" + request.getParameter("key") + "' order by nama";
                            session.setAttribute("hasil", hasil_temp);
                            ResultSet rs1 = statement1.executeQuery();
                               
                            while(!rs1.isLast()){
                                rs1.next();
                                session.setAttribute("nama"+counter, rs1.getString(1));
                                session.setAttribute("harga" +counter, rs1.getString(3));
                                session.setAttribute("foto"+counter, rs1.getString(5));
                                session.setAttribute("id"+counter, rs1.getString(6));
                                Cookie jumlahBarangCookie = new Cookie("jumlahBarang"+counter, rs1.getString(7));
                                jumlahBarangCookie.setMaxAge(60*60*3600);
                                response.addCookie(jumlahBarangCookie);
                                counter++;
                                
                            }
                            rs1.last();
                            jumlahPage = rs1.getRow();
                        }
                    }
                    if(request.getParameter("page")==null){
                        //session.invalidate();
                        int i = 0;
                        while(i<counter && i<10 && session.getAttribute("nama"+i)!=null){
                            out.print("<div class = \"searchres\">"
                                    + "<div class = \"previmage\">"
                                    + "<img src=\"" + session.getAttribute("foto"+i) +"\" class =\"resizeimage\"><img>"
                                    + "</div>"
                                    + "<a href=\"detailbarang.jsp?id="+ session.getAttribute("id"+i) +"\"><p class = \"copyrightext\">" + session.getAttribute("nama" + i) + "</a> </br>"
                                        + "Rp"+session.getAttribute("harga"+i) + "</label> </br> </p>"
                                    + "<label>jumlah :</label><input type=\"text\" size=4 id=\"jumlahBarang"+ i +"\"/>"
                                    + "<input type=\"text\" id=\"idBarang" + i + "\" value=\"" + session.getAttribute("id"+i) +"\" hidden/>"
                                    );
                            if(found){
                                %>
                                <input type="button" onClick="cekJumlah(<% out.print(i);%>)" value ="Beli"></input>
                                <%
                                }else{
                                %>
                                <input type="button" onclick="alert('anda harus login terlebih dahulu');window.location='index.jsp'" value="Beli"></input>
                                <%
                            }
                            out.print("</div>");
                            i++;
                        }
                    }else{
                        counter = 0;
                        int batas = Integer.parseInt(request.getParameter("page"))*10+10;
                        counter = Integer.parseInt(request.getParameter("page"))*10;
                        while(counter<batas && session.getAttribute("nama"+counter)!=null){
                            out.print("<div class = \"searchres\">"+
                                    "<div class = \"previmage\">"
                                    +"<img src=\""+session.getAttribute("foto"+counter)+"\" class =\"resizeimage\"><img>"
                                    + "</div>"
                                    + "<a href=\"detailbarang.jsp?id=" + session.getAttribute("id"+counter)+"\"><p class = \"copyrightext\">" + session.getAttribute("nama"+counter) + "</a> </br>"
                                        + "Rp." + session.getAttribute("harga"+counter) + "</label></br></p>"
                                        + "<label>jumlah :</label><input type=\"text\" size=4 id=\"jumlahBarang" + counter +"\"/>" 
                                        + "<input type=\"text\" id=\"idBarang" + counter + "\" value=\"" + session.getAttribute("id"+counter) + "\" hidden/>"
                                    );
                            if(found){
                                %>
                                <input type="button" onclick="cekJumlah(<% out.print(counter);%>" value="Beli"></input>
                                <%
                            }else{
                                %>
                                <input type="button" onclick="alert('anda harus login terlebih dahulu');window.location='index.jsp'" value="Beli"></input>
                                <%
                            }
                            out.print("</div>");
                            counter++;
                        }
                    }
                %>
                
                <%--
		<?php
		
		include "config/connect.jsp";
		$counter=0;
		
		if(isset($_GET['key']))
		{
			if(isset($_GET['sort']))
			{	
				session_unset();
		
				$hasil = mysql_query("select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='".$_GET['key']."' order by ".$_GET['sort']."");	
				$hasil_temp="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='".$_GET['key']."' order by ".$_GET['sort']."";
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
		
				$hasil = mysql_query("select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='".$_GET['key']."' order by nama");	
				$hasil_temp="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='".$_GET['key']."' order by nama";
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
		//session_unset();
		$_SESSION['hasil']=$hasil;
		}
		if(!isset($_GET['page']))
		{
			$i=0;
			while($i<$counter && $i<10 && isset($_SESSION['nama'.$i]))
			{
			
			echo '<div class = "searchres">
					<div class = "previmage">
						<img src= "'.$_SESSION["foto".$i].'" class="resizeimage"><img>
					</div>
					<a href="detailbarang.jsp?id='.$_SESSION['id'.$i].'"><p class = "copyrightext"> '.$_SESSION["nama".$i].'</a> </br>
						  Rp'.$_SESSION["harga".$i].' </label> </br> </p>
					<laabel>jumlah :</label><input type="text" size=4  id="jumlahBarang'.$i.'"/>
					<input type="text" id="idBarang'.$i.'" value="'.$_SESSION['id'.$i].'" hidden/>';
					if(isset($_COOKIE['user1']))
					{
					?>
					<input type="button" onclick="cekJumlah(<?php echo $i;?>)" value="Beli"></input>
					<?php
					}
					else
					{
					?>
					<input type="button" onclick="alert('anda harus login terlebih dahulu'); window.location='index.jsp'" value="Beli"></input>
					<?php
					}
					echo '</div>';
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
						<img src= "'.$_SESSION["foto".$counter].'" class="resizeimage"><img>
					</div>
					<a href="detailbarang.jsp?id='.$_SESSION['id'.$counter].'"><p class = "copyrightext"> '.$_SESSION["nama".$counter].'</a> </br>
						  Rp'.$_SESSION["harga".$counter].' </label> </br> </p>
					<laabel>jumlah :</label><input type="text" size=4  id="jumlahBarang'.$counter.'"/>
					<input type="text" id="idBarang'.$counter.'" value="'.$_SESSION['id'.$counter].'" hidden/>';
					if(isset($_COOKIE['user1']))
					{
					?>
					<input type="button" onclick="cekJumlah(<?php echo $counter;?>)" value="Beli"></input>
					<?php
					}
					else
					{
					?>
					<input type="button" onclick="alert('anda harus login terlebih dahulu'); window.location='index.jsp'" value="Beli"></input>
					<?php
					}
					echo '</div>';
			$counter++;
			}
		}
		?>
                --%>
			 <div class = "searchnext">
                         
                             <%
                                int tambah = 0;
                                if(jumlahPage%10!=0 && jumlahPage>10){
                                    tambah = 1;
                                }else{
                                    tambah = 0;
                                }
                                String sort;
                                if(request.getParameter("sort")!=null){
                                    sort = request.getParameter("sort");
                                }else{
                                    sort = "nama";
                                }
                                out.print("Page : ");
                                int jumlah = jumlahPage/10+tambah;
                                for(int i = 0;i<jumlah;i++){
                                    out.print("<a href=\"kategori.jsp?page=" + i +"&sort=" + sort + "&key=" + request.getParameter("key") + "\">"+(i+1) + "</a>");
                                }
                             %>
                             
                         <%--
			 <?php
			
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
			 if(isset($_GET['sort']))
			 {
				$sort=$_GET['sort'];
			 }
			 else
			 {
				$sort="nama";
			 }
			 $i=0;
			 echo "Page : ";
		 for($i=0;$i<$jumlahPage-1;$i++)
			{
			echo '<a href="kategori.jsp?page='.$i.'&sort='.$sort.'&key='.$_GET['key'].'">'.($i+1).'  </a>';
			}
			?>
                         --%>
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