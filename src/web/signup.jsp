<%@page import="java.sql.ResultSet"%>
<%@page import="javax.ws.rs.POST"%>
<%@page import="connect.connect"%>
<%
    //GET REQUEST DULU
    String username = request.getParameter("username");
    String nama_lengkap = request.getParameter("nama_lengkap");
    String handphone = request.getParameter("handphone");
    if(handphone.isEmpty()){
        handphone = "0";
    }
    String alamat = request.getParameter("alamat");
    String provinsi = request.getParameter("provinsi");
    String kobupaten = request.getParameter("kobupaten");
    String kodepos = request.getParameter("kodepos");
    if(kodepos.isEmpty()){
        kodepos = "0";
    }
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String id;
    
    connect koneksion = new connect();
    koneksion.dbopen();
    System.out.println("INSERT INTO alat_pesta.customer (no_customer, nama, kota, kodepos, email, hp, password, username, provinsi, alamat) VALUES (NULL, '"+ nama_lengkap + "', '"+ kobupaten + "', " + kodepos +", '" + email + "', " + handphone + ", '" + password + "', '" + username + "', '" + provinsi + "','" + alamat + "')");
    try{
        koneksion.stat.executeUpdate("INSERT INTO alat_pesta.customer (no_customer, nama, kota, kodepos, email, hp, password, username, provinsi, alamat) VALUES (NULL, '"+ nama_lengkap + "', '"+ kobupaten + "', " + kodepos +", '" + email + "', " + handphone + ", '" + password + "', '" + username + "', '" + provinsi + "','" + alamat + "')");
        
        ResultSet rs = koneksion.stat.executeQuery("SELECT no_customer FROM customer WHERE email = '"+ email +"' and password= '"+password +"'");
        rs.last();
        id = rs.getString(1);

        //MEMBUAT COOKIE
        Cookie cuser1 = new Cookie("user1", nama_lengkap);
        Cookie ckobupaten = new Cookie("kobupaten", kobupaten);
        Cookie cIdCustomer = new Cookie("IdCustomer",id);
        Cookie cKodePos = new Cookie("kodepos", kodepos);
        Cookie cEmail = new Cookie("email", email);
        Cookie cHandphone = new Cookie("handphone", handphone);
        Cookie cUsername = new Cookie("username", username);
        Cookie cProvinsi = new Cookie("provinsi", provinsi);
        Cookie cAlamat = new Cookie("alamat", alamat);
        
        cuser1.setMaxAge(60*60*24);
        ckobupaten.setMaxAge(60*60*24);
        cIdCustomer.setMaxAge(60*60*24);
        cKodePos.setMaxAge(60*60*24);
        cEmail.setMaxAge(60*60*24);
        cHandphone.setMaxAge(60*60*24);
        cUsername.setMaxAge(60*60*24);
        cProvinsi.setMaxAge(60*60*24);
        cAlamat.setMaxAge(60*60*24);
%>
<script type="text/javascript">
    window.alert("Berhasil Register, Silahkan daftarkan kartu kredit anda");
    window.location="registrasi_kartu.jsp";
</script>

<%
  }catch(Exception e){
      System.out.println(e);
%>
        <script type="text/javascript">
            window.alert("Gagal Register");
            window.location="index.jsp";
        </script>
<%
    }
%>
<%--
<?php
  include "config/connect.php";

        $mysql=mysql_query("INSERT INTO `alat_pesta`.`customer` (`no_customer`, `nama`, `kota`, `kodepos`, `email`, `hp`, `password`, `username`, `provinsi`, `alamat`) VALUES (NULL, '".$_POST['nama_lengkap']."', '".$_POST['kobupaten']."', '".$_POST['kodepos']."', '".$_POST['email']."', '".$_POST['handphone']."', '".$_POST['password']."', '".$_POST['username']."', '".$_POST['provinsi']."','".$_POST['alamat']."')")  or die(mysql_error());
        if($mysql)
		{
			$hasil = mysql_query("SELECT no_customer FROM customer WHERE email = '".$_POST['email']."' and password= '".$_POST['password']."'");
			while($baris=mysql_fetch_row($hasil))
			{
				$getID=$baris[0];
			}
		
		setcookie("user1", $_POST['nama_lengkap'], time()+3600);
		setcookie("kobupaten", $_POST['kobupaten'], time()+3600);
		setcookie("IdCustomer", $getID, time()+3600*24*30);
		setcookie("kodepos",  $_POST['kodepos'], time()+3600*24*30);
		setcookie("email",  $_POST['email'], time()+3600*24*30);
		setcookie("handphone",  $_POST['handphone'], time()+3600*24*30);
		setcookie("username",  $_POST['username'], time()+3600*24*30);
		setcookie("provinsi",  $_POST['provinsi'], time()+3600*24*30);
		setcookie("alamat",  $_POST['alamat'], time()+3600*24*30);
		?>
			<script type="text/javascript">
						window.alert("Berhasil Register, Silahkan daftarkan kartu kredit anda");
						window.location="registrasi_kartu.php";
						</script>
		<?php
		}
		else
		{
		?>
			<script type="text/javascript">
						window.alert("Gagal Register");
						window.location="index.php";
			</script>
		<?php
		
		}
?>
--%>