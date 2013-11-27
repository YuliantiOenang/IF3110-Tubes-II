<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
	Connection con = null;
	String[] data = new String[8];
	String kategori = request.getParameter("kategori");
	String keyword = request.getParameter("keyword");
	
	try {
		try { 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}catch(ClassNotFoundException ce){out.println(ce);} 
   
		con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
		
		PreparedStatement st;
		String key= request.getParameter("keyword");
		String query = "SELECT * , (case when kategori like '%"+key+"%' then 1 else 0 end) + (case when nama like '%"+key+"%' then 1 else 0 end) + (case when keterangan like '%"+key+"%' then 1 else 0 end) as priority from barang where (kategori like '%"+key+"%' or nama like '%"+key+"%' or keterangan like '%"+key+"%' or harga like '%"+key+"%')";
		
		if (!request.getParameter("kategori").equals("default")) {
			query += " and kategori='" + request.getParameter("kategori")+"'";
		}
		query += " order by "+request.getParameter("sortBy")+" DESC";
		
		/*
		if (!request.getParameter("kategori").equals("default")) {
			query += " and kategori="+request.getParameter("kategori");
		}
		query += "order by "+request.getParameter("sortBy")+" desc";*/
			
		st = con.prepareStatement(query);
		
		ResultSet rs;
		rs = st.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="letoy.css">
	<link rel="stylesheet" type="text/css" href="browse.css">
	<script src="header.js"></script>
	<script src="ajaxLoader.js"></script>
	<script>
		function getUrlVars() {
			var vars = {};
			var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
				vars[key] = value;
			});
			return vars;
		}
		
		function sorting(sort) {
			var kategori = getUrlVars()['kategori'];
			var keyword = getUrlVars()['keyword'];
			document.location.href = 'browse.jsp?sortBy='+sort+'&currentPage=1&keyword='+keyword+'&kategori='+kategori;
		}
	</script>
</head>
<body>
	<div id='topBorder'></div>

	<div id='contentArea'>
		<div class="browseOption">
		<h2>
			sort by : 
			<select class="dropDown" name="sort" onchange='sorting(this.value)'>
				<option value="default">sorting...</option>
				<option value="popularitas">popularitas</option>
				<option value="harga">harga</option>
				<option value="kategori">jenis barang</option>
			</select>
		</h2>
		</div>
		
		<div id='searchedItem'>
			<%
				int temp = 0;
				int currentIndex = Integer.parseInt(request.getParameter("currentPage"));
				while (rs.next()) {
					if (temp >= (currentIndex*10 - 10) && (temp < (currentIndex*10))) {
						String s = "<div class='itemView'>";
						s+= "<img src='resource/"+rs.getString(1)+".jpg' class='itemImage'>";
						s+= "<form class='itemDetail'>";
						s+= "<h1><a href='detail.jsp?nama="+rs.getString(1)+"'> "+rs.getString(1)+" </a></h1></br>";
						s+= "<h2>harga @ Rp."+rs.getString(3)+"</br>";
						s+= "jumlah pembelian: <input class='textInput' id='quantity' type='text' name='jumlahBarang' value=0></br>";
						s+= "<input class='button' type='submit' value='tambahkan ke tas'></h2>";
						s+= "</form>";
						s+= "</div>";
						out.println(s);
					}
					temp++;
				}
			%>
		</div>
		
		<div class="browseOption">
			<h3></h3>
		</div>
	</div>

	<div id='header' >
		<script> drawHeaderContent(); </script>
	</div>

</body>
<% 	
		st.clearParameters();
		con.close();
	} catch (Exception e) {out.println(e.toString()); };
%>
</html>