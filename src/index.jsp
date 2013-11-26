<%@ include file="header.jsp" %>
		<script src="AJAXaddtocart.js"></script>
		<link rel="stylesheet" href="layout.css">
	</head>
<%@ include file="middle.jsp" %>
		<div id="product">
		<div id="container">
		<h2>Home</h2>
		<%
			String[] kategori={"beras","daging","ikan","sayur","buah"};
			for(int i=0; i<kategori.length; i++) {
				out.print( "<h3>"+kategori[i].substring(0,1).toUpperCase() + kategori[i].substring(1)+"</h3>");
				// Connect to database
				Class.forName("com.mysql.jdbc.Driver"); 
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ruserba","root",""); 
				Statement st= con.createStatement(); 
				// Query from database
				ResultSet rs=st.executeQuery("SELECT * FROM barang WHERE kategori='"+kategori[i]+"' ORDER BY 'terjual' DESC");
				// Display result
				for (int j=0; j<3; j++) {
					rs.next();
					String nama=rs.getString("nama");
					String harga=rs.getString("harga");
					out.print( "<div id=\"containertop3\">");
					out.print( "<img src=\"/tubes2/images/"+nama+".jpg\" alt='gambar' width='200' height='150'><br>");
					out.print( "Nama: <a href='detil.jsp?nama="+nama+"&harga="+harga+"'>"+nama+"</a><br>");
					out.print( "Harga: "+harga+"<br>");
					out.print( "Banyak: <input type='texttop3' name='qty' id='"+nama+"'>");
					out.print( "<button type='button' onclick='AJAXaddtocart(\""+nama+"\")'>Add to cart</button>");
					out.print( "</div>");
				}
				out.print( "<br><br><br><br><br><br><br><br><br><br><br><br>");
				con.close();
			}
		%>
		</div>
		</div>
	</body>
</html>