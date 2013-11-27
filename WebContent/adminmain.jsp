<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="header.jsp" />

</head>
<body>
<jsp:include page="layout.jsp" />
<h1>Admin</h1>
<hr />
<a href="admin?action=add">Tambah barang</a>
<a href="admin?action=edit">Edit barang</a>

<jsp:include page="footer.jsp" />
</body>
</html>