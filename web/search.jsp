<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%
    String userQueryInput = request.getParameter("w");
    String pageNumberInput = request.getParameter("p");
    String msg = "";

    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost/progin";
    String user = "root";
    String password = "";
    
    int countSearchResult = 0;

    String myQuery = "SELECT * FROM abjad WHERE a REGEXP '" + userQueryInput + "'";
    
    
    Class.forName(driver);
    Connection con = DriverManager.getConnection(url, user, password);
    Statement statement = con.createStatement();

    ResultSet resultSet = statement.executeQuery(myQuery);

    while (resultSet.next()) {
        msg += "Hasilnya: " + resultSet.getString(2) + "<br/>";
        countSearchResult++;
    }
    
    msg += "<br/><br/>Jumlah search adalah: " + countSearchResult;
    
    int numberOfPages = countSearchResult / 2;
    
    for (int i = 0; i < numberOfPages; i++) {
        msg += "<br><a href=" + i + ">Ini tautan untuk halaman " + i + "</a>&nbsp;";
    }
    
    con.close();
%>


<!--Returned value-->
<%=msg%>