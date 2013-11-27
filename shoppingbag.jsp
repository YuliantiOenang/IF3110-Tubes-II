<!DOCTYPE html>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
	Connection con = null;	
	try {
		try { 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		}catch(ClassNotFoundException ce){out.println(ce);} 
   
		con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
		String query = "SELECT * FROM cart WHERE username='yanuararistya'";
		PreparedStatement st = con.prepareStatement(query);
		
		ResultSet rs = st.executeQuery();
		
		st.clearParameters();
%>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="letoy.css">
	<link rel="stylesheet" type="text/css" href="shoppingbag.css">
	<script src="header.js"></script>
	<script src="ajaxLoader.js"></script>
	<script>
		function Bayar() {
			var xmlhttp;
			if (window.XMLHttpRequest)
			  {// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			  }
			else
			  {// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			  }
			xmlhttp.onreadystatechange=function()
			  {
			  if (xmlhttp.readyState==4 && xmlhttp.status==200)
				{
					alert(xmlhttp.response);
				}
			  }
			xmlhttp.open("GET","bayar.jsp",true);
			xmlhttp.send();
		}
	</script>
</head>

<body>
	<div id='topBorder'></div>

	<div id='contentArea'>
		<div id='titleLine'>
			<div class='shoppedItemName'>Nama Barang</div>
			<div class='shoppedItemPrice'>Harga Satuan</div>
			<div class='shoppedItemNumber'>Jumlah</div>
			<div class='shoppedItemPrice'>Total </div>
		</div>
		
		<div id='items'>
			<%
				int total = 0;
				while(rs.next()) {
					Connection con2 = null;
					try {
						try { 
						Class.forName("com.mysql.jdbc.Driver").newInstance(); 
						}catch(ClassNotFoundException ce){out.println(ce);} 
					    
						con2 = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
						
						String query2 = "SELECT harga FROM barang WHERE nama=?";
						PreparedStatement st2 = con.prepareStatement(query2);
						st2.setString(1, rs.getString(1));
						
						ResultSet rs2 = st2.executeQuery();
						
						if (rs2.next()) {
							out.println("<div class='shoppedItem'>");
							out.println("<div class='shoppedItemName'>"+rs.getString(1)+"</div>");
							out.println("<div class='shoppedItemPrice'>"+rs2.getString(1)+"</div>");
							out.println("<div class='shoppedItemNumber'>"+rs.getInt(2)+"</div>");
							out.println("<div class='shoppedItemPrice'>"+rs2.getInt(1) * rs.getInt(2)+"</div>");
							out.println("</div>");
							total += rs2.getInt(1) * rs.getInt(2);
						}
						
						st2.clearParameters();
						con2.close();
					} catch (Exception e) {out.println(e.toString()); };
				}
			%>
		</div>
		
		<div id='bottomLine'>
			<div class='shoppedItemName'>Total</div>
			<div class='shoppedItemPrice'>-</div>
			<div class='shoppedItemNumber'>-</div>
			<div class='shoppedItemPrice'>Rp. <%= total %></div>
		</div>
		<BR>
		<button class='button' id='payButton' onclick='Bayar()'>Bayar!</button>
	</div>

	<div id='header' >
		<script> drawHeaderContent(); </script>
	</div>

</body>
<%	
		con.close();
	} catch (Exception e) {out.println(e.toString()); };
%>
</html>