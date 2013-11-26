<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML>
<html>
<head><title>Detail Barang</title></head>

<%@ include file="header.jsp" %>
<%@ include file="sidebar.jsp" %>
<script src="javascript/transaksi.js"></script>
<script>
if(localStorage.wbduser){
	<% 
	Connection conn = null;
    Statement stmt = null;
    int i=0;
    try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/wbd1"
				,"root","");
		stmt = conn.createStatement();
		
		String sql;
		sql = "select count(*) from barang";
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next()) {
			i = rs.getInt("count(*)") - 1;
		}
		
		
	} catch (ClassNotFoundException e) {	
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
var currentpage=1;
var shopping_bag = [];
var sum_item = <% out.print(i); %>;
var maxpage= (sum_item/10+1);
var isi,buyitem;
initialize_bag();
}
</script>
<article id="featured" class="body">
	<%
		String id = null;
		if (request.getParameter("id") != null) {
			id = request.getParameter("id");
		}
		
	    try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/wbd1"
					,"root","");
			stmt = conn.createStatement();
			
			String sql;
			sql = "select * from barang where id="+id;
			ResultSet rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				out.print("<img src='"+rs.getString("gambar")+"' width='318' height='238'/>");
				out.print("<h2>"+rs.getString("nama")+"</h2>");
				out.print("<p>Keterangan : "+rs.getString("keterangan")+"</p>");
				out.print("<form>");
				out.print("<pre>Masukkan jumlah barang yang akan dibeli		<input type='number' name='quantity' min='1' id='qty'></pre>");
				out.print("<pre style='vertical-align:top'>Masukkan tambahan permintaan 			<textarea name='tambahan' rows='4'></textarea></pre>");
				out.print("<input type='button' value='Beli!' onclick='tempBuy("+rs.getInt("id")+",qty.value)'></form>");
			}
			
			
		} catch (ClassNotFoundException e) {	
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
</article>

<%@ include file="footer.jsp" %>

</div>
</body>
</html>