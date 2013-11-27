<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp" />
<%
	if(request.getAttribute("fullname")==null){		
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context
				.getRequestDispatcher("/Profile");
		dispatcher.forward(request, response);
	}
	out.print("<h3>"+request.getAttribute("fullname")+"</h3>");
	out.print("<p>Nama :"+request.getAttribute("username")+"</p>");
	out.print("<p>No.HP :"+request.getAttribute("mobile")+"</p>");
	out.print("<p>Alamat :"+request.getAttribute("address")+"</p>");
	out.print("<p>Provinsi :"+request.getAttribute("province")+"</p>");
	out.print("<p>Kota :"+request.getAttribute("state")+"</p>");
	out.print("<p>Kode Pos :"+request.getAttribute("postalcode")+"</p>");
	out.print("<a href=\"editprofile.php\"> Edit Profile </a>");	
%>
<jsp:include page="footer.jsp" />