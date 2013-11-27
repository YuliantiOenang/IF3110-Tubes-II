
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.sun.xml.internal.bind.v2.model.core.ID"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="koneksi.koneksi"%>
<%
koneksi db=new koneksi();
 try
   {
         String userid=request.getParameter("user"); 
         String password=request.getParameter("pass"); 
         db.dbopen();
         ResultSet rs=db.stat.executeQuery("SELECT email FROM customer where username='"+userid+"'");
         rs.last();
         if(rs.getRow()==1)
         {
              try
              {
                    ResultSet rs2=db.stat.executeQuery("SELECT * FROM customer where username='"+userid+"' and password='"+password+"'");
                    rs2.last();
                    if(rs2.getRow()==1)
                    {
                         // Create cookies for first and last names.      
                       Cookie user1 = new Cookie("user1",
                                               rs2.getString(2));
                       Cookie idCustomer = new Cookie("IdCustomer",
                                               rs2.getString(1));
                       Cookie kobupaten = new Cookie("kobupaten",
                                               rs2.getString(3));
                       Cookie kodepos = new Cookie("kodepos",
                                               rs2.getString(4));
                       Cookie email = new Cookie("email",
                                               rs2.getString(5));
                       Cookie handphone = new Cookie("handphone",
                                               rs2.getString(6));
                       Cookie username = new Cookie("username",
                                               rs2.getString(8));
                       Cookie provinsi = new Cookie("provinsi",
                                               rs2.getString(9));
                       Cookie alamat = new Cookie("alamat",
                                               rs2.getString(10));
                       
                       
                       // Set expiry date after 24 Hrs for both the cookies.
                       user1.setMaxAge(60*60*24); 
                       idCustomer.setMaxAge(60*60*24); 
                       kobupaten.setMaxAge(60*60*24); 
                       kodepos.setMaxAge(60*60*24); 
                       email.setMaxAge(60*60*24); 
                       handphone.setMaxAge(60*60*24); 
                       username.setMaxAge(60*60*24); 
                       provinsi.setMaxAge(60*60*24); 
                       alamat.setMaxAge(60*60*24); 
                       
                       // Add both the cookies in the response header.
                       response.addCookie( user1 );
                       response.addCookie( idCustomer );
                       response.addCookie( kobupaten );
                       response.addCookie( kodepos );
                       response.addCookie( email );
                       response.addCookie( handphone );
                       response.addCookie( username );
                       response.addCookie( provinsi );
                       response.addCookie( user1 );
                       response.addCookie( alamat );
                       
                       out.println("{"
                        + "\"nama\":\""+rs2.getString(2) +""
                        + "\""
                        + "}");
                       
                    }
                    else
                    {
                       out.println("password invalid");    
                    }
              }
              catch(Exception e )
              {
                 out.println("error"+e);
              }
         }
         else
         {
            out.println("username invalid");    
         }
   }
   catch(Exception e )
   {
      out.println("error"+e);
   }   
       
%>
