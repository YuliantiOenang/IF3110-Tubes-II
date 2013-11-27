<%
	session.removeAttribute("Username");
	session.removeAttribute("Privilege");
	response.sendRedirect("../index.jsp");
%>