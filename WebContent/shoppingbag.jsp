<%@page import="bean.Barang"%>
<%@page import="bean.Transaksi"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="header.jsp" />

<h3>Your Shopping Cart</h3>
<!-- <form name="shopping_cart" action="edit_shopcart.php" method="post"> -->
<%
	ArrayList<Transaksi> shopList = (ArrayList<Transaksi>)request.getAttribute("arrayTransaksi");
	if (session.getAttribute("username") != null) {
		ArrayList<String> kartu = new ArrayList<String>();
		kartu=(ArrayList<String>) request.getAttribute("card");
		shopList = (ArrayList<Transaksi>) session.getAttribute("IT");
		System.out.println(shopList.get(0).getRequest_tambahan());
		System.out.println(""+shopList.size());
		
		if (shopList != null) {
			int totalPengeluaran = 0;
			for (int i = 0; i < 1; i++) {
				totalPengeluaran += (shopList.get(i).getBarang().getHarga_barang() * shopList.get(i).getQt());
				out.print("<h4><b>" + (i + 1) + ". "+ shopList.get(i).getBarang().getNama_barang()+ "</b></h4>");
				out.print("<p>Quantity : "+ shopList.get(i).getQt() + "</p>");
				out.print("<p>__Total Harga ____: "+ (shopList.get(i).getBarang().getHarga_barang() * shopList.get(i).getQt()) + "</p>");
				out.print("<p>Request Tambahan = "+ shopList.get(i).getRequest_tambahan()+ "</p><br></br>");
			}  
			out.print("<p>Total harga barang yang Anda pesan adalah ==================================> "+ totalPengeluaran);
			out.print("<h4>Silahkan pilih kartu kredit Anda : </h4>");
			out.print("<form method=\"post\" action=\"beli.jsp\"> <select name=\"kartuTerpilih\">");
			boolean klik;
			if(kartu.size()<=0){
				klik=false;
			}else{
				klik=true;
			}
			for (int i = 0; i < kartu.size(); i++) {
				out.print("<option name=\"" + kartu.get(i) + "\">"
						+ kartu.get(i) + "</option>");
			}
			
			if(!klik){
				out.print("</select> <input id=\"BuatBeli\" type=\"submit\" value=\"BELI\" disabled></form>");
				out.print("Silahkan mendaftarkan kartu kredit Anda dahulu");
			}else{
				out.print("</select> <input id=\"BuatBeli\" type=\"submit\" value=\"BELI\"></form>");
			}

		} else {
			shopList = new ArrayList<Transaksi>();
			out.print("<h4><b>Maaf, Keranjang Anda Masih Kosong</b></h4>");
		}
	} else {
		System.out.println("Belum LOGIN WOII!!!");
		response.sendRedirect("/ruko/");
	}
%>

<jsp:include page="footer.jsp" />
