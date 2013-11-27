<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    String driver = "com.mysql.jdbc.Driver";
    String msg = "";
    Class.forName(driver);
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/newcommerce", "root", "");
    Statement statement = con.createStatement();

    ResultSet resultSet;
    resultSet = statement.executeQuery("SELECT * FROM items WHERE nama = '" + request.getParameter("i") + "'");

    while (resultSet.next()) {
        msg += "<strong>Nama barang</strong>: " + resultSet.getString(1) + "<br/>"
                + "<strong>Stok dalam gudang</strong>: " + resultSet.getString(2) + "<br/>"
                + "<strong>Harga</strong>: " + resultSet.getString(3) + " <br/> "
                + "<strong>Kategori</strong>: " + resultSet.getString(4) + "<br/>"
                + "<strong>Deskripsi</strong>: " + resultSet.getString(5) + " <br/> "
                + "<strong>Yang udah laku</strong>: " + resultSet.getString(6) + "<br/>"
                + "<strong>Gambar</strong>:<br/> <img src=\"../img/" + resultSet.getString(1) + ".jpg\"> <br/>"
                + "<br/><br/><a href=\"index.jsp\">Back</a>";
    }
    con.close();
%>

<%=msg%>