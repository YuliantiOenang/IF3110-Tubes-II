Profile updated!
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    String inusername = request.getParameter("username");
    String infullname = request.getParameter("fullname");
    String inpassword = request.getParameter("password");
    String inalamat = request.getParameter("alamat");
    String inkecamatan = request.getParameter("provinsi");
    String inprovinsi = request.getParameter("kecamatan");
    String inkodepos = request.getParameter("kodepos");
    String intelepon = request.getParameter("telepon");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/newcommerce", "root", "");
    Statement statement = con.createStatement();

    String myQuery= "UPDATE users SET fullname='" + infullname + "', password='" + inpassword + "', alamat='" + inalamat + "', kecamatan='" + inkecamatan + "',"
 + "provinsi='" + inprovinsi + "', kodepos='" + inkodepos + "', telepon='" + intelepon + "' WHERE username='" + inusername + "'";

    statement.executeUpdate(myQuery);

    con.close();
%>