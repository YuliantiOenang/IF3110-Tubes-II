<!DOCTYPE HTML>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>Masukkan Judul Dokumen</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
</head>
<body>
	
                <jsp:include page="Header.jsp"/>
                <jsp:include page="Navbar.jsp"/>
		
		<div id="nama">
		<div id="form-registrasi" class="frame">
			<p id="registration-title">Your Shopping Cart</p>
			
				<p>&nbsp;</p>
		<%

            Connection con1 = null;

            try {
                    try { 
                    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                    }catch(ClassNotFoundException ce){out.println(ce);} 

            con1 = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");

            PreparedStatement st2;
			  			
            String id = request.getParameter("id");
            String nama = request.getParameter("nama");
            String jumlah = request.getParameter("buy");
            String harga = request.getParameter("harga");
            String IdName = session.getAttribute("login_user").toString();

            st2 = con1.prepareStatement("INSERT INTO cart (id,nama,harga,jumlah, IdName) VALUES (?,?,?,?, ?)"  );
            st2.setString(1,id);
            st2.setString(2,nama);
            st2.setString(3,harga); 
            st2.setString(4,jumlah);
            st2.setString(5,IdName);			

            st2.executeUpdate();
			
            st2.clearParameters();
            con1.close();
            } catch (Exception e) {out.println(e.toString()); };

            Connection con2 = null;

            try {
                    try { 
                    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                    }catch(ClassNotFoundException ce){out.println(ce);} 

            con2 = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");

            PreparedStatement st3;
			
            st3 = con2.prepareStatement("update cart set total = harga*jumlah");
            st3.executeUpdate("update cart set total = harga*jumlah");
            st3.clearParameters();;
           
            con2.close();
            } catch (Exception e) {out.println("Unable "); };
        %>
		
		
		<%

            Connection con = null;

            try {
                    try { 
                    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                    }catch(ClassNotFoundException ce){out.println(ce);} 

            con = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");

            PreparedStatement st;
			
            ResultSet rs;
			String id = request.getParameter("id");
            st = con.prepareStatement("SELECT * FROM cart");

            rs = st.executeQuery();
            st.clearParameters();

            while(rs.next()){

        %>
				<div class="kolom-6 product">					
					<div class="frame">
						<div class="kolom-6">
							<div class='kotak2' align="left"><%=rs.getString(2) %></div> 
							<div class='kotak2' align="left"><%="Harga @ :"%> <%= rs.getString(3) %></div>
							<div class='kotak2' align="left"><%="Jumlah :"%> <%= rs.getString(4) %></div>
							<div class='kotak2' align="left"><%="Jumlah Harga :"%> <%= rs.getString(5) %></div>
							<input type="hidden" name="id" value="<%=rs.getString(1) %>">
														
							<p>&nbsp;</p>
							<a id="btn-order" href=<%="beli.jsp?id="%><%=rs.getString(1) %><%="&buy="%><%=rs.getString(4) %> class="btn" align="left">Lanjutkan Order&raquo;</a>
							</div>
					</div>
				</div>
			    
				

        <%
            }
			
            con.close();
            } catch (Exception e) {out.println("Unable to connect to database."); };
			
        %>
				
			
		</div>
	</div>
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>
</body>
</html>