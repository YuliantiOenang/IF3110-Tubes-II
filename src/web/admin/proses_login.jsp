
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.sun.xml.internal.bind.v2.model.core.ID"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="koneksi.koneksi"%>
<%
						String userid=request.getParameter("user"); 
						String password=request.getParameter("pass"); 
                         // Create cookies for first and last names.      
                       if(userid.equals("admin") && password.equals("admin"))
					   {
					   Cookie user1 = new Cookie("user1",
                                               "admin");
                       
                       // Set expiry date after 24 Hrs for both the cookies.
                       user1.setMaxAge(60*60*24); 
                      
                       
                       // Add both the cookies in the response header.
                       response.addCookie( user1 );
                      
                       
                       out.println("{"
                        + "\"nama\":\"admin"
                        + "\""
                        + "}");
                       
					}
       
%>
