
<%@page import="java.sql.ResultSet"%>
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
    int jumlah=0;
    try
    {
        db.dbopen();
        ResultSet rs=db.stat.executeQuery("select jumlah from peralatan where no_alat='"+request.getParameter("id") +"'");
        while(rs.next())
        {
            jumlah=Integer.parseInt(rs.getString(1));
        }
        if(jumlah<Integer.parseInt(request.getParameter("jumlah")))
        {
            out.print(jumlah);
        }
        else
        {
            db.stat.executeUpdate("UPDATE `keranjang` SET `jumlah`='"+request.getParameter("jumlah") +"' WHERE id_customer='"+nama+"'");
        }
    }
    catch(Exception e)
    {
        
    }
%>
<%--<?php
  include "config/connect.php";
			$hasil=mysql_query("select jumlah from peralatan where no_alat='".$_GET['id']."'")  or die(mysql_error());
			while($baris=mysql_fetch_row($hasil))
			{
				$jumlah=$baris[0];
			}
			
			if($jumlah<$_GET['jumlah'])
			{
				echo $jumlah;
			}
			else
			{
				$mysql=mysql_query("UPDATE `keranjang` SET `jumlah`='".$_GET['jumlah']."' WHERE id_customer='".$_COOKIE['IdCustomer']."'")  or die(mysql_error());
				if($mysql)
				{
				
				
				}
				
				
				
			}
			
     
?>--%>

