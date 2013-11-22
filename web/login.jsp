<%--
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String userid=request.getParameter("usr");
session.setAttribute("sessionuserid",userid);
String password=request.getParameter("pwd");
session.setAttribute("sessionpassword", password);
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newcommerce","root","");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from users where user_id='"+userid+"'");
if(rs.next())
{
    if(rs.getString(2).equals(password))
    { 
        System.out.println("asd");
   
    // response.sendRedirect("register.jsp");
    }
else
{
out.println("Invalid password try again");
}
}
%>
--%>
  <% String namauser = request.getParameter("usr");
        session.setAttribute("pelanggan", namauser);    
    %>

<%= session.getAttribute( "pelanggan" ) %>