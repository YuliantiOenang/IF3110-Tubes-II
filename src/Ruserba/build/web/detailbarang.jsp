<%-- 
    Document   : detailbarang
    Created on : Nov 26, 2013, 9:35:36 PM
    Author     : Aldo2
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Class.GetConnection"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Detail Barang</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<script type="text/javascript" src="js/detailbarang.js"></script>
	</head>
        <body onload="hide()">
		
			<!--Header-->
			<div id="header">
                            <%@ include file="header.jsp" %>
                            <%
                                String namabarang=request.getParameter("namabarang");
                                String hasil=request.getParameter("hasil");
                            %>
                            
                            <%                            
                                
                            String query = "SELECT * FROM goods WHERE goods_name='"+namabarang+"'";
                            String good_detail="",good_price="",good_available="";
                            GetConnection getCon = new GetConnection();
                            Connection conn = getCon.getConnection();
                            Statement stt = conn.createStatement();

                            ResultSet rs = stt.executeQuery(query);

                            while (rs.next()) {
                                good_detail=rs.getString("goods_detail");
                                good_price=rs.getString("goods_price");
                                good_available=rs.getString("goods_available");
                            }

                        %>
			</div>
			<div><hr id="border"></div>
			<!--Body-->
			<div id="detail-body">
				<div id="detail-pic">
                                    <img alt="" id="photo" src="image/goods/<%out.print(namabarang+".jpg");%>" width="120" height="150"/>
   					
					<br />
					<b><%out.print(namabarang);%></b></a>
				</div>
				<div id="main-detail">
					<div id="detail-information">
						<b>Keterangan</b><br />
                                                <%out.print(good_detail);%><br/><br/>
						<b>Harga</b><br />
						<%out.print(good_price);%><br/><br/>
						<b>Stok</b><br />
						<%out.print(good_available);%><br/><br/>
						<b>Pembelian</b><br>
                                                <form method="post" action="beli" enctype="multipart/form-data">
							Notes :<input type="text" id="notes" name="textnotes" /><br>
							jumlah:<input type="text" id="jumlah" name="textjumlah" /><br>
                                                        <input type="hidden" id="namabarangs" name="textnama" value=<% out.print("\""+namabarang+"\"");%>/>
                                                        <%if(session.getAttribute("userlistapp")!=null) out.print("<input type=\"submit\" value=\"Beli\">"); %>
							<div id="warning-message"><% out.print(hasil); %></div>
						</form>
					</div>
				</div>
			</div>
		
	</body>
</html>
