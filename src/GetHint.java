

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/GetHint")
public class GetHint extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pw;
	
	
    public GetHint() {
        super();
    }
    
    public void cekEmail(String data,String pass) {
    	String responseteks;
    	String EMAIL_PATTERN = 
    	        "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
    	        + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    	Pattern pattern= Pattern.compile(EMAIL_PATTERN);
    	Matcher m=(pattern).matcher(data);
    	if (data.equals(pass)==false && m.matches()==true) {
    		responseteks="";
    	}else {
    		responseteks="Email tidak valid, Email tidak boleh sama dengan password";
    	}
    	pw.print(responseteks);
 
    }
    
    public void cekUser(String data,String pass) {
    	String responseteks;
    	String USER_PATTERN = 
    			"^[_A-Za-z0-9]{5,}$";
    	Pattern pattern= Pattern.compile(USER_PATTERN);
    	Matcher m=(pattern).matcher(data);
    	if (data.equals(pass)==false && m.matches()==true) {
    		responseteks="";
    	}else {
    		responseteks="Username minimal 5 karakter";
    	}
    	pw.print(responseteks);
    }
    
    public void cekPassword(String data, String user) {
    	String responseteks;
    	String PASS_PATTERN = 
    			"^[_A-Za-z0-9]{8,}$";
    	Pattern pattern= Pattern.compile(PASS_PATTERN);
    	Matcher m=(pattern).matcher(data);
    	if (data.equals(user)==false && m.matches()==true) {
    		responseteks="";
    	}else {
    		responseteks="Password minimal 8 karakter,tidak sama dengan username";
    	}
    	pw.print(responseteks);
    }
    
    public void cekConfirmPassword(String data, String pass) {
    	String responseteks;
    	if (data.equals(pass)==false ) {
    		responseteks="Harus sama dengan password";
    	}else {
    		responseteks="";
    	}
    	pw.print(responseteks);
    }
    
    public void cekNama(String data) {
    	String responseteks;
    	String NAME_PATTERN = 
    			"^[_A-Za-z0-9]* [_A-Za-z0-9]*$";
    	Pattern pattern= Pattern.compile(NAME_PATTERN);
    	Matcher m=(pattern).matcher(data);
    	if (m.matches()==true) {
    		responseteks="";
    	}else {
    		responseteks="Minimal mengandung 1 spasi";
    	}
    	pw.print(responseteks);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("tombolreg") == null ) {
			String data=request.getParameter("data");
			String jenis=request.getParameter("jenis");
			
			pw=response.getWriter();
			response.setContentType("text/plain");
			
			if(jenis.equals("email")) {
				String pass=request.getParameter("pass");
				cekEmail(data,pass);
			}else if(jenis.equals("user")) {
				String pass=request.getParameter("pass");
				cekUser(data,pass);
			}else if(jenis.equals("pass")) {
				String user=request.getParameter("user");
				cekPassword(data,user);
			}else if(jenis.equals("cpass")) {
				String pass=request.getParameter("password");
				cekConfirmPassword(data,pass);
			}else if (jenis.equals("nama")) {
				cekNama(data);
			}
		} 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
