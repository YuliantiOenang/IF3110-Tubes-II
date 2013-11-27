<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    String username = request.getParameter("regusername");
    String password = request.getParameter("regpassword");
    String fullname = request.getParameter("regfullname");
    String email = request.getParameter("regemail");

    String driver = "com.mysql.jdbc.Driver";
    String dburl = "jdbc:mysql://localhost/newcommerce";
    String dbuser = "root";
    String dbpassword = "";

    Class.forName(driver);
    Connection con = DriverManager.getConnection(dburl, dbuser, dbpassword);
    Statement statement = con.createStatement();

    statement.executeUpdate("INSERT INTO users VALUES ('" + username + "', '" + password + "', '" + fullname + "', '" + email + "');");
    con.close();
%>

User <b><%= request.getParameter("regusername")%> berhasil didaftarkan!</b>