<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connect.connect"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->
<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>
</head>


<body>
<%@include file="headeradmin.jsp"%>
    
<div class = "bodymain">
    <div class = "sidebar">
		
			<p class = "searchtitle"> Search it! </p>
		<form action="hasilsearch.jsp" method="get">
		<div class = "kategori">
			<select name="kategori">
				<option value="all">All</option>
				<option value="Jaket">Jacket</option>
				<option value="TShirt">T-shirt</option>
				<option value="Sweater">Sweater</option>
				<option value="Misc">Misc.</option>
				<option value="Pokemon">Pokemon</option>
			</select>
			<input type="text" id="user" name="key" required placeholder = "e.g. Mylo Xyloto" onkeyup="suggestSearch(this.value)" /></br>
	</div>
	
	<div class = "kategori">
	<label> Price Range: </label>
	<select name="range">
				<option value=1>< Rp50.000 </option>
				<option value=2>Rp50.000 - Rp100.000</option>
				<option value=3>Rp100.001 - Rp150.000</option>
				<option value=4>> Rp150.000</option>
				
			</select>
	</div>
	<div class = "kategori">
	<input type="submit" value="Search!"></input>
	</div>
	<label>Suggestion : <br><span id="search_suggestion" onclick="copySuggest()"></span></label>
	</form>
                        
                        <div class =" space">
                            
                        </div>    
                        
                        <p class = "textadmin"> FITUR KHUSUS ADMIN </p>		
				
			<div class = "placetambahbarang" >
				<form action="tambahbarang.jsp">
					<input type="submit" class = "buttontambahbarang" value="Tambah Barang">
				</form>
			</div>	
                        
	</div>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> UBAH DATA KAMU</p></br>
		</div>
		<div class = "topthreecat">
                    <%
                        connect koneksion = new connect();
                        koneksion.dbopen();
                        PreparedStatement st1 = koneksion.con.prepareStatement("SELECT no_alat,foto,nama,harga FROM `peralatan`");
                        ResultSet rs1 = st1.executeQuery();
                        int count = 1;
                        while(!rs1.isLast()){
                            rs1.next();
                            out.println("<div class = 'toppreview'><div class = 'previmage'><a href='detailbarangadmin.jsp?id="+ rs1.getString(1) +"'><img src='" + rs1.getString(2) +"' class='resizeimage'></a></div><p class = 'copyrightext'>"+ rs1.getString(3) + "</br>Rp"+ rs1.getString(4) +" </label> </br> </p></div>");
                            count++;
                        }
                    %>
                   
		</div>
		<div class = "mekanisme">
		<p class = "copyrightext"> Mekanisme Pembayaran </br></br>
		1. Pembeli melakukan login atau sign up
		2. Pembeli memesan produk-produk yang ingin dibeli </br>
		3. Pembeli melakukan checkout dengan memilih cart </br>
		4. Pembeli memilih mekanisme pembayaran, yaitu dengan kartu kredit yang dipilih </br>
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