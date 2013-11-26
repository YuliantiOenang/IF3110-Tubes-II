<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="kelas.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Result</title>
</head>
<body>
	<div class="page_container">
		<%@ include file="template/template.jsp" %> 
		<br/><br/><br/>
		<form action="search" method="get">
			<div class='sbox'>
				<div id='sb_name'>Nama:</div><div class='sb_value'><input type="text" name="query_name" size="20" onkeyup="showResult(this.value)"></div>
				<div id='sb_name'>Harga:</div><div class='sb_value'><input type="text" name="query_price" size="20"></div>
				<div id='sb_name'>Kategori:</div><div class='sb_value2'><select name="query_category">	
				  <option value="roti">Roti</option>
				  <option value="minuman">Minuman</option>
				  <option value="kalengan">Makanan Kalengan</option>
				  <option value="segar">Makanan Segar</option>
				  <option value="peralatan">Peralatan Rumah</option>
				</select></div>
				<input class="search_image" type="image" src="res/search.png" width="30px">
			</div>
			<div id="livesearch"></div>
		</form>
		<%
		
		String query_name = request.getParameter("query_name");
		String query_category = request.getParameter("query_category");
		String query_price = request.getParameter("query_price");
		
		boolean pertama = true;
		String result = "";
		if(!query_name.equals("")){
			result += "nama " + query_name;
			pertama = false;
		}
		
		if(!query_category.equals("")){
			if(!pertama){
				result += " dan ";
			}
			result += "kategori " + query_category;
			pertama = false;
		}
		
		if(!query_price.equals("")){
			if(!pertama){
				result += " dan ";
			}
			result += "harga " + query_price;
			pertama = false;
		}
		
		out.println("<h1>Hasil Pencarian untuk " + result + "</h1>");
		
		ArrayList<Barang> barangs = (ArrayList<Barang>) request.getAttribute("barangs");
		
		if(barangs.size() == 0){
			%>
				<p>Tidak ada barang yang sesuai dengan kriteria tersebut.</p>
			<%
		} else {
		
			int awal = (request.getParameter("start") == null ? 0 : Integer.parseInt(request.getParameter("start")));
			int no = 0;
			for(Barang b: barangs){
				if(no < awal){
					no++;
					continue;
				}
				%>
				<div class="list_barang">
					<div class="gambar">
						<img src="res/<%= b.getGambar() %>" width="150px" height="150px">
					</div>
					<div class="list_desc">
						<strong>Nama:</strong> <a href="detail?gid=<%= b.getId_inven() %>"><%= b.getNama() %></a><br/>
						<strong>Harga:</strong> <%= b.getHarga() %><br/><br/>
						<form>
							<input type='text' id='quant<%= no %>' value='0' size=7 >
							<img class="cart_button" src="res/addtocart.png" width=125 onclick="validate(<%= b.getId_inven() %>, <%= no %>)">
						</form>
						
						<div id='notif<%=no%>'></div>
					</div>
				</div>
				<%
				if(no - awal == 9){
					break;
				}
				no++;
			}
			%>
			<div class="pagination"> Halaman: 
			<%
			for(int i=0;i<Math.ceil(barangs.size()/10f);i++){
				if(i * 10 == awal){
					out.println("[" + (i+1) + "]");
				} else {
					%>	
					<a href="search?query_name=<%= request.getParameter("query_name") %>&query_price=<%= request.getParameter("query_price") %>&query_category=<%= request.getParameter("query_category") %>&start=<%= i*10 %>"><%= (i+1) %></a>
					<%
				}
			}
		}
		%>
		</div>
		</div>
</body>
<script src="transaction.js"></script>
</html>