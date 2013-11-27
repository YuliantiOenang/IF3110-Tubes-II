<%@page import="koneksi.koneksi"%>
<%
koneksi db=new koneksi();
	String nama_lengkap = request.getParameter("nama_lengkap");
	String IdCustomer = request.getParameter("IdCustomer");
	String password = request.getParameter("password");
	String alamat = request.getParameter("alamat");
	String provinsi = request.getParameter("provinsi");
	String kobupaten = request.getParameter("kobupaten");
	String kodepos = request.getParameter("kodepos");
	String handphone = request.getParameter("handphone");
 try
   {
  
         db.dbopen();
         db.stat.executeUpdate("UPDATE customer SET nama='"+nama_lengkap+"', password ='"+password+"', alamat='"+alamat+"',provinsi = '"+provinsi+"',kota = '"+kobupaten+"', kodepos ='"+kodepos+"', hp = "+handphone+" WHERE no_customer = "+IdCustomer+"");
         
         db.con.close();
         
         Cookie user1 = new Cookie("user1",
                                               nama_lengkap);
                       Cookie password_ = new Cookie("IdCustomer",
                                               password);
                       Cookie kobupaten_ = new Cookie("kobupaten",
                                               kobupaten);
                       Cookie kodepos_ = new Cookie("kodepos",
                                               kodepos);
                       
                       Cookie handphone_ = new Cookie("handphone",
                                               handphone);
                       Cookie provinsi_ = new Cookie("provinsi",
                                               provinsi);
                       Cookie alamat_ = new Cookie("alamat",
                                               alamat);
                       
                       user1.setMaxAge(60*60*24);
                       password_.setMaxAge(60*60*24);
                       kobupaten_.setMaxAge(60*60*24);
                       kodepos_.setMaxAge(60*60*24);
                       handphone_.setMaxAge(60*60*24);
                       provinsi_.setMaxAge(60*60*24);
                       alamat_.setMaxAge(60*60*24);
                       response.addCookie( user1 );
                       response.addCookie( password_ );
                       response.addCookie( kobupaten_ );
                       response.addCookie( kodepos_ );
                       response.addCookie( handphone_ );
                       response.addCookie( provinsi_ );
                       response.addCookie( alamat_ );
                %>
		<script>
		alert("berhasil update");
		window.location="edit_profile.jsp";
		</script>
		
	<%
   }
   catch(Exception e )
   {
      out.println("error"+e);
      %>
		<script>
		alert("tidak berhasil udpate");
		window.location="edit_profile.jspp";
		</script>
      <%
   }   
       
%>

<%--<?php
	include "config/connect.php";
	
	nama_lengkap = _GET['nama_lengkap'];
	IdCustomer = _COOKIE["IdCustomer"];
	password = _GET["password"];
	alamat = _GET["alamat"];
	provinsi = _GET["provinsi"];
	kobupaten = _GET["kobupaten"];
	kodepos = _GET["kodepos"];
	handphone = _GET["handphone"];
	
	result = mysql_query("UPDATE customer SET nama='nama_lengkap', password ='password', alamat='alamat',provinsi = 'provinsi',kota = 'kobupaten', kodepos ='kodepos', hp = handphone WHERE no_customer = IdCustomer");
	
	if(result){
	?>
		<script>
		alert("berhasil update");
		window.location="edit_profile.php";
		</script>
		
	<?php	
		setcookie("user1",nama_lengkap,time()+3600*24*30);
		setcookie("password",password,time()+3600*24*30);
		setcookie("alamat",alamat,time()+3600*24*30);
		setcookie("provinsi",provinsi,time()+3600*24*30);
		setcookie("kobupaten",kobupaten,time()+3600*24*30);
		setcookie("kodepos",kodepos,time()+3600*24*30);
		setcookie("handphone",handphone,time()+3600*24*30);
		
	}else{
	echo mysql_error();
	?>
		<script>
		alert("tidak berhasil udpate");
		window.location="edit_profile.php";
		</script>
	<?php
	}
?>--%>