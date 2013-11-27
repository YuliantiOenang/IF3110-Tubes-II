Hello <b><%= "Ini adalah hasil pencarian untuk kueri '" + request.getParameter("q") + "'.<br><br><br>"%></b>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");
    
    String driver = "com.mysql.jdbc.Driver";
    Class.forName(driver);
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/newcommerce", "root", "");

    Statement statement = con.createStatement();
    statement.executeUpdate("INSERT INTO users VALUES ('" + username + "', '" + password + "', '" + fullname + "', '" + email + "')");

    con.close();
%>

<!--Returned value-->
<%= "User " + username + " has been registered. Enjoy your shop!"%>