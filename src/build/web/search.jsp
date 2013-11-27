<%-- 
    Document   : search
    Created on : 27 Nov 13, 15:11:32
    Author     : Toshiba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<form method="post" action="search.jsp">
Enter Id: <input type="text" name="id"><br>
<input type="submit" value="Submit">
</form>
</html>

<%@ page import="java.sql.*" %>
    <html>
    <form>
    <table>
    <%
    String value=request.getParameter("id");
    int v=Integer.parseInt(value);
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root", "root");
    Statement st=conn.createStatement();
    ResultSet rs = st.executeQuery("select * from produk where id="+v+"");
    if(rs.next()){ 
        %>
    <tr><td>Name: </td><td<input type="text" value="<%=rs.getString("name")%>" > </td></tr>
    <tr><td>Address: </td><td<input type="text" value="<%=rs.getString("address")%>" > </td></tr>
    <tr><td>Contact No: </td><td<input type="text" value="<%=rs.getInt("contactNo")%>" > </td></tr>
    <tr><td>Email: </td><td<input type="text" value="<%=rs.getString("email")%>" > </td></tr>
          <%
    }
    %>
    </table>
    </form>
</html>