<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    String queryIn = request.getParameter("q");
    String msg = "";

    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost/newcommerce";
    String user = "root";
    String password = "";

    String myQuery = "SELECT * FROM item WHERE nama REGEXP '" + queryIn + "'";

    Class.forName(driver);
    Connection con = DriverManager.getConnection(url, user, password);

    Statement statement = con.createStatement();
    ResultSet resultSet;
    resultSet = statement.executeQuery(myQuery);

    resultSet = statement.executeQuery(myQuery);

    while (resultSet.next()) {
        msg += resultSet.getString(2) + "<br/>";
    }

    msg += "Hey ajax!";

    con.close();
%>

<!--Returned value to the index.html-->
<%="Out!"%>