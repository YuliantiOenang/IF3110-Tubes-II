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
	
    Cookie cookiess[] = request.getCookies();
    Cookie idBarang = null;
    for(int i = 0;i<cookiess.length;i++){
        if(cookiess[i].getName().equals("idBarang")){
            idBarang = cookiess[i];
            break;
        }
    }
    
    
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
			koneksion.stat.executeUpdate("UPDATE `peralatan` SET `nama`='" +namabarang+ "',`kategori`='" +kategoribarang+ "',`jumlah`= '" +jumlahbarang+ "',`harga`='" +hargabarang+ "',`deskripsi`='" +deskripsibarang+ "',`foto`= 'images/" +namabarang+ ".jpg',`status`='tersedia' WHERE `no_alat`=" + idBarang.getValue());
			
			%>	
				<script>
					alert("Barang Berhasil Diupdate !")
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
		<a href = "editbarang.jsp">Kembali ke Halaman Sebelumnya untuk Mengganti Foto / Nama Barang</a>
	</div>
</center> 
 