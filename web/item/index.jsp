<b><%= "Ini adalah halaman barang untuk kueri '" + request.getParameter("q") + "' dan kategori '" + request.getParameter(
        "cat") + "' dan halaman '" + request.getParameter("p") %> "'.<br><br><a href="additem.jsp">Add Item</a><br><br></b>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
    <%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    String driver = "com.mysql.jdbc.Driver";
    String msg = "";
    Class.forName(driver);
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/newcommerce", "root", "");
    Statement statement = con.createStatement();

    String searchQuery = "";
    if (request.getParameter("q") != null) {
        searchQuery = request.getParameter("q").replaceAll(" ", "|");
    };

    String searchCategory = "";
    if (request.getParameter("cat") != null) {
        searchQuery = request.getParameter("cat").replaceAll(" ", "|");
    };

    int searchPageNumber = 1;
    if (request.getParameter("p") != null) {
        searchPageNumber = Integer.parseInt(request.getParameter("p"));
    };


    int countSearchResult = 0;

    String countQuery = "";
    String myQuery = "";

    if (searchQuery == "") { // Kalau kueri kosong
        countQuery = "SELECT * FROM items";
        myQuery = "SELECT * FROM items LIMIT 10 OFFSET " + String.valueOf((searchPageNumber - 1) * 10);
    } else { // kalau kueri ada isinya
        countQuery = "SELECT * FROM items WHERE nama REGEXP '" + searchQuery + "'";
        myQuery = "SELECT * FROM items WHERE nama REGEXP '" + searchQuery + "' LIMIT 10 OFFSET " + String.valueOf((searchPageNumber - 1) * 10);
    }


    ResultSet resultSet;
    resultSet = statement.executeQuery(countQuery);
    while (resultSet.next()) {
        countSearchResult++;
    }

    resultSet = statement.executeQuery(myQuery);

    while (resultSet.next()) {
        msg += "<a href='viewitem.jsp?i=" + resultSet.getString(1) + "'>" + resultSet.getString(1) + "</a> | " + resultSet.getString(2) + " | " + resultSet.getString(3) + " | " + resultSet.getString(4) + " | " + resultSet.getString(5) + " | " + resultSet.getString(6) + "<br/>";
    }

    msg += "<br/><br/>Jumlah search adalah: " + countSearchResult + "<br/>";

    int numberOfPages = 1 + countSearchResult / 10;
    if (countSearchResult % 10 == 0) {
        numberOfPages--;
    }

    for (int i = 1; i < numberOfPages + 1; i++) {
        msg += "<a href='index.jsp?q=" + searchQuery + "&p=" + i + "&cat=" + searchCategory + "'>" + i + "</a> &nbsp;";
    }

    con.close();
%>

<%=msg%>