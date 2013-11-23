package npackage;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {


@Override
public void doGet(HttpServletRequest request,
				  HttpServletResponse response)
	throws IOException, ServletException
{
	doPost(request, response);
}
	   
@Override
public void doPost(HttpServletRequest request, HttpServletResponse response) 
	   throws ServletException, java.io.IOException {

try
{	    

     UserBean user = new UserBean();
     user.setUserName(request.getParameter("username"));
     user.setPassword(request.getParameter("password"));
	 user.setType("login");
	  user.setQuery("select username,password,nocredit from user where username='"
                        + request.getParameter("username")
                        + "' AND password='"
                        + request.getParameter("password")
                        + "'");

     user = UserDAO.login(user);
	   		    
     if (user.isValid())
     {
	        
           Cookie username = new Cookie("username",user.getUsername());
		  Cookie password = new Cookie("password", user.getPassword());
		  Cookie cardnumber = new Cookie("cardnumber", user.getNoCredit());

		  // Set expiry date after 30 days
		  username.setMaxAge(60*60*24*30); 
		  password.setMaxAge(60*60*24*30); 
		  cardnumber.setMaxAge(60*60*24*30); 

		  // Add both the cookies in the response header.
		  response.addCookie(username);
		  response.addCookie(password);
		  response.addCookie(cardnumber);
		  
		  response.setContentType("text/html");
		  
		  HttpSession session = request.getSession(true);	    
          session.setAttribute("username",user.getUsername()); 
		  session.setAttribute("password",user.getPassword()); 
		  session.setAttribute("cardnumber",user.getNoCredit());
		  response.getWriter().println(user.getUsername());
     }
	        
     else 
         response.getWriter().println(1);//error page 


} 
		
		
catch (Throwable theException) 	    
{
     System.out.println(theException); 
}
       }
	   
	   
	   
	   
	   
	}
