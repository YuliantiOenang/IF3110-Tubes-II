
<%@page import="java.sql.ResultSet"%>
<%@page import="koneksi.koneksi"%>
<%@page import="koneksi.koneksi"%>
<%
    String card_number=request.getParameter("card_number");
    String card_name=request.getParameter("card_name");
    String card_expired=request.getParameter("card_expired");
    
    koneksi db=new koneksi();
    boolean status=false;
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
                
            }
         }
         db.dbopen();
         try
              {
                    ResultSet rs2=db.stat.executeQuery("SELECT card_name FROM kartu_kredit WHERE card_name = '"+card_name+"' and card_number='"+card_number+"'");
                    rs2.last();
                    if(rs2.getRow()>0)
                    {
                          int retval=db.stat.executeUpdate("UPDATE `customer` SET `card_number`='"+card_number+"' WHERE no_customer='"+nama+"'");
                          if(retval!=0)
                          {
                              status=true;
                          }
                          else
                          {
                              status=false;
                          }
                          out.print("{\"status\":"+status+"}");
                    }
                    else
                    {
                       out.print("{\"status\":"+status+","
 + "\"cek\":\""
 +card_number +""
 + "\""
 + "}");   
                    }
              }
              catch(Exception e )
              {
                 out.println("error"+e);
              }
        
         
         db.con.close();
         
   }
   catch(Exception e )
   {
      out.println("error"+e);
   }   
%>
<%--<?php
	include "config/connect.php";
	
	$card_number = $_GET["card_number"];
	$card_name = $_GET["card_name"];
	$card_expired = $_GET["card_expired"];
	$return1 = array();
	
	$arrCardName = mysql_query("SELECT card_name FROM kartu_kredit WHERE card_name = '".$card_name."' and card_number='".$card_number."'");
	
	
	if(mysql_num_rows($arrCardName) >0){
	$mysql= mysql_query("UPDATE `customer` SET `card_number`='$card_number' WHERE no_customer='".$_COOKIE['IdCustomer']."'");	
		
		if($mysql)
		{
		$return1["status"] = true;
		}
		else
		{
		$return1["status"] = false;
		}
		echo json_encode($return1);
	}else{
		$return1["status"] = false;
		$return1["cek"] = $card_number;
		
		echo json_encode($return1);
	}
?>--%>