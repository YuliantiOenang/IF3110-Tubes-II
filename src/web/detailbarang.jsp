<%@page import="java.sql.ResultSet"%>
<%@page import="connect.connect"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->

<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>
<script type="text/javascript">
function getCookie(c_name)
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
function buy()
{
	
	//mengambil semua variable dalam form login
	var  jumlah=0;
        jumlah = parseInt(document.getElementById('jumlahBeli').value);	
	var permintaan = document.getElementById('permintaan').value;
	var id=document.getElementById('id').value;
	var jmlh=0;
        jmlh = parseInt(getCookie("jumlah"));
        alert(""+jumlah+"  "+jmlh)
	if(permintaan=="")
	{
		permintaan="standart";
	}
	if(jumlah=="")
	{
		alert("Maaf anda harus mengisi jumlah barang terlebih dahulu");
	}
        else if(jumlah>jmlh){
            alert("Jumlah Stock Barang Hanya ada : "+getCookie("jumlah"));    
        }
        else
	{
		//request ke file php
		http.open('get', 'addCart.jsp?id='+id+'&jumlah='+jumlah+"&permintaan="+permintaan,true);
		alert(""+'addCart.jsp?id='+id+'&jumlah='+jumlah+"&permintaan="+permintaan);
                //cek hasil request 4 jika berhasil
		http.onreadystatechange = function()
		  {
			
			if (http.readyState==4 && http.status==200)
			{
				try
				{
				var decodeJSON = JSON.parse(http.responseText);
				alert("Barang sudah masuk ke dalam keranjang.");
				}
				catch(e)
				{
				System.out.println("error : "+e);
				alert("Barang pada database Kurang");

				
				}
			}
		  }
		http.send(); 
		}
}
</script>

</head>
<body>
    <%@include file="header.jsp"%>
<div class = "bodymain">
    <%@include file="sidebar.jsp" %>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> PRODUCT DETAIL</p></br></br>
		</div>
		
			<div class = "toppreview">
				<div class = "previmage">
					
					
			<%
                        connect koneksion = new connect();
                        Cookie id= null;
                        Cookie cookiess[] = null;
                        cookiess = request.getCookies();
                        String ID =request.getParameter("id");        
                        for(int i = 0;i<cookiess.length;i++){
                            if(cookiess[i].getName().equals("user1"))
                                id = cookiess[i];
                        }
                         System.out.println("id : "+id.getValue());
                        koneksion.dbopen();
                        ResultSet rs = koneksion.stat.executeQuery("select nama, kategori,harga,deskripsi,foto,jumlah from peralatan where no_alat="+ID+"");
                        if(rs.next()){
                               System.out.println(rs.getString(5)); 
                               Cookie jumlah = new Cookie("jumlah", rs.getString(6));
                               response.addCookie(jumlah);
                        %>
                        
                        <img src= "<%out.print(rs.getString(5));%>" class="resizeimage"><img>;
			<%
                            String nama=rs.getString(1);
                            String kategori=rs.getString(3);
                            String deskripsi=rs.getString(4);
                        
                        %>
				</div>
			 
			</div>
			 <div class = "detail">
					<p> Nama Produk : <%out.print(nama);%></p>
					<p> Harga Produk : <% out.print("Rp."+kategori);%></p>
					<p> Deskripsi : <% out.print(deskripsi);%></p>
                                        <input hidden id='id' name='id' value="<%=ID%>"></input>
                                        <% if(id!=null)
					{
					%>
					<label> Jumlah Beli : </label> <input type="text" required id="jumlahBeli" name="jumlah"/></br></br>
					<label> Permintaan Khusus : </label> <input type="text" id="permintaan" name="permintaan"/></br></br>
					<input type="button" onclick="buy()" value="Add to Cart"></input>
					<%
					}
					%>
					</div>
			</div>
			</div>
			
		<%}%>	
			
	
	<div class = "footer">
		<div class = "info">

		</div>
		
				
		
	</div>
</div>
</body>
</html>