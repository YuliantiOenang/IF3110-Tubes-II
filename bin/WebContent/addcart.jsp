<%@page import="bean.ItemTransaksi"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="header.jsp" />
<%
	ArrayList<ItemTransaksi> IT = new ArrayList<ItemTransaksi>();
	int qt = Integer.parseInt(request.getParameter("qt"));
	String id_barang = request.getParameter("id_barang");
	String request_tambahan = request.getParameter("request_tambahan");
	ItemTransaksi temp = new ItemTransaksi(qt, id_barang,
			request_tambahan);
	IT.add(temp);

	session.setAttribute("IT", IT);
	ArrayList<ItemTransaksi> req = (ArrayList<ItemTransaksi>) session.getAttribute("IT");
	System.out.println(req.get(0).getRequest_tambahan());
%>



<jsp:include page="footer.jsp" />