<jsp:include page="contentBegin.jsp"></jsp:include>
<%@ page import="model.*" %>

<div class="center">
<div class="register_div">
	<h1 class='header'>Profil</h1>
	
	<%
	//Dummy
	Cookie userCookie = new Cookie("username", "sonny");
	userCookie.setMaxAge(60*60*24);
	response.addCookie(userCookie);
	
	Account usr = new Account();
	Order ord = new Order();
	Cookie[] cookies = null;
	cookies = request.getCookies();
	if (cookies != null){
		for (int i=0; i<cookies.length; i++){
			if (cookies[i].getName().equals("username")){
				String id = usr.findByCondition("username='"+cookies[i].getValue()+"'").firstElement().get("id");
				String nama = usr.findByCondition("username='"+cookies[i].getValue()+"'").firstElement().get("nama");
				String username = usr.findByCondition("username='"+cookies[i].getValue()+"'").firstElement().get("username");
				String email = usr.findByCondition("username='"+cookies[i].getValue()+"'").firstElement().get("email");
				String alamat = usr.findByCondition("username='"+cookies[i].getValue()+"'").firstElement().get("alamat");
				String provinsi = usr.findByCondition("username='"+cookies[i].getValue()+"'").firstElement().get("provinsi");
				String kota = usr.findByCondition("username='"+cookies[i].getValue()+"'").firstElement().get("kota");
				String kodepos = usr.findByCondition("username='"+cookies[i].getValue()+"'").firstElement().get("kodepos");
				String name = usr.findByCondition("username='"+cookies[i].getValue()+"'").firstElement().get("nama");
				String telepon = usr.findByCondition("username='"+cookies[i].getValue()+"'").firstElement().get("telepon");
	%>
	
	<div class="per_form">
		<label>Nama Lengkap:</label><p><% out.print(nama); %></p>
	</div>
	<div class="per_form">
		<label>Username:</label><p><% out.print(username); %></p>
	</div>
	<div class="per_form">
		<label>Email:</label><p><% out.print(email); %></p>
	</div>
	<div class="per_form">
		<label>Alamat:</label><p><% out.print(alamat); %></p>
	</div>
	<div class="per_form">
		<label>Provinsi:</label><p><% out.print(provinsi); %></p>
	</div>
	<div class="per_form">
		<label>Kota:</label><p><% out.print(kota); %></p>
	</div>
	<div class="per_form">
		<label>Kode Pos:</label><p><% out.print(kodepos); %></p>
	</div>
	<div class="per_form">
		<label>Telepon:</label><p><% out.print(telepon); %></p>
	</div>
	<div class="per_form">
					<label>Transaksi:</label><p><% out.print(ord.findByCondition("id_account='"+id+"'").size()); %></p>
				<%}
			}
		}	
		%>
		<!-- <?php
			$order = new Order(); 
			$order_count = $order->jumlahSemua('id_account=:a', array(':a'=>$model->id));
		?> -->
		 <!-- <?php echo $order_count ?> -->
	</div>
	<a href="${pageContext.request.contextPath}/profile/edit" class="btn">Edit Profile</a> <!-- <?php echo $this->makeUrl('profile/edit') ?> -->
</div>

</div>

<jsp:include page="contentEnd.jsp"></jsp:include>