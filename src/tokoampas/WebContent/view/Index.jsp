<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
/*
	session_start();
	session_destroy();
*/

/*
	$con=mysqli_connect("localhost","root", "", $CONFIG['mysql']['database'] );
	if(mysqli_connect_errno()){
			echo "Gagal Buka DB" . msqli_connect_error();
	}
*/
%>

<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/include/css/style.css">	
	</head>
		
	<body> 
	
	<%@ include file="Header.jsp" %>
		
		<!--content-->
		<div class="populer">
					<div id="popularFont">
						<p>BARANG TERPOPULER</p>
					</div>
				<ul>
					<li>	
						<% /*														
						<?php
							$result = mysqli_query($con,"SELECT * FROM product where (sold = (SELECT Max(sold) from product where category='elektronik')) AND category='elektronik'");					
							while($row = mysqli_fetch_array($result))
							{	
								echo "Kategori <b>Elektronik</b><br>";
								echo '<a href=' . SITEURL . '/product/detail/' . $row['product_id'] . '>';
								echo '<img src=' . SITEURL . '/include/' . $row['image_link'] . '>';
								echo '</a>';
							}						
						?>	
						*/ %>
							Kategori <b>Elektronik</b><br>
							<a href=''>
								<img src='${pageContext.request.contextPath}/include/img/barang4.jpg'>
							</a>
					</li>						
					
					<li>
						<% /*
						<?php
							$result = mysqli_query($con,"SELECT * FROM product where (sold = (SELECT Max(sold) from product where category='otomotif')) AND category='otomotif'");							
							while($row = mysqli_fetch_array($result))
							{	
								echo "Kategori <b>Otomotif</b><br>";
								echo '<a href=' . SITEURL . '/product/detail/' . $row['product_id'] . '>';
								echo '<img src=' . SITEURL . '/include/' . $row['image_link'] . '>';
								echo '</a>';
							}						
						?>	
						*/ %>
						Kategori <b>Otomotif</b><br>
							<a href=''>
								<img src='${pageContext.request.contextPath}/include/img/barang2.jpg'>
							</a>
					</li>
					
					<li> 	
						<% /*
						<?php
							$result = mysqli_query($con,"SELECT * FROM product where (sold = (SELECT Max(sold) from product where category='fashion')) AND category='fashion'");							
							while($row = mysqli_fetch_array($result))
							{	
								echo "Kategori <b>Fashion</b><br>";
								echo '<a href=' . SITEURL . '/product/detail/' . $row['product_id'] . '>';
								echo '<img src=' . SITEURL . '/include/' . $row['image_link'] . '>';
								echo '</a>';
							}						
						?>
						*/ %>
						Kategori <b>Fashion</b><br>
							<a href=''>
								<img src='${pageContext.request.contextPath}/include/img/barang3.jpg'>
							</a>
					</li>
					
					<li> 	
						<% /*
						<?php
							$result = mysqli_query($con,"SELECT * FROM product where (sold = (SELECT Max(sold) from product where category='properti')) AND category='properti'");							
							while($row = mysqli_fetch_array($result))
							{	
								echo "Kategori <b>Properti</b><br>";
								echo '<a href=' . SITEURL . '/product/detail/' . $row['product_id'] . '>';
								echo '<img src=' . SITEURL . '/include/' . $row['image_link'] . '>';
								echo '</a>';
							}						
						?>
						*/ %>
						Kategori <b>Properti</b><br>
							<a href=''>
								<img src='${pageContext.request.contextPath}/include/img/barang5.jpg'>
							</a>
					</li>
					
					<li>
						<% /*
						<?php
							$result = mysqli_query($con,"SELECT * FROM product where (sold = (SELECT Max(sold) from product where category='musik')) AND category='musik'");							
							while($row = mysqli_fetch_array($result))
							{	
								echo "Kategori <b>Musik</b><br>";
								echo '<a href=' . SITEURL . '/product/detail/' . $row['product_id'] . '>';
								echo '<img src=' . SITEURL . '/include/' . $row['image_link'] . '>';
								echo '</a>';
							}						
						?>
						*/ %>
						Kategori <b>Musik</b><br>
							<a href=''>
								<img src='${pageContext.request.contextPath}/include/img/barang1.jpg'>
							</a>							
					</li>
				</ul>
		</div>
		<!--end content-->		
	</body>	
</html>
