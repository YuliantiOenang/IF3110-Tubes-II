<%@page import="java.sql.ResultSet"%>
<%@page import="koneksi.koneksi"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->
<%--<?php
if(!isset($_COOKIE['user1']))
{
	?>
			<script type="text/javascript">
						window.alert("Maaf Anda harus LOGIN terlebih dahulu");
						window.location="index.php";
						</script>
		<?php
}

?>--%>
<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>
</head>


<body>


 <%@include file="header.jsp" %>
<%
if(!found)
{
	%>
			<script type="text/javascript">
						window.alert("Maaf Anda harus LOGIN terlebih dahulu");
						window.location="index.jsp";
						</script>
		<%
}

%>

<div class = "bodymain">
	<%@include file="sidebar.jsp" %>	
	
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> YOUR PROFILE</p></br></br>
		</div>
			<div class = "registerspace">
                            <label>Username : <%
                            
                                    
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("username"))
                                          {
                                            out.print(cookie.getValue());
                                          }
                                          
                                       }
                                   } %></label></br></br>
			
			<label>Nama Lengkap : <%
                                    
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("user1"))
                                          {
                                            out.print(cookie.getValue());
                                          }
                                          
                                       }
                                   } %></label></br></br>
			
			<label>Nomor Handphone : <%
                                    
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("handphone"))
                                          {
                                            out.print(cookie.getValue());
                                          }
                                          
                                       }
                                   } %></label></br></br>
			
			<label>Alamat : <%
                                    
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("alamat"))
                                          {
                                            out.print(cookie.getValue());
                                          }
                                          
                                       }
                                   } %></label></br></br>
			
			<label>Provinsi : <%
                                    
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("provinsi"))
                                          {
                                            out.print(cookie.getValue());
                                          }
                                          
                                       }
                                   } %></label></br></br>
			
			<label>Kota / Kabupaten : <%
                                    
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("kobupaten"))
                                          {
                                            out.print(cookie.getValue());
                                          }
                                          
                                       }
                                   } %></label></br></br>
			
			<label>Kodepos : <%
                                    
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("kodepos"))
                                          {
                                            out.print(cookie.getValue());
                                          }
                                          
                                       }
                                   } %></label></br></br>
			
			<label>Email : <%
                                    
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("email"))
                                          {
                                            out.print(cookie.getValue());
                                          }
                                          
                                       }
                                   } %></label></br></br>
			
			<label>Jumlah Transaksi : <%--<?php 
				include "config/connect.php";
				
				$mysql=mysql_query("select id_costumer from terbayar where id_costumer='".$_COOKIE['IdCustomer']."'");
				echo mysql_num_rows($mysql);
			?>--%>
                            <%
                                    String id=null;
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("IdCustomer"))
                                          {
                                            id=cookie.getValue();
                                          }
                                          
                                       }
                                   } %>
                            <%
                                koneksi db=new koneksi();
                                try
                                {
                                    db.dbopen();
                                    ResultSet rs2=db.stat.executeQuery("select id_costumer from terbayar where id_costumer='"+id +"'");
                                    rs2.last();
                                    out.print(rs2.getRow());
                                }
                                catch(Exception e)
                                {
                                    
                                }
                            %>
			</label></br></br>
			
			<input type="button" value = "Edit" onclick="toEditProfile()"></br>
			</div>
			  
			</div>
			</div>
			
			
			
	
	<div class = "footer">
		<div class = "info">

		</div>
		
				
		
	</div>
</body>
</html>