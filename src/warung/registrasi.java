package warung;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class registrasi extends HttpServlet{
	
	//private String message;
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
		response.setContentType("text/html");
	 
      // Actual logic goes here.
      PrintWriter out = response.getWriter();
      out.println("<h1>" + "testing" + "</h1>");
	}
	
}
