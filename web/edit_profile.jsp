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
}--%>


<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>
</head>

 <%@include file="header.jsp" %>
<div class = "bodymain">
	<%@include file="sidebar.jsp" %>	
<div class = "bodymain">
	<div class = "sidebar">
		
			<p class = "searchtitle"> Search it! </p>
		<form action="hasilsearch.php" method="get">
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
	</div>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> EDIT PROFILE</p></br></br>
		</div>
			<div class = "registerspace">
			<label>Nama Lengkap</label> <input type="text" id="nama_lengkap" placeholder = "Chris Martin" value =<%
                                    
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("user1"))
                                          {
                                            out.print(cookie.getValue());
                                            out.print(" defaultValue = "+cookie.getValue());
                                          }
                                          
                                       }
                                   } %> ></br></br>
			
			<label>Change Password</label> <input type="password" id="password" required placeholder = "1234"></br></br>
			
			<label>Confirm change Password</label> <input type="password" id="conf_password" required placeholder = "1234"></br></br>
			
			<label>Alamat</label> <input type="text" id="alamat" placeholder = "Jl. Ganesha No.10 Bandung" value ="<%
                                    
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("alamat"))
                                          {
                                            out.print(cookie.getValue()+"\"");
                                            out.print(" defaultValue = "+cookie.getValue());
                                          }
                                          
                                       }
                                   } %> ></br></br>
			
			<label>Provinsi</label> <input type="text" id="provinsi" placeholder = "Jawa Barat" value ="<%
                                    
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("provinsi"))
                                          {
                                            out.print(cookie.getValue()+"\"");
                                            out.print(" defaultValue = "+cookie.getValue());
                                          }
                                          
                                       }
                                   } %>></br></br>
			
			<label>Kota/Kabupaten</label> <input type="text" id="kobupaten" placeholder = "Sumur Bandung" value ="<%
                                    
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("kobupaten"))
                                          {
                                            out.print(cookie.getValue()+"\"");
                                            out.print(" defaultValue = "+cookie.getValue());
                                          }
                                          
                                       }
                                   } %>></br></br>
			
			<label>Kode Pos</label> <input type="text" id="kodepos" placeholder = "40124" value ="<%
                                    
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("kodepos"))
                                          {
                                            out.print(cookie.getValue()+"\"");
                                            out.print(" defaultValue = "+cookie.getValue());
                                          }
                                          
                                       }
                                   } %>></br></br>
			
			<label>Nomor Handphone</label> <input type="text" id="handphone" placeholder = "08180000000" value ="<%
                                    
                                    if( cookies != null ){
                                       //out.println("<h2> Found Cookies Name and Value</h2>");
                                       
                                       for (int i = 0; i < cookies.length; i++){
                                          cookie = cookies[i];
                                          
                                          String name=cookie.getName();
                                          if(name.equals("handphone"))
                                          {
                                            out.print(cookie.getValue()+"\"");
                                            out.print(" defaultValue = "+cookie.getValue());
                                          }
                                          
                                       }
                                   } %></br></br>
			
			<input type="button" value = "Save" onclick="checkSubmit2()"><label id="pesan"></label></br></br>
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