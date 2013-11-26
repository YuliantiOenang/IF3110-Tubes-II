<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body>
<%
boolean logout = ((Boolean)request.getAttribute("logout") != null);

Cookie[] cookies = request.getCookies();
HttpSession sessions = request.getSession(true);
boolean isLogin = false;
String userid = null;
String username = null;
if (cookies != null) {
	for (int i = 0; i < cookies.length; i++) {
		Cookie cookie = cookies[i];
		if (cookie.getName().equals("user_id")) {
			if (!logout) {
				isLogin = true;
				userid = cookie.getValue();
			} else {
				cookie.setValue(null);
				cookie.setMaxAge(0);
			}
		}
		if (cookie.getName().equals("username")) {
			if (!logout) {
				username = cookie.getValue();
			} else {
				cookie.setValue(null);
				cookie.setMaxAge(0);
			}
		}
	}
}
if (isLogin && sessions.getAttribute("user_id") == null) {
	sessions.setAttribute("user_id", userid);
	sessions.setAttribute("username", username);
}
%>
<%
if (sessions.getAttribute("user_id") == null) {
%>

<body>
	<!-- notes: layout on progress -->
	
	<jsp:include page="layout.jsp" />
	<form name="login_form" action="login" method="post">
		Username: <input type="text" name="username" id="username" />
		Password: <input type="password" name="password" id="password" /> <input
			type="submit" value="login" />
	</form>
	<a href="register.jsp">Register</a>
<%
} else {
%>
	Halo
	<a href="user?id=<%=request.getSession(true).getAttribute("user_id")%>"><%=request.getSession(true).getAttribute("username")%></a>!
	<a href="logout">Logout</a>
<%
}
%>
<jsp:include page="footer.jsp" />
</body>
</html>