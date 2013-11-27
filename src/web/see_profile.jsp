<%-- 
    Document   : see_profile
    Created on : Nov 25, 2013, 3:02:25 PM
    Author     : Emon
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connect.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->
    <%
        Cookie cookiesCheck[] = null;
        cookiesCheck = request.getCookies();
        boolean adaCookies = false;
        
        for(int i = 0;i<cookiesCheck.length;i++){
            if(cookiesCheck[i].getName().equals("IdCustomer")){
                adaCookies = true;
                break;
            }
        }
        if(!adaCookies){
    %>
			<script type="text/javascript">
						window.alert("Maaf Anda harus LOGIN terlebih dahulu");
						window.location="index.jsp";
						</script>
   <%
            }
   %>

<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>
<script type="text/javascript">
function toEditProfile(){
	window.location = "edit_profile.jsp";
}

function getCookie(c_name)
//FUNGSI PENGAMBIL COOCIE
{
var c_value = document.cookie;
var c_start = c_value.indexOf(" " + c_name + "=");
if (c_start == -1)
  {
  c_start = c_value.indexOf(c_name + "=");
  }
if (c_start == -1)
  {
  c_value = null;
  }
else
  {
  c_start = c_value.indexOf("=", c_start) + 1;
  var c_end = c_value.indexOf(";", c_start);
  if (c_end == -1)
  {
c_end = c_value.length;
}
c_value = unescape(c_value.substring(c_start,c_end));
}
return c_value;
}

</script>
</head>
<body>
    <%@include file="header.jsp" %>
<div class = "bodymain">
    <%@include file="sidebar.jsp" %>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> YOUR PROFILE</p></br></br>
		</div>
                <%
                    Cookie nama = null;
                    Cookie id = null;
                    Cookie noHP = null;
                    Cookie alamat = null;
                    Cookie provinsi = null;
                    Cookie kotaKabupaten = null;
                    Cookie kodePos = null;
                    Cookie email= null;
                    Cookie cookiess[] = null;
                    cookiess = request.getCookies();
                                
                    boolean adaCookiess = false;
                                
                    for(int i = 0;i<cookiess.length;i++){
                       if(cookiess[i].getName().equals("username"))
                          id = cookiess[i];
                       if(cookiess[i].getName().equals("user1"))
                          nama = cookiess[i];
                       if(cookiess[i].getName().equals("handphone"))
                          noHP = cookiess[i];
                       if(cookiess[i].getName().equals("alamat"))
                          alamat = cookiess[i];
                       if(cookiess[i].getName().equals("provinsi"))
                          provinsi = cookiess[i];
                       if(cookiess[i].getName().equals("kobupaten"))
                          kotaKabupaten = cookiess[i];
                       if(cookiess[i].getName().equals("kodepos"))
                          kodePos = cookiess[i];
                       if(cookiess[i].getName().equals("email"))
                          email = cookiess[i];
                        
                     }
                                
                %>
			<div class = "registerspace">
			<label>Username : 
                            <%
                             out.print(id.getValue());
                             %>
                         </label></br></br>
			
                         <label>Nama Lengkap : <% out.print(nama.getValue()); %></label></br></br>
			
			<label>Nomor Handphone : <% out.print(noHP.getValue()); %></label></br></br>
			
			<label>Alamat : <% out.print(alamat.getValue()); %></label></br></br>
			
			<label>Provinsi : <% out.print(provinsi.getValue()); %></label></br></br>
			
			<label>Kota / Kabupaten :<% out.print(kotaKabupaten.getValue()); %></label></br></br>
			
			<label>Kodepos :<% out.print(kodePos.getValue()); %></label></br></br>
			
			<label>Email :<% out.print(email.getValue()); %></label></br></br>
			
			<label>Jumlah Transaksi :
                       <%
                        connect koneksion = new connect();
                        koneksion.dbopen();
                        ResultSet rs = koneksion.stat.executeQuery("select id_costumer from terbayar where id_costumer=\'" + id.getValue()+"\'");
                       out.print(rs.getRow());
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
</div>
</body>
</html>