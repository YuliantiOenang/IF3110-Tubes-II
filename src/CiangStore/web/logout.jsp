<%
	if(session != null){
			out.println("aaa");
			session.invalidate();
	}
	response.sendRedirect("index.jsp");
%>