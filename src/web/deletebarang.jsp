<%@page import="java.awt.Window"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<%@ page import="java.io.*" %> 
<%@page import="connect.connect"%>
<%@page import="java.sql.ResultSet"%>

<%
    String namabarang = request.getParameter("nama_barang");
    String hargabarang = request.getParameter("harga_barang");
    connect koneksion = new connect();
    koneksion.dbopen();
    
    try
    {
        koneksion.stat.executeUpdate("DELETE FROM `peralatan` WHERE `no_alat`="+request.getParameter("id"));
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
%>

<script>
    alert("Barang Berhasil Dihapus !")
</script>

<center>
	<div>
		<a href = "homeadmin.jsp">Kembali ke Halaman Home Admin</a>
	</div>
</center> 
 