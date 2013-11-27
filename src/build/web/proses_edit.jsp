<%@page import="connect.connect"%>
<%
    connect koneksion = new connect();
    
    String nama_lengkap = request.getParameter("nama_lengkap");
    String IdCustomer = null;
    String password = request.getParameter("password");
    String alamat = request.getParameter("alamat");
    String provinsi = request.getParameter("provinsi");
    String kobupaten = request.getParameter("kobupaten");
    String kodepos = request.getParameter("kodepos");
    if(kodepos.isEmpty()){
        kodepos = "0";
    }
    String handphone = request.getParameter("handphone");
    if(handphone.isEmpty()){
        handphone = "0";
    }
    
    Cookie cookies[] = request.getCookies();
    for(int i = 0;i<cookies.length;i++){
        if(cookies[i].getName().equals("IdCustomer")){
            IdCustomer = new String(cookies[i].getValue());
        }
    }
    try{
        koneksion.dbopen();
        koneksion.stat.executeUpdate("UPDATE customer SET nama='"+ nama_lengkap +"', password ='"+ password +"', alamat='" + alamat + "',provinsi = '"+ provinsi +"',kota = '" + kobupaten +"', kodepos = '"+kodepos+"' , hp = "+ handphone +" WHERE no_customer =" + IdCustomer);
        %>
        <script>
            alert("berhasil update");
            window.location="edit_profile.jsp";
        </script>
        <%
        Cookie cuser1 = new Cookie("user1", nama_lengkap);
        Cookie cPassword = new Cookie("password", password);
        Cookie cAlamat = new Cookie("alamat", alamat);
        Cookie cProvinsi = new Cookie("provinsi", provinsi);
        Cookie cKobupaten = new Cookie("kobupaten", kobupaten);
        Cookie cKodepos = new Cookie("kodepos", kodepos);
        Cookie cHandphone = new Cookie("handphone", handphone);
        
        cuser1.setMaxAge(60*60*3600);
        cPassword.setMaxAge(60*60*3600);
        cAlamat.setMaxAge(60*60*3600);
        cProvinsi.setMaxAge(60*60*3600);
        cKobupaten.setMaxAge(60*60*3600);
        cKodepos.setMaxAge(60*60*3600);
        cHandphone.setMaxAge(60*60*3600);
        
        response.addCookie(cuser1);
        response.addCookie(cPassword);
        response.addCookie(cAlamat);
        response.addCookie(cProvinsi);
        response.addCookie(cKobupaten);
        response.addCookie(cKodepos);
        response.addCookie(cHandphone);
    }catch(Exception e){
        System.out.println(e);
        %>
        
        <script>
                alert("Tdaik berhasil update");
                window.location="edit_profile.jsp";
        </script>
        <%
    }
    
%>

<%--
<?php
	include "config/connect.php";
	
	$nama_lengkap = $_GET['nama_lengkap'];
	$IdCustomer = $_COOKIE["IdCustomer"];
	$password = $_GET["password"];
	$alamat = $_GET["alamat"];
	$provinsi = $_GET["provinsi"];
	$kobupaten = $_GET["kobupaten"];
	$kodepos = $_GET["kodepos"];
	$handphone = $_GET["handphone"];
	
	$result = mysql_query("UPDATE customer SET nama='$nama_lengkap', password ='$password', alamat='$alamat',provinsi = '$provinsi',kota = '$kobupaten', kodepos ='$kodepos', hp = $handphone WHERE no_customer = $IdCustomer");
	
	if($result){
	?>
		<script>
		alert("berhasil update");
		window.location="edit_profile.php";
		</script>
		
	<?php	
		setcookie("user1",$nama_lengkap,time()+3600*24*30);
		setcookie("password",$password,time()+3600*24*30);
		setcookie("alamat",$alamat,time()+3600*24*30);
		setcookie("provinsi",$provinsi,time()+3600*24*30);
		setcookie("kobupaten",$kobupaten,time()+3600*24*30);
		setcookie("kodepos",$kodepos,time()+3600*24*30);
		setcookie("handphone",$handphone,time()+3600*24*30);
		
	}else{
	echo mysql_error();
	?>
		<script>
		alert("tidak berhasil udpate");
		window.location="edit_profile.php";
		</script>
	<?php
	}
?>
--%>