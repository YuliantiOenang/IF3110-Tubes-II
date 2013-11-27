<%@page import="koneksi.koneksi"%>
<%
        Cookie cookie = null;
        Cookie[] cookies = null;
        boolean found=false;
        String nama=null;
                                    
                                    // Get an array of Cookies associated with this domain
        cookies = request.getCookies();
                                    
        
        if( cookies != null ){
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
    koneksi db=new koneksi();
    String Permintaan=request.getParameter("permintaan");
    if(request.getParameter("permintaan")==null)
           {
        Permintaan="Standart";
               }
        
    try
    {
        db.dbopen();
        db.stat.executeUpdate("INSERT INTO `keranjang`(`id_customer`, `id_alat`, `jumlah`,`pesan`) VALUES ('"+nama+"','"+request.getParameter("id") +"','"+request.getParameter("jumlah") +"','"+Permintaan +"')");
        out.print("\"true\":true");
    }
    catch(Exception e)
    {
        out.print(e);
    }
%>

<%--<?php
  include "config/connect.php";

			
			$mysql=mysql_query("INSERT INTO `keranjang`(`id_customer`, `id_alat`, `jumlah`,`pesan`) VALUES ('".$_COOKIE['IdCustomer']."','".$_GET['id']."','".$_GET['jumlah']."','".$_GET['permintaan']."')")  or die(mysql_error());
			if($mysql)
			{
				$return=array();
				$return['true']=true;
				return json_encode($return);
			}
			else
			{
			
			}
         
     
?>--%>
