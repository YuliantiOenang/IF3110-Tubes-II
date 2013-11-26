<%
	int jumlahsearch = 0;
	if (session.getAttribute("jumlahadmberas")!=null){
	
	}else{
		response.sendRedirect("getadmin");
	}	
%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>Search</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
</head>
<body>
	
	<div id="container">
		
		<jsp:include page="header.jsp"/>
		<% if (session.getAttribute("username")!=null){
			String un = (String)session.getAttribute("username");
			if(!un.equals("admin")){
				response.sendRedirect("index.jsp");}
			
			} %>
		<!-- Navbar Section -->
			
			<form name="faddbarang" id="faddbarang" action="insertbarang" method="post" enctype="multipart/form-data" onsubmit="return validateadd()" >
			<div id="popupboxadd"> 
				<a href="javascript:addbarang('hide')" id ="close">[X] close</a> <br/><br/>
				
				Nama&nbsp; &nbsp; &nbsp; &nbsp;      :
				<input id= "namabarang" name="namabarang" type="text" required="required"/><br/>
				Harga   &nbsp;&nbsp; &nbsp; &nbsp;   :
				<input id="hargabarang" name="hargabarang" type="text" required="required"/><br/>
				Kategori  &nbsp;&nbsp; :
				<select id="kategoribarang" name="kategoribarang">
					<option value = "%">- kategori -</option>
					<option value = "Beras">Beras</option>
					<option value = "Daging">Daging</option>
					<option value = "Sayuran">Sayuran</option>
					<option value = "Frozen Food">Frozen Food</option>
					<option value = "Snack">Snack</option>
				</select><br/>
				File Gambar :
				<input id="filebarang" name="filebarang" type="file" required="required"/>
				<br/><br/>
				<input type="submit" name="sbmtadd" id= "sbmtadd" value="Add this item" />
				</div> 
			
			</form>
			
			<form name="feditbarang" id="feditbarang" action="editbarang" method="post" enctype="multipart/form-data" onsubmit="return validateedit()" >
			<div id="popupboxedit"> 
				<a href="javascript:editbarang('hide')" id ="close">[X] close</a> <br/>
				<input id= "enamabarangtemp" name="enamabarangtemp" type="hidden"/><br/>				
				Nama&nbsp; &nbsp; &nbsp; &nbsp;      :
				<input id= "enamabarang" name="enamabarang" type="text" required="required"/><br/>
				Harga   &nbsp;&nbsp; &nbsp; &nbsp;   :
				<input id="ehargabarang" name="ehargabarang" type="text" required="required"/><br/>
				File Gambar :
				<input id="efilebarang" name="efilebarang" type="file"/>
				<br/><br/>
				<input type="submit" name="sbmtedit" id= "sbmtedit" value="Edit this item" />
				</div> 
			
			</form>
		<!-- End of Navbar -->
		
		<div id="dagangan">
			
			<!-- Dagangan Baris 1 -->
			<form id="formadmin" name="foradmin" action="DeleteSelectedItem" onsubmit="return konfirmasidelete()">
			
			<input type="button" name="buttonadd" value="ADD ITEM" onclick="javascript:addbarang('show')">
			<input type="submit" name="buttonadd" value="DELETE SELECTED ITEM">
			<br/><br/>
			<div class="frame">
			
			<div class="judulbest">
					BERAS
					</div>
			<%String str ="";
				String str2="";
			int test = (Integer)session.getAttribute("jumlahadmberas");
			for (int i =1;i<=test;i++){ %>
				<div class="kolom-6 product">					
					<div class="frame">
						<div class="kolom-6"> 
							
							<img class="gambar" src="res/img/product/<%str =(String)session.getAttribute("admberasnama"+i);out.print(str);%>.jpg" alt=""/>
						</div>
						<div class="kolom-6">
							<p class="nama-produk-b"><a href="getbarang?namabarang=<%=(String)session.getAttribute("admberasnama"+i)%>"><%str =(String)session.getAttribute("admberasnama"+i);out.print(str);%></a></p>
							<p class="harga">Harga: <% int intr =(Integer)session.getAttribute("admberasharga"+i);out.print(intr);%> /kg</p>
							<input type="checkbox" name="cdelete" value="<%str =(String)session.getAttribute("admberasnama"+i);str2="edit("+str+")";out.print(str);%>">delete&nbsp; &nbsp;&nbsp; &nbsp;
							<input type="button" name="buttonadd" onclick="edit('<%out.print((String)session.getAttribute("admberasnama"+i));%>','<%out.print((Integer)session.getAttribute("admberasharga"+i));%>')" value="EDIT">
						</div>
					</div>
				</div>
			<%}%> 	
			</div>
			
			<div class="frame">
			<div class="judulbest">
					DAGING
					</div>
			<% 
			str ="";
			test = (Integer)session.getAttribute("jumlahadmdaging");
			
			for (int i =1;i<=test;i++){ %>
				<div class="kolom-6 product">					
					<div class="frame">
						<div class="kolom-6">
							
							<img class="gambar" src="res/img/product/<%str =(String)session.getAttribute("admdagingnama"+i);out.print(str);%>.jpg" alt=""/>
						</div>
						<div class="kolom-6">
							<p class="nama-produk-b"><a href="getbarang?namabarang=<%=(String)session.getAttribute("admdagingnama"+i)%>"><%str =(String)session.getAttribute("admdagingnama"+i);out.print(str);%></a></p>
							<p class="harga">Harga: <% int intr =(Integer)session.getAttribute("admdagingharga"+i);out.print(intr);%> /kg</p>
							<input type="checkbox" name="cdelete" value="<%str =(String)session.getAttribute("admdagingnama"+i);out.print(str);%>">delete&nbsp; &nbsp;&nbsp; &nbsp;
							<input type="button" name="buttonadd" onclick="edit('<%out.print((String)session.getAttribute("admdagingnama"+i));%>','<%out.print((Integer)session.getAttribute("admdagingharga"+i));%>')" value="EDIT">
						</div>
					</div>
				</div>
			<%}%> 	
			</div>

			<div class="frame">
			<div class="judulbest">
					SAYURAN
					</div>
			<%str ="";
			test = (Integer)session.getAttribute("jumlahadmsayuran");
			
			for (int i =1;i<=test;i++){ %>
				<div class="kolom-6 product">					
					<div class="frame">
						<div class="kolom-6">
							
							<img class="gambar" src="res/img/product/<%str =(String)session.getAttribute("admsayurannama"+i);out.print(str);%>.jpg" alt=""/>
						</div>
						<div class="kolom-6">
							<p class="nama-produk-b"><a href="getbarang?namabarang=<%=(String)session.getAttribute("admsayurannama"+i)%>"><%str =(String)session.getAttribute("admsayurannama"+i);out.print(str);%></a></p>
							<p class="harga">Harga: <% int intr =(Integer)session.getAttribute("admsayuranharga"+i);out.print(intr);%> /kg</p>
							<input type="checkbox" name="cdelete" value="<%str =(String)session.getAttribute("admsayurannama"+i);out.print(str);%>">delete&nbsp; &nbsp;&nbsp; &nbsp;
							<input type="button" name="buttonadd" onclick="edit('<%out.print((String)session.getAttribute("admsayurannama"+i));%>','<%out.print((Integer)session.getAttribute("admsayuranharga"+i));%>')" value="EDIT">
						</div>
					</div>
				</div>
			<%}%> 	
			</div>
			
			<div class="frame">
			<div class="judulbest">
					FROZEN FOOD
					</div>
			<%str ="";
			test = (Integer)session.getAttribute("jumlahadmfrozen");
			
			for (int i =1;i<=test;i++){ %>
				<div class="kolom-6 product">					
					<div class="frame">
						<div class="kolom-6">
							<img class="gambar" src="res/img/product/<%str =(String)session.getAttribute("admfrozennama"+i);out.print(str);%>.jpg" alt=""/>
						</div>
						<div class="kolom-6">
							<p class="nama-produk-b"><a href="getbarang?namabarang=<%=(String)session.getAttribute("admfrozennama"+i)%>"><%str =(String)session.getAttribute("admfrozennama"+i);out.print(str);%></a></p>
							<p class="harga">Harga: <% int intr =(Integer)session.getAttribute("admfrozenharga"+i);out.print(intr);%> /kg</p>							
							<input type="checkbox" name="cdelete" value="<%str =(String)session.getAttribute("admfrozennama"+i);out.print(str);%>">delete&nbsp; &nbsp;&nbsp; &nbsp;
							<input type="button" name="buttonadd" onclick="edit('<%out.print((String)session.getAttribute("admfrozennama"+i));%>','<%out.print((Integer)session.getAttribute("admfrozenharga"+i));%>')" value="EDIT">
						</div>
					</div>
				</div>
			<%}%> 	
			</div>
			
			<div class="frame">
			<div class="judulbest">
					SNACK
					</div>
			<%str ="";
			test = (Integer)session.getAttribute("jumlahadmsnack");
			
			for (int i =1;i<=test;i++){ %>
				<div class="kolom-6 product">					
					<div class="frame">
						<div class="kolom-6">
							<img class="gambar" src="res/img/product/<%str =(String)session.getAttribute("admsnacknama"+i);out.print(str);%>.jpg" alt=""/>
						</div>
						<div class="kolom-6">
							<p class="nama-produk-b"><a href="getbarang?namabarang=<%=(String)session.getAttribute("admsnacknama"+i)%>"><%str =(String)session.getAttribute("admsnacknama"+i);out.print(str);%></a></p>
							<p class="harga">Harga: <% int intr =(Integer)session.getAttribute("admsnackharga"+i);out.print(intr);%> /kg</p>							
							<input type="checkbox" name="cdelete" value="<%str =(String)session.getAttribute("admsnacknama"+i);out.print(str);%>">delete&nbsp; &nbsp;&nbsp; &nbsp;
							<input type="button" name="buttonadd" onclick="edit('<%out.print((String)session.getAttribute("admsnacknama"+i));%>','<%out.print((Integer)session.getAttribute("admsnackharga"+i));%>')" value="EDIT">
						</div>
					</div>
				</div>
			<%}%> 	
			
			
			</div>
			</form>
			<!--End of Dagangan-->				
		</div>

		
	</div>
	
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>
	<script src="AjaxAdd.js"></script> 
	<script>
	function validateadd(){
		
		var username = AJAXAdd();
		
		if (username=="true" && document.getElementById("kategoribarang").value!="%"){
			
			return true;
	
		}else if (username=="false"){
			alert("nama sudah ada");
			return false;
		}else{
			alert("kategori harus di isi");
			return false;
		}
	}
	</script>
	<script>
		function validateedit(){
		
	return true;
	}
	</script>
	<script>
	function edit(nb,hb){
		document.getElementById("enamabarang").value=nb;
		document.getElementById("enamabarangtemp").value=nb;
		document.getElementById("ehargabarang").value=hb;
		editbarang('show');
		
	}
	</script>
	<script>
	function konfirmasidelete(){
		var user_choice = window.confirm('Delete Selected Item?');
		if(user_choice==true) {
			return true;
		} else {
			return false;
		}		
	}
	</script>
	
</body>
</html>