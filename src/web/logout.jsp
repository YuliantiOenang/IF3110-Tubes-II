

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
         db.stat.executeUpdate("DELETE FROM `keranjang` WHERE id_customer='"+nama+"'");
         
         db.con.close();
         response.sendRedirect("index.jsp");
   }
   catch(Exception e )
   {
      out.println("error"+e);
   }   
       
%>

<%--<?php
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

?>--%>