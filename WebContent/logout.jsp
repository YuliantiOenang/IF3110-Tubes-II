<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<%@ page import = "javax.servlet.*"%>
<%@ page import = "javax.servlet.http.*"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "javax.sql.*"%>
<% HttpSession ses = request.getSession(true);  %>
<%

	ses.invalidate();
	%> <script type="text/javascript">
	window.location="index.jsp";
	alert("logout berhasil");
	</script> <%
	
	Cookie cookie = null;
	   Cookie[] cookies = null;
	   // Get an array of Cookies associated with this domain
	   cookies = request.getCookies();
	   if( cookies != null ){
	      for (int i = 0; i < cookies.length; i++){
	         cookie = cookies[i];
	         if((cookie.getName( )).compareTo("first_name") == 0 ){
	            cookie.setMaxAge(0);
	            response.addCookie(cookie);
	         }
	      }
	  }

%>