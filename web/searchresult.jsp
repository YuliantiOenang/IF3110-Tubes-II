Hello <b><%= "Ini adalah hasil pencarian untuk kueri '" + request.getParameter("q") + "'.<br><br><br>"%></b>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    String userQueryInput = request.getParameter("q").replaceAll(" ", "|");
    int pageNumberInput = Integer.parseInt(request.getParameter("p"));
    String msg = "";

    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost/newcommerce";
    String user = "root";
    String password = "";

    int countSearchResult = 0;
    String countQuery = "SELECT * FROM items WHERE nama REGEXP '" + userQueryInput + "'";
    String myQuery = "SELECT * FROM item WHERE nama REGEXP '" + userQueryInput + "' LIMIT 10 OFFSET " + String.valueOf((pageNumberInput - 1) * 10);

    Class.forName(driver);
    Connection con = DriverManager.getConnection(url, user, password);
    Statement statement = con.createStatement();

    ResultSet resultSet;

    resultSet = statement.executeQuery(countQuery);
    while (resultSet.next()) {
        countSearchResult++;
    }

    resultSet = statement.executeQuery(myQuery);

    while (resultSet.next()) {
        msg += resultSet.getString(2) + "<br/>";
    }

    msg += "<br/><br/>Jumlah search adalah: " + countSearchResult + "<br/>";

    int numberOfPages = 1 + countSearchResult / 10;
    if (countSearchResult % 10 == 0) {
        numberOfPages--;
    }

    for (int i = 1; i < numberOfPages + 1; i++) {
        msg += "<a href='searchresult.jsp?q=" + userQueryInput + "&p=" + i + "'>" + i + "</a> &nbsp;";
    }

    con.close();
%>

<!--Returned value-->
<%=msg%>