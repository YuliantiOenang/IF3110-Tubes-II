<%-- 
    Document   : index
    Created on : Nov 24, 2013, 10:41:07 AM
    Author     : HP
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        
        Connection con;
        Statement stat;
        
         try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/tubes1","root","");
            stat = con.createStatement();
        }catch(Exception ex){
            JOptionPane.showMessageDialog(null,ex,"error",JOptionPane.ERROR_MESSAGE);
        }
        
        %>
    </body>
</html>
