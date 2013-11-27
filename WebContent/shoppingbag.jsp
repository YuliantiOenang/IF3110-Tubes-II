<%@page import="bean.Barang"%>
<%@page import="bean.Transaksi"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="header.jsp" />

<h3>Your Shopping Cart</h3>
<!-- <form name="shopping_cart" action="edit_shopcart.php" method="post"> -->
<%
	if (session.getAttribute("username") != null) {
		ArrayList<String> kartu = new ArrayList<String>();		
		kartu=(ArrayList<String>) request.getAttribute("card");
		
		ArrayList<Transaksi> shopList;
		Barang B = new Barang("101", "Tahu Sumedang",
				"./images/Tahu.png", 1000, 1, 10,
				"tahu dari sumedang. wuenak", 10);
		Transaksi trans = new Transaksi(B, 2,
				"Dibungkus yaah, pake daun pisang kalo bisa");
		shopList = new ArrayList<Transaksi>();
		shopList.add(trans);
		session.setAttribute("shopping_cart", shopList);

		if ((shopList = (ArrayList<Transaksi>) session
				.getAttribute("shopping_cart")) != null) {
			int totalPengeluaran = 0;

			for (int i = 0; i < shopList.size(); i++) {
				totalPengeluaran += (shopList.get(i).getBarang()
						.getHarga_barang() * shopList.get(i)
						.getQuantity());
				out.print("<h4><b>" + (i + 1) + ". "
						+ shopList.get(i).getBarang().getNama_barang()
						+ "</b></h4>");
				out.print("<p>Quantity : "
						+ shopList.get(i).getQuantity() + "</p>");
				out.print("<p>__________________________Total Harga _________________________ : "
						+ (shopList.get(i).getBarang()
								.getHarga_barang() * shopList.get(i)
								.getQuantity()) + "</p>");
				out.print("<p>Request Tambahan = "
						+ shopList.get(i).getReqTambahan()
						+ "</p><br></br>");

			}
			out.print("<p>Total harga barang yang Anda pesan adalah ==================================> "
					+ totalPengeluaran);
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