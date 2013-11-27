

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.sun.xml.internal.bind.v2.model.core.ID"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="koneksi.koneksi"%>
<%
koneksi db=new koneksi();
 try
   {
         Cookie cookie = null;
         Cookie[] cookies = null;
         boolean found=false;
         
          String nama=null;
                                    // Get an array of Cookies associated with this domain
         cookies = request.getCookies();
                                    
         if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
            for (int i = 0; i < cookies.length; i++){
                cookie = cookies[i];
                
                String name=cookie.getName();
                if(name.equals("IdCustomer"))
                {
                     found=true;
                     nama=cookie.getValue();
                }
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
         }else{
                out.println("<h2>No cookies founds</h2>");
                }
         db.dbopen();
         String nama_lengkap=request.getParameter("nama_lengkap");
         String kobupaten=request.getParameter("kobupaten");
         String kodepos=request.getParameter("kodepos");
         String email=request.getParameter("email");
         String handphone=request.getParameter("handphone");
         String password=request.getParameter("password");
         String username=request.getParameter("username");
         String provinsi=request.getParameter("provinsi");
         String alamat=request.getParameter("alamat");
         
         
         db.stat.executeUpdate("INSERT INTO alat_pesta.customer (no_customer, nama, kota, kodepos, email, hp, password, username, provinsi, alamat) VALUES (NULL, '"+nama_lengkap+"', '"+kobupaten+"', '"+kodepos+"', '"+email+"', '"+handphone+"', '"+password+"', '"+username+"', '"+provinsi+"','"+alamat+"')");
          try
              {
                    ResultSet rs2=db.stat.executeQuery("SELECT * FROM customer where username='"+request.getParameter("username")+"' and password='"+request.getParameter("password")+"'");
                    rs2.last();
                    if(rs2.getRow()==1)
                    {
                         // Create cookies for first and last names.      
                       Cookie user1_ = new Cookie("user1",
                                               rs2.getString(2));
                       Cookie idCustomer_ = new Cookie("IdCustomer",
                                               rs2.getString(1));
                       Cookie kobupaten_ = new Cookie("kobupaten",
                                               rs2.getString(3));
                       Cookie kodepos_ = new Cookie("kodepos",
                                               rs2.getString(4));
                       Cookie email_ = new Cookie("email",
                                               rs2.getString(5));
                       Cookie handphone_ = new Cookie("handphone",
                                               rs2.getString(6));
                       Cookie username_ = new Cookie("username",
                                               rs2.getString(8));
                       Cookie provinsi_ = new Cookie("provinsi",
                                               rs2.getString(9));
                       Cookie alamat_ = new Cookie("alamat",
                                               rs2.getString(10));
                       
                       
                       // Set expiry date after 24 Hrs for both the cookies.
                       user1_.setMaxAge(60*60*24); 
                       idCustomer_.setMaxAge(60*60*24); 
                       kobupaten_.setMaxAge(60*60*24); 
                       kodepos_.setMaxAge(60*60*24); 
                       email_.setMaxAge(60*60*24); 
                       handphone_.setMaxAge(60*60*24); 
                       username_.setMaxAge(60*60*24); 
                       provinsi_.setMaxAge(60*60*24); 
                       alamat_.setMaxAge(60*60*24); 
                       
                       // Add both the cookies in the response header.
                       response.addCookie( user1_ );
                       response.addCookie( idCustomer_ );
                       response.addCookie( kobupaten_ );
                       response.addCookie( kodepos_ );
                       response.addCookie( email_ );
                       response.addCookie( handphone_ );
                       response.addCookie( username_ );
                       response.addCookie( provinsi_ );
                       response.addCookie( user1_ );
                       response.addCookie( alamat_ );
                       %>
                        <script type="text/javascript">
			window.alert("Berhasil Register, Silahkan daftarkan kartu kredit anda");
                        window.location="registrasi_kartu.jsp";
			</script>
                       <%
                    }
                    
              }
              catch(Exception e )
              {
                 %>
                        <script type="text/javascript">
                            window.alert("Gagal Register");
                            window.location="index.jsp";
			</script>
                 <%
              }
         db.con.close();
         //response.sendRedirect("index.jsp");
   }
   catch(Exception e )
   {
      out.println("error"+e);
   }   
       
%>


<%--<?php
  include "config/connect.php";

        $mysql=mysql_query("INSERT INTO `alat_pesta`.`customer` (`no_customer`, `nama`, `kota`, `kodepos`, `email`, `hp`, `password`, `username`, `provinsi`, `alamat`) VALUES (NULL, '".$_POST['nama_lengkap']."', '".$_POST['kobupaten']."', '".$_POST['kodepos']."', '".$_POST['email']."', '".$_POST['handphone']."', '".$_POST['password']."', '".$_POST['username']."', '".$_POST['provinsi']."','".$_POST['alamat']."')")  or die(mysql_error());
        if($mysql)
		{
			$hasil = mysql_query("SELECT no_customer FROM customer WHERE email = '".$_POST['email']."' and password= '".$_POST['password']."'");
			while($baris=mysql_fetch_row($hasil))
			{+
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
