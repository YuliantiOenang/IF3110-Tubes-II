<%-- 
    Document   : search_result
    Created on : Nov 27, 2013, 12:02:25 AM
    Author     : Aldo2
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Class.GetConnection"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Search Result</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script type="text/javascript" src="search_result.js"></script>
    </head>
    <body>
        <!--Header-->
        <div id="header">
            <%@ include file="header.jsp" %>
        </div><hr id="border"></div>
    <!--Body-->
    <div id="search-result-body">
        <%            
            String category = "", mode = "", text = "", pricemin = "", pricemax = "";
            if (request.getParameter("category") != null) {
                category = request.getParameter("category");
                mode = "3";
            } else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<FileItem> fields = upload.parseRequest(request);
                Iterator<FileItem> it = fields.iterator();
                if (!it.hasNext()) {
                    return;
                }
                while (it.hasNext()) {
                    FileItem fileItem = it.next();
                    boolean isFormField = fileItem.isFormField();
                    if (isFormField) {
                        
                        if (fileItem.getFieldName().toString().equals("modesearch")) {
                            mode = fileItem.getString();
                        } else if (fileItem.getFieldName().toString().equals("search_text")) {
                            text = fileItem.getString();
                        } else if (fileItem.getFieldName().toString().equals("search_pricemin")) {
                            pricemin = fileItem.getString();
                        } else if (fileItem.getFieldName().toString().equals("search_pricemax")) {
                            pricemax = fileItem.getString();
                        }

                    }
                }
            }

            
            String query = "";
            if (mode.equals("1")) {
                query = "SELECT * FROM goods WHERE goods_detail LIKE '%" + text + "%'";
            } else if (mode.equals("2")) {
                query = "SELECT * FROM goods";
            } else if (mode.equals("3")) {
                query = " SELECT goods.* FROM (goods NATURAL JOIN categorymeetup) NATURAL JOIN category WHERE cata_name LIKE '%" + category + "%'";
            }
            GetConnection getCon = new GetConnection();
            Connection conn = getCon.getConnection();
            Statement stt = conn.createStatement();
            ResultSet rs = stt.executeQuery(query);

            boolean flagmode2 = true;

            while (rs.next()) {
                if (mode.equals("2")) {
                    if (!(pricemax == null)) {
                        if ((Integer.parseInt(pricemin) < Integer.parseInt(rs.getString("goods_price"))) && (Integer.parseInt(pricemax) > Integer.parseInt(rs.getString("goods_price")))) {
                            flagmode2 = true;
                        } else {
                            flagmode2 = false;
                        }
                    } else {
                        if (Integer.parseInt(pricemin) < Integer.parseInt(rs.getString("goods_price"))) {
                            flagmode2 = true;
                        } else {
                            flagmode2 = false;
                        }
                    }
                }

                if (flagmode2) {
                    String path_image = "image/goods/" + rs.getString("goods_name") + ".jpg";
                    out.print("<div class=\"goods-category-body\">");
                    out.print("<div id=\"goods-result\">"
                                                        + "<div id=\"goods-image\">"
                                                                +"<a href=\"detailbarang.php?namabarang="+rs.getString("goods_name")+"&hasil=\">"
                                                                +"<img alt=\"image\" id=\"photo\" src=\"" + path_image + "\" width=\"100\" height=\"120\"/>"
                                                                +"</a>"
                                                        + "</div>"
                                                        + "<div id=\"goods-detail\">"
                                                                +"<div id=\"goods-name\">"
                                                                        +"<a href=\"detailbarang.jsp?namabarang="+rs.getString("goods_name")+"&hasil=\">"+rs.getString("goods_detail")+"</a>"
                                                                +"</div><br>"
                                                                +"Harga : "+rs.getString("goods_price")
                    );
                    
                    out.print("</div> </div > </div >");

                }
            }
        %>


    </div>
</body>
</html>