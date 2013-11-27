<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String email = request.getParameter("m");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/newcommerce", "root", "");
    Statement st = con.createStatement();

    ResultSet rs = st.executeQuery("SELECT * FROM users WHERE username = '" + email + "'");

    if (rs.next()) {
        out.println("<font color=red>");
        out.println("Email already taken");
        out.println("</font>");
    } else {
        out.println("<font color=green>");
        out.println("Email available");
        out.println("</font>");
    }

    rs.close();
    st.close();
    con.close();
%> 