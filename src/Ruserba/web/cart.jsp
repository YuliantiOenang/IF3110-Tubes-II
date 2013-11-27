<%-- 
    Document   : cart
    Created on : 27-Nov-2013, 12:59:59
    Author     : Asus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Class.GetConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Keranjang Belanja</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body onload="select()">
		<!--Header-->
		<div id="header">
            <%@ include file="header.jsp"%>
            <%  GetConnection getCon = new GetConnection();
                Connection conn = getCon.getConnection();
                Statement stt = conn.createStatement();

                String query = "SELECT * FROM cart WHERE profil_ID=\'" + request.getSession().getAttribute("userlistapp") + "\'";

                ResultSet rs = stt.executeQuery(query);
				rs.last();
				int rows = rs.getRow();
			%>
		</div>
		<!--Body-->
			<div id="profile-page-body">
				<div id="profil">
					<%
						out.print("<h1>Daftar Keranjang Belanja</h1>");
						for (int i = 0; i < rows; i++) {
							out.print("Barang<br><br>");
							out.print("Jumlah<br><br>");
							out.print("Note<br><br>");
							out.print("<br>");
						}
					%>
				</div>
				
				<div id="profil">
					<%
					out.print("<h1><br></h1>");
					rs.first();
					for (int i = 0; i < rows; i++) {
						out.print("  : "+rs.getString("cart_goods")+"<br><br>");
						out.print("  : "+rs.getString("cart_count")+"<br><br>");
						out.print("  : "+rs.getString("cart_note")+"<br><br>");
						rs.next();
					}
					%>
				</div>
				
				<div id="cartbutton">
					<form id="buttonbayar" method="post" action="confirmkartu"><input type="submit" value="Bayar" ></form>
					
					<form id="buttoncancel" method="post" action="cancelcart"><input type="submit" value="Cancel" ></form>
				</div>
				

			</div>
	</body>
</html>