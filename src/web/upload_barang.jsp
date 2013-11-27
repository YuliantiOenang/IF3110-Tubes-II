<%@page import="java.awt.Window"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<%@ page import="java.io.*" %> 
<%@page import="connect.connect"%>
<%@page import="java.sql.ResultSet"%>

<%
    String namabarang = request.getParameter("nama_barang");
    String kategoribarang = request.getParameter("kategori_barang");
    String jumlahbarang = request.getParameter("jumlah_barang");
    String hargabarang = request.getParameter("harga_barang");
    String deskripsibarang = request.getParameter("deskripsi_barang");
	
    connect koneksion = new connect();
    koneksion.dbopen();
    
	try
	{		
		ResultSet rs = koneksion.stat.executeQuery("SELECT `nama` FROM `peralatan` WHERE `nama` =\'" + namabarang+"\'");
		rs.last();
			
		if(rs.getRow() >= 1)
		{
			%>
				<script>
					alert("Nama Barang telah Dipakai, Silahkan Gunakan Nama Barang Lain.")
				</script>
			<%
		}
		else
		{
			koneksion.stat.executeUpdate("INSERT INTO `peralatan`(`nama`, `kategori`, `jumlah`, `harga`, `deskripsi`, `foto`, `status`) VALUES ('" +namabarang+ "','" +kategoribarang+ "','" +jumlahbarang+ "','" +hargabarang+ "','" +deskripsibarang+ "','images/" +namabarang+ ".jpg','tersedia')");
			
			%>	
				<script>
					alert("Barang Berhasil Ditambahkan !")
				</script>
			<%
		}
	}
	catch (Exception e)
	{
		System.out.println(e);
	}
	
%>

<center>
	<div>
		<a href = "tambahbarang.jsp">Kembali ke Halaman Sebelumnya untuk Upload Foto / Ganti Nama Barang</a>
	</div>
</center> 
 