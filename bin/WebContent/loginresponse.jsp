<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
</head>
<body>
	<p>
		ANDA
		<%
		if (((String) request.getAttribute("status")).equals("berhasil")) {
			out.println("Berhasil login, silahkan tunggu 3 detik.");
			out.print("Jika tidak ada respon, close aja browsernya, cacad tuh!!!");
		} else {
			out.print(" Gagal Login");
		}
		//allow access only if session exists

		String user = null;
		if (session.getAttribute("username") == null) {
			System.out.println("Nggak ada session");
		} else {
			user = (String) session.getAttribute("username");
			System.out.println("YESS ADA SESSION");			
		}
		response.sendRedirect("/ruko/");
	%>	
	</p>
</body>
</html>