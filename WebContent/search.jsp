<%@include file="header.jsp"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

</body>
</html>

<%
	if (request.getParameter("search")!=null) {
		String namabarang=request.getParameter("namabarang");
		String kategori=request.getParameter("kategori");
		System.out.println(kategori);
		String harga=request.getParameter("harga");
		System.out.println(harga);
		int atas=0; int bawah=0;
		if (harga.equals("0")) {
			bawah=0;
			atas=99999999;
		} else if (harga.equals("1")) {
			bawah=0;
			atas=10000;
		} else if (harga.equals("2")) {
			bawah=10000;
			atas=25000;
		} else if (harga.equals("3")) {
			bawah=25000;
			atas=50000;
		} else if (harga.equals("4")) {
			bawah=50000;
			atas=75000;
		} else if (harga.equals("5")) {
			bawah=75000;
			atas=99999999;
		}
		
		if (kategori==null) {
			kategori="";
		}
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}
		catch(Exception e){
			System.out.println("Error!!!!!!" + e);
		}
		
		if (namabarang!=null) {
			try {
				Connection conn=null;
				ResultSet resultsearch=null;
				Statement stmt=null;
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/tubesweb",
				 "root","");
				PreparedStatement stmt3 = conn.prepareStatement("select * from barang where UPPER(namabarang) like UPPER('%"+namabarang+"%') and harga>="+bawah+" and harga <"+atas+" and kategori like '%"+kategori+"%'  ");
				resultsearch=stmt3.executeQuery();
				int jumlah;
				try {
					resultsearch.last();
				    jumlah = resultsearch.getRow();
				    resultsearch.beforeFirst();
				}
				catch(Exception ex) {
					jumlah=0;
				}
				System.out.println("jumlah="+jumlah);
				if (jumlah==0) {
					%> <script type="text/javascript">
					alert("Tidak Ada Hasil Ditemukan");
				 </script> <%
				} else {
					int i=0;
					while (resultsearch.next()){
		             	String path=resultsearch.getString("path");
		           		int id=resultsearch.getInt("id");
		           		String namabrg= resultsearch.getString("namabarang");
		           		int hargab=resultsearch.getInt("harga");
		           		if (i%2==0) {
		           		%> 
		           		
		           		<%
		           		%>
		           			<div id="divresult">
							<form id="formresult" name="formregistrasi" >
							<img src='<%= path%>' height="100" width="100" > </br>
							<span id="resultnama"> <a href="detail.jsp?&idb=<%= id %>"> <b> <%= namabrg%></b> </a>   </span> </br>
							<span id=resultharga> <%= hargab%> IDR</span> </br>
							</form>
							</div>'
		           		<%} else {
		           		%>
		           			<div id="divresult">
		    				<form id="formresult2" name="formregistrasi" >
		    				<img src='<%= path%>' height="100" width="100" > </br>
		    				<span id="resultnama"> <a href="detail.jsp?&idb=<%= id %>"> <b> <%= namabrg%></b> </a>   </span> </br>
							<span id=resultharga> <%= hargab%> IDR</span> </br>
		    				</form>
		    				</div>	
		           		<%	
		           		}
		           		i++;
					}
					
					
				}
				
				
			}
			catch(SQLException e) {
				System.out.println("Error!!!!!!" + e);
			}
		}
	}
%>