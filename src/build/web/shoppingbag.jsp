<%@page import="java.sql.Array"%>
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
<script type="text/javascript">

function cekJumlah(i)
{
	//mengambil semua variable dalam form login
	var id = document.getElementById('idBarang'+i).value;
        var idCart = document.getElementById('idCart'+i).value;	
	
       // alert("nilai dari i :"+i);
	var jumlah = document.getElementById('jumlahBarang'+i).value;
	if(jumlah<0){
            alert("jumlah yang dibeli harus lebih besar dari 0")
        }
        else{
        //request ke file php
	http.open('get', 'changeJumlah.jsp?id='+id+'&jumlah='+jumlah+'&idcart='+idCart,true);
	//cek hasil request 4 jika berhasil
	http.onreadystatechange = function()
	  {
		
		if (http.readyState==4 && http.status==200)
		{
			try
			{
			
			var decodeJSON = JSON.parse(http.responseText);
			
			alert("Maaf barang yang ada di stok tidak cukup.\n jumlah stok "+http.responseText);
			}
			catch(e)
			{
			alert("Berhasil mengganti transaksi.");
			}
		}
	  }
	http.send(); 
	    
            
        }
        
	
}


</script>
</head>

<body>
    <%@include file="header.jsp" %>
<div class = "bodymain">
    <%@include file="sidebar.jsp" %>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> MY SHOPPING BAG</p></br></br>
		</div>
                <%  
                    Cookie id= null;
                    Cookie cookiess[] = null;
                    cookiess = request.getCookies();
                     for(int i = 0;i<cookiess.length;i++){
                       if(cookiess[i].getName().equals("IdCustomer"))
                          id = cookiess[i];
                    }
                    connect koneksion = new connect();
                    koneksion.dbopen();
                    ResultSet rs = koneksion.stat.executeQuery("SELECT peralatan.no_alat, peralatan.foto, peralatan.nama, peralatan.harga, keranjang.jumlah,keranjang.pesan,keranjang.id_cart FROM keranjang,peralatan where id_customer="+id.getValue()+" and peralatan.no_alat=keranjang.id_alat");
                    
                    
                   int i =1; 
                    while(rs.next()){
                        
                        System.out.println(rs.getString(4));
                %>
                    <div class = 'toppreview'>
				<div class = 'previmage'>
                                    <img src='<%out.print(rs.getString(2));  %>' class='resizeimage'>
				</div>
				
				<p class = 'copyrightext'> <%out.print(rs.getString(3));%> </br>
					  Rp<%out.print(rs.getString(4));%> </label> </br> Pesan : <%out.print(rs.getString(6));%> </br> 
                                          <input type='text' id='idCart<%=i%>' value='<%out.print(rs.getString(7));%>' hidden/>
                                          <input type='text' id='idBarang<%=i%>' value='<%out.print(rs.getString(1));%>' hidden/>
                                          Jumlah: <input type='text' size=4 id='jumlahBarang<%=i%>' value='<%out.print(rs.getString(5));%>'/></br>
				
                                          <input type='submit' value='change' onclick='<%="cekJumlah("+i+")"%>'></p>
				</div>
                <%i++; } %>
		
			<div class = "checkout">
			<input type="button" value="Detail Pembayaran" onclick="window.location='pembayaran.jsp'"></input>
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