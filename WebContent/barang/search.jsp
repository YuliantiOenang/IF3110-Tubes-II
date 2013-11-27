<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*, com.frexesc.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
@SuppressWarnings("unchecked")
ArrayList<BarangBean> barangs = (ArrayList<BarangBean>)request.getAttribute("barangs");
for (int i = 0; i < barangs.size(); i++) {
%>
	<%=barangs.get(i).getName() %><br />
<%
}
%>
</body>
</html>