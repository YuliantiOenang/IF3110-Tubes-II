<%@ include file="header.jsp" %>
		<script src="AJAXaddtocart.js"></script>
	</head>
<%@ include file="middle.jsp" %>
		<h2>Search Result</h2>
		<%
			String keyword=request.getParameter("keyword");
			String kategori=request.getParameter("kategori");
			String range=request.getParameter("range");
			
			// Connect to database
			Class.forName("com.mysql.jdbc.Driver"); 
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ruserba","root",""); 
			Statement st= con.createStatement(); 

			// Query from database
			String sql=null;
			if (range.equals("<10000")) {
				sql = "SELECT * FROM barang WHERE kategori='"+kategori+"' AND nama LIKE '%"+keyword+"%' AND harga < 10000";
			}
			else if (range.equals("10000-50000")) {
				sql = "SELECT * FROM barang WHERE kategori='"+kategori+"' AND nama LIKE '%"+keyword+"%' AND (harga BETWEEN 10000 AND 50000)";
			}
			else if (range.equals(">50000")) {
				sql = "SELECT * FROM barang WHERE kategori='"+kategori+"' AND nama LIKE '%"+keyword+"%' AND harga > 50000";
			}
			ResultSet rs;
			rs=st.executeQuery(sql);
			
			//Tentukan banyak baris
			rs.last();
			int rows = rs.getRow();
			rs.beforeFirst();
			
			if (rows == 0) {
				out.print( "<h3>Tidak ada hasil pencarian</h3>");
			}
			else {
				//Cek pagenum ada/tidak
				int pagenum;
				if (request.getParameter("pagenum")==null) { 
					pagenum = 1;
				}
				else {
					pagenum = Integer.parseInt(request.getParameter("pagenum"));
				}
				
				// Tentukan halaman last
				int page_rows = 2;
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
					out.print( " <a href='search.jsp?pagenum=1&keyword="+keyword+"&kategori="+kategori+"&range="+range+"'> <<-First</a> ");
					out.print( " ");
					int previous = pagenum-1;
					out.print( " <a href='search.jsp?pagenum="+previous+"&keyword="+keyword+"&kategori="+kategori+"&range="+range+"'> <-Previous</a> ");
				} 
				out.print( " ---- ");
				if (pagenum == last) {
				}
				else {
					int next = pagenum+1;
					out.print( " <a href='search.jsp?pagenum="+next+"&keyword="+keyword+"&kategori="+kategori+"&range="+range+"'>Next -></a> ");
					out.print( " ");
					out.print( " <a href='search.jsp?pagenum="+last+"&keyword="+keyword+"&kategori="+kategori+"&range="+range+"'>Last ->></a> ");
				} 
				con.close();
			}
		%>
	</body>
</html>