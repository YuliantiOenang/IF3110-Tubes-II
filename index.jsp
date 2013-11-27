<!DOCTYPE html>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
	Connection con = null;
	String index = request.getParameter("kategori");
	int currentIndex = Integer.parseInt(index);
	String[] kategori = new String[5];
	kategori[0] = "makanan";
	kategori[1] = "aksesoris";
	kategori[2] = "pakaian";
	kategori[3] = "furnitur";
	kategori[4] = "mainan";
	
	try {
		try { 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}catch(ClassNotFoundException ce){out.println(ce);} 
   
		con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
		ResultSet[] sets = new ResultSet[5];
		
		for (int i = 0; i < 5; i++) {
			PreparedStatement st;
			String query = "SELECT nama FROM barang WHERE kategori=? ORDER BY popularitas";
				
			st = con.prepareStatement(query);
			st.setString(1, kategori[i]);
			
			sets[i] = st.executeQuery();
			st.clearParameters();
		}
		
		int i = 0;
%>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="letoy.css">
	<link rel="stylesheet" type="text/css" href="index.css">
	<script src="header.js"></script>
	<script>
		var currentIndex = <%= currentIndex %>
		function onPrevClicked() {
			currentIndex--;
			if (currentIndex < 0)
				currentIndex = 4;
			document.location.href='index.jsp?kategori='+currentIndex;
		}
		
		function onNextClicked() {
			currentIndex++;
			if (currentIndex > 4)
				currentIndex = 0;
			document.location.href='index.jsp?kategori='+currentIndex;
		}
	</script>
</head>
<body>
	<div id='topBorder'></div>
	
	<div class='contentArea'>
		<h1> <%= kategori[currentIndex]%></h1>
		<%
			while (sets[currentIndex].next() && i < 3) {
				out.println("<img src='resource/"+sets[currentIndex].getString(1)+".jpg' class='homeImage'>");
				i++;
			}
		%>
		<BR>
		<button class='button' onclick='onPrevClicked()'>Prev</button>
		<button class='button' onclick='onNextClicked()'>Next</button>
		
		<div id='Mekanisme'>
			<h1>Mekanisme</h1>
			<img src='resource/mekanisme.png'>
		</div>
	</div>
	
	<div id='header' >
		<script>drawHeaderContent();</script>
	</div>
	
</body>
<%	
		con.close();
	} catch (Exception e) {out.println(e.toString()); };
%>
</html>