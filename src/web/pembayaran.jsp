<%@page import="java.sql.ResultSet"%>
<%@page import="connect.connect"%>
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
</head>
<body>
    <%@include file="header.jsp" %>
<div class = "bodymain">
    <%@include file="sidebar.jsp" %>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> CHECKOUT</p></br></br>
		</div>
		<div class= "bayar"> 
			<div class= "isibayar">
			<label>Produk</label>
			</div>
			<div class= "isibayar">
			<label>Jumlah</label>
			</div>
			<div class= "isibayar">
			<label>Harga</label>
			</div>
		</div>
		
		<div class= "bayar">
                <%
                int total =0;
                int jumlahbarang =0;
                Cookie id = null;
                Cookie cookiess[] = null;
                 cookiess = request.getCookies();
                  for(int i = 0;i<cookiess.length;i++){
                       if(cookiess[i].getName().equals("IdCustomer"))
                          id = cookiess[i];
                  }
                connect koneksion = new connect();
                koneksion.dbopen();
                ResultSet rs = koneksion.stat.executeQuery("SELECT peralatan.no_alat, peralatan.foto, peralatan.nama, peralatan.harga, keranjang.jumlah,keranjang.pesan FROM keranjang,peralatan where id_customer='"+id.getValue()+"' and peralatan.no_alat=keranjang.id_alat");
                while(rs.next()){
                    
                %>
                <div class= 'isibayar'>
                    <% out.println(rs.getString(3)); %>
                </div>
		<div class= 'isibayar'>
                <% out.println(rs.getString(5)); %>
		</div>
		<div class= 'isibayar'>
                    <% out.println(rs.getString(4)); %>
		</div>
                
               <% 
                total+=Integer.parseInt(rs.getString(4))*Integer.parseInt(rs.getString(5));
		jumlahbarang+=Integer.parseInt(rs.getString(5));
                
                }
                %>
			
		</div>
		<div class= "bayar"> 
		<div class= "isitotal">
		<label>Total</label>
			</div>
			<div class= "isibayar">
                            <% out.print(total); %>
			</div>
			
			
		</div>	</br></br>
			<div class = "registerspace">
			<input type="button" value = "Confirm" onclick="window.location='payment.jsp?jumlah=<%out.print(jumlahbarang); %>'";></br>
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