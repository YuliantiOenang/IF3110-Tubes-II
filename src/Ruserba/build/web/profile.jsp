<%-- 
    Document   : profile
    Created on : Nov 26, 2013, 10:26:54 PM
    Author     : Aldo2
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Class.GetConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Profile</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body onload="select()">
        <!--Header-->
        <div id="header">
            <%@ include file="header.jsp"%>
            <%                                    GetConnection getCon = new GetConnection();
                Connection conn = getCon.getConnection();
                Statement stt = conn.createStatement();

                String query = "SELECT * FROM userprofil WHERE profil_ID='" + session.getAttribute("userlistapp") + "'";

                ResultSet rs = stt.executeQuery(query);

                String profil_name = "";
                String profil_address = "";
                String profil_mobile = "";
                String profil_province = "";
                String profil_district = "";
                String profil_zipcode = "";
                String profil_email = "";
                String profil_transaction = "";
                
                if (rs.next()) {
                    profil_name=rs.getString("profil_name");
                    profil_address=rs.getString("profil_address");
                    profil_mobile=rs.getString("profil_mobile");
                    profil_province=rs.getString("profil_province");
                    profil_district=rs.getString("profil_district");
                    profil_zipcode=rs.getString("profil_zipcode");
                    profil_email=rs.getString("profil_email");
                    profil_transaction=rs.getString("profil_transaction");
                }

                

            %>
        </div>
        <!--Body-->
        <div id="profile-page-body">
            <div id="profil">
                Nama Lengkap</br></br>
                No HP</br></br>
                Alamat</br></br>
                Provinsi</br></br>
                Kabupaten</br></br>
                Kode Pos</br></br>
                Email</br></br>
                Transaksi</br></br>
                <form method="post" action="edit-profile.jsp"><input type="submit" value="Edit" ></form>
            </div>
            <div id="profil">
                <%
                out.print("  : "+profil_name+"</br></br>");
                out.print("  : "+profil_mobile+"</br></br>");
                out.print("  : "+profil_address+"</br></br>");
                out.print("  : "+profil_province+"</br></br>");
                out.print("  : "+profil_district+"</br></br>");
                out.print("  : "+profil_zipcode+"</br></br>");
                out.print("  : "+profil_email+"</br></br>");
                out.print("  : "+profil_transaction+"</br></br>");
                %>
            </div>
        </div>
    </body>
</html>
