<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    String nama = request.getParameter("nama");
    String stok = request.getParameter("stok");
    String harga = request.getParameter("harga");
    String kategori = request.getParameter("kategori");
    String deskripsi = request.getParameter("deskripsi");

    String driver = "com.mysql.jdbc.Driver";
    Class.forName(driver);
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/newcommerce", "root", "");

    Statement statement = con.createStatement();
    statement.executeUpdate("INSERT INTO items VALUES ('" + nama + "', '" + stok + "', '" + harga + "', '" + kategori + "', '" + deskripsi + "', '0')");

    con.close();
%>


<%

    String saveFile = "";
    String contentType = request.getContentType();
    if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
        DataInputStream in = new DataInputStream(request.getInputStream());
        int formDataLength = request.getContentLength();
        byte dataBytes[] = new byte[formDataLength];
        int byteRead = 0;
        int totalBytesRead = 0;
        while (totalBytesRead < formDataLength) {
            byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
            totalBytesRead += byteRead;
        }
        String file = new String(dataBytes);
        saveFile = file.substring(file.indexOf("filename=\"") + 10);
        saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
        saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
        int lastIndex = contentType.lastIndexOf("=");
        String boundary = contentType.substring(lastIndex + 1, contentType.length());
        int pos;
        pos = file.indexOf("filename=\"");
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        int boundaryLocation = file.indexOf(boundary, pos) - 4;
        int startPos = ((file.substring(0, pos)).getBytes()).length;
        int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
        saveFile = "C:/Users/Satellite M840/workspace/IF3110-Tubes-II/web/img/" + saveFile;
        File ff = new File(saveFile);
        FileOutputStream fileOut = new FileOutputStream(ff);
        fileOut.write(dataBytes, startPos, (endPos - startPos));
        fileOut.flush();
        fileOut.close();
    }
%>
<br>
<b>You have successfully upload the file by the name of:</b>
<% out.println(saveFile);%>

<!--Returned value-->
<%= "Barang " + request.getParameter("nama") + " sudah dimasukin ke database!"%>