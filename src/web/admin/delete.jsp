
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="koneksi.koneksi"%>
<%@page import="java.io.*"%>
<%		
			koneksi db=new koneksi();
			try
			{
				db.dbopen();
					String pecah=request.getParameter("foto");
					String[] parseDot=pecah.split("\\.");
					db.stat.executeUpdate("DELETE FROM `peralatan` WHERE no_alat='"+request.getParameter("id")+"'");
					%>
					<script>
						window.alert("berhasil menghapus gambar" );
						window.location="index.jsp";
					</script>
					<%
					File hapus=new File("C:/xampp/tomcat/webapps/Tugas_Besar2_Web/images/" +request.getParameter("nama")+"."+parseDot[1]);
						if(hapus.exists())
						{
							hapus.delete();
						}
					
			}
			catch(Exception e)
			{
				%>
					<script>
						window.alert(e);
					</script>
				<%
			}
%>