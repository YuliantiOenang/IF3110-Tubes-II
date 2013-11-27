<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    String ccnumber = request.getParameter("ccnumber");
    String nameoncard = request.getParameter("nameoncard");
    String expired = request.getParameter("expired");

    String driver = "com.mysql.jdbc.Driver";
    String dburl = "jdbc:mysql://localhost/newcommerce";
    String dbuser = "root";
    String dbpassword = "";
    String nameoncardaccordingtothedatabase = "";

    Class.forName(driver);
    Connection con = DriverManager.getConnection(dburl, dbuser, dbpassword);
    Statement statement = con.createStatement();

    ResultSet resultSet;
    resultSet = statement.executeQuery("SELECT nameoncard FROM cards WHERE ccnumber = '" + ccnumber + "'");

    while (resultSet.next()) {
        nameoncardaccordingtothedatabase += resultSet.getString(1);
    }

    out.println(nameoncard + " " + nameoncardaccordingtothedatabase + "<br><br>");

    if (nameoncard.matches(nameoncardaccordingtothedatabase)) {
        out.println("Sama!");
    } else {
        out.println("Beda!");
    }

    con.close();
%>