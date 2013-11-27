<%@page import="connect.connect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.faces.config.DbfFactory"%>
<%

    String sUsername = request.getParameter("user");
    String password = request.getParameter("pass");

    connect koneksion = new connect();
    koneksion.dbopen();
    ResultSet rs = koneksion.stat.executeQuery("SELECT * FROM customer where username=\'" + sUsername+"\'");
    rs.last();
    if(rs.getRow() == 1){
        
        //VALIDASI PASSWORD
        ResultSet rs2 = koneksion.stat.executeQuery("SELECT * FROM customer WHERE username = \'" + sUsername + "\' and password= \'" + password +"\'");
        rs2.last();
        if(rs2.getRow() == 1){
        
            //MEMBUAT COOKIES
            Cookie user1 = new Cookie("user1", rs2.getString(2));
            Cookie IdCustomer = new Cookie("IdCustomer",rs2.getString(1));
            Cookie kobupaten = new Cookie("kobupaten", rs2.getString(3));
            Cookie kodepos = new Cookie("kodepos",rs2.getString(4));
            Cookie email = new Cookie("email", rs2.getString(5));
            Cookie handphone = new Cookie("handphone", rs2.getString(6));
            Cookie username = new Cookie("username", rs2.getString(8));
            Cookie provinsi = new Cookie("provinsi",rs2.getString(9));
            Cookie alamat = new Cookie("alamat", rs2.getString(10));

            //SET LIFE
            user1.setMaxAge(60*60*24);
            IdCustomer.setMaxAge(60*60*24);
            kobupaten.setMaxAge(60*60*24);
            kodepos.setMaxAge(60*60*24);
            email.setMaxAge(60*60*24);
            handphone.setMaxAge(60*60*24);
            username.setMaxAge(60*60*24);
            provinsi.setMaxAge(60*60*24);
            alamat.setMaxAge(60*60*24);
            
            //KIRIM COOKIES
            response.addCookie(user1);
            response.addCookie(IdCustomer);
            response.addCookie(kobupaten);
            response.addCookie(kodepos);
            response.addCookie(email);
            response.addCookie(handphone);
            response.addCookie(username);
            response.addCookie(provinsi);
            response.addCookie(alamat);
            
            
            
            //out.print(user1);

            //MEMBUAT JSON
            String JSONReturn = new String();
            JSONReturn+="{\"nama\": \""+rs2.getString(2)+"\", \"" + "id\": \"" + rs2.getString(1)+"\"}";  
            out.print(JSONReturn);
        }else{
            out.print("Login gagal, Password Salah");
        }
    }else{
        out.print("Username belum terdaftar");
    }
%>

<%--<?php
	session_start();
	
	include "config/connect.php";
	
	$email = $_GET["user"];
	$password = $_GET["pass"];

	$hasil = mysql_query("SELECT email FROM customer where sUsername='$email'");
	if(mysql_num_rows($hasil)!=0)
	{
			$hasil = mysql_query("SELECT password FROM customer WHERE sUsername = '$email' and password= '$password'");
			if(mysql_num_rows($hasil)!=0)
			{
				 $hasil = mysql_query("SELECT * FROM customer where sUsername='$email'");
				while($baris=mysql_fetch_row($hasil))
				{
				$idmember=$baris[1];
				$getID=$baris[0];
				$kota=$baris[2];
				$kodepos=$baris[3];
				$email=$baris[4];
				$hp=$baris[5];
				$sUsername=$baris[7];
				$provinsi=$baris[8];
				$alamat=$baris[9];
				
				
				}

								setcookie("user1", $idmember, time()+3600*24*30);
								setcookie("IdCustomer", $getID, time()+3600*24*30);
								setcookie("kobupaten", $kota, time()+3600*24*30);
								setcookie("kodepos", $kodepos, time()+3600*24*30);
								setcookie("email", $email, time()+3600*24*30);
								setcookie("handphone", $hp, time()+3600*24*30);
								setcookie("sUsername", $sUsername, time()+3600*24*30);
								setcookie("provinsi", $provinsi, time()+3600*24*30);
								setcookie("alamat", $alamat, time()+3600*24*30);
								
								$return = array();
								$return['nama'] = $idmember;
								$return['id'] = $getID;

								echo json_encode($return);
	
		}
		else
		{		
				echo "Login Gagal, Password salah";
		}
		
	}
	else
		{
				echo "Login Gagal, Email tidak valid";

		}
?>--%>