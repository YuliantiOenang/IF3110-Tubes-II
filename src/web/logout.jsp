<%@page import="javax.swing.JOptionPane"%>
<%@page import="connect.connect"%>
<%
    connect koneksion = new connect();
    koneksion.dbopen();
    
    Cookie cookies[] = null;
    Cookie cookie = null;
    cookies = request.getCookies();
    for(int i = 0;i<cookies.length;i++){
        if(cookies[i].getName().equals("IdCustomer")){
            cookie = cookies[i];
            break;
        }
    }
    
    try{
        if(koneksion.stat.execute("DELETE FROM keranjang WHERE id_customer='"+ cookie.getValue() +"'")){

        }else{
            JOptionPane.showMessageDialog(null, "GAGAL HAPUS CART");
        }
    }catch (Exception e){
        
    }
    
    for(int i = 0;i<cookies.length;i++){
        cookies[i] = cookie;
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }
    
    response.sendRedirect("index.jsp");
%>

<%-- FILE LAMA
<?php
session_start();
session_destroy();
include "config/connect.php";

$mysql5=mysql_query("DELETE FROM `keranjang` WHERE id_customer='".$_COOKIE['IdCustomer']."'");
								setcookie("user1", $idmember, time()-3600*24*30);
								setcookie("IdCustomer", $getID, time()-3600*24*30);
								setcookie("kobupaten", $kota, time()-3600*24*30);
								setcookie("kodepos", $kodepos, time()-3600*24*30);
								setcookie("email", $email, time()-3600*24*30);
								setcookie("handphone", $hp, time()-3600*24*30);
								setcookie("username", $username, time()-3600*24*30);
								setcookie("provinsi", $provinsi, time()-3600*24*30);
								setcookie("alamat", $alamat, time()-3600*24*30);

header("location: index.php");

?>
--%>