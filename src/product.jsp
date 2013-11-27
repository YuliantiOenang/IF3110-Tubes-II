<%@ include file="header.jsp" %>
		<script src="AJAXaddtocart.js"></script>
		<script>
			if (localStorage.user=="admin") {
				window.location = "indexadmin.jsp"
			}
		</script>
		<link rel="stylesheet" href="layout.css">
	</head>
<%@ include file="middle.jsp" %>
		<div id="product">
		<div id="container">
		<h2><%= request.getParameter("kategori").substring(0,1).toUpperCase()+request.getParameter("kategori").substring(1) %></h2>
		<form id="sort" action="product.jsp" method="get">
			Sort : <select name="sort">
				<option value="namaasc" selected>Nama (a-z)</option>
				<option value="namadsc">Nama (z-a)</option>
				<option value="hargaasc">Harga (a-z)</option>
				<option value="hargadsc">Harga (z-a)</option>
			</select>
			<input type="hidden" name="kategori" value="<%=request.getParameter("kategori")%>">
			<input type="submit" value="Sort"><br><br>
		</form>
		<%
			String kategori=request.getParameter("kategori");
			String sort=request.getParameter("sort");
			
			// Connect to database
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ruserba","root",""); 
			Statement st= con.createStatement(); 

			// Query from database
			String sql=null;
			if (sort.equals("namaasc")) {
				sql = "SELECT * FROM barang WHERE kategori='"+kategori+"' ORDER BY nama";
			}
			else if (sort.equals("namadsc")) {
				sql = "SELECT * FROM barang WHERE kategori='"+kategori+"' ORDER BY nama DESC";
			}
			else if (sort.equals("hargaasc")) {
				sql = "SELECT * FROM barang WHERE kategori='"+kategori+"' ORDER BY harga";
			}
			else if (sort.equals("hargadsc")) {
				sql = "SELECT * FROM barang WHERE kategori='"+kategori+"' ORDER BY harga DESC";
			}
			ResultSet rs;
			rs=st.executeQuery(sql);
			
			//Tentukan banyak baris
			rs.last();
			int rows = rs.getRow();
			rs.beforeFirst();
			
			//Cek pagenum ada/tidak
			int pagenum;
			if (request.getParameter("pagenum")==null) { 
				pagenum = 1;
			}
			else {
				pagenum = Integer.parseInt(request.getParameter("pagenum"));
			}
			
			// Tentukan halaman last
			int page_rows = 10;
			int last = (int)Math.ceil((double)rows/page_rows);
			
			// Koreksi jika pagenum di luar range
			if (pagenum < 1) {
				pagenum = 1;
			}
			else if (pagenum > last) {
				pagenum = last; 
			}
			
			// Range query ke database
			String max = " LIMIT "+((pagenum - 1)*page_rows)+","+page_rows;
			
			// Lakukan query sesuai range
			sql = sql+max;
			rs=st.executeQuery(sql);

			// Display result
			while (rs.next()) {
				String nama=rs.getString("nama");
				String harga=rs.getString("harga");
				out.print( "<img src=\"/tubes2/images/"+nama+".jpg\" alt='gambar' width='400' height='300'><br>");
				out.print( "Nama: <a href='detil.jsp?nama="+nama+"&harga="+harga+"'>"+nama+"</a><br>");
				out.print( "Harga: "+harga+"<br>");
				out.print( "Banyak: <input type='text' name='qty' id='"+nama+"'>");
				out.print( "<button type='button' onclick='AJAXaddtocart(\""+nama+"\")'>Add to cart</button><br><br>");
			}
			
			// Display Paginasi
			out.print( " --Page "+pagenum+" of "+last+"-- <p>");
			if (pagenum == 1) {
			}
			else {
				out.print( " <a href='product.jsp?pagenum=1&kategori="+kategori+"&sort="+sort+"'> <<-First</a> ");
				out.print( " ");
				int previous = pagenum-1;
				out.print( " <a href='product.jsp?pagenum="+previous+"&kategori="+kategori+"&sort="+sort+"'> <-Previous</a> ");
			} 
			out.print( " ---- ");
			if (pagenum == last) {
			}
			else {
				int next = pagenum+1;
				out.print( " <a href='product.jsp?pagenum="+next+"&kategori="+kategori+"&sort="+sort+"'>Next -></a> ");
				out.print( " ");
				out.print( " <a href='product.jsp?pagenum="+last+"&kategori="+kategori+"&sort="+sort+"'>Last ->></a> ");
			} 
			con.close();
		%>
		</div>
	</div>
	</body>
</html>