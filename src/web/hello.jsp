<%@ page import="com.ruserba.model.Database" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<html>
<head>
	<title>Hello World!</title>
</head>
<body>
	<%
		String msg = request.getParameter("msg");
		if (msg == null) msg = "No message.";
	%>
	<p><%= msg %></p>
	<%
		Database db = (Database)pageContext.getServletContext().getAttribute("db");
		String sql = "select * from barang";
		ResultSet rs;
		try {
			rs = db.runSql(sql);
 
			out.println("<ul>");
			while(rs.next()){
				out.println("<li>" + rs.getString("nama_barang") + "</li>");
			}
			out.println("</ul>");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	%>
</body>
</html>
