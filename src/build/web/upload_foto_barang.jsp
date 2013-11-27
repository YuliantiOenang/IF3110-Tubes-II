<%@page import="java.awt.Window"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<%@ page import="java.io.*" %> 
<%@page import="connect.connect"%>
<%@page import="java.sql.ResultSet"%>

<% 
	String contentType = request.getContentType(); 
	System.out.println("Content type is :: " + contentType); 
	String imageSave=null; 
	byte dataBytes[]=null; 
	String saveFile=null; 
	
	if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) 
	{ 
		DataInputStream in = new DataInputStream(request.getInputStream()); 
		int formDataLength = request.getContentLength(); 
		dataBytes = new byte[formDataLength]; 
		int byteRead = 0; 
		int totalBytesRead = 0; 
		
		while (totalBytesRead < formDataLength) 
		{ 
			byteRead = in.read(dataBytes, totalBytesRead, formDataLength); 
			totalBytesRead += byteRead; 
		} 
		
		String file = new String(dataBytes); 
		saveFile = file.substring(file.indexOf("filename=\"") + 10); 
		saveFile = saveFile.substring(0, saveFile.indexOf("\n")); 
		saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
		// out.print(dataBytes); 
		int lastIndex = contentType.lastIndexOf("="); 
		String boundary = contentType.substring(lastIndex + 1, contentType.length()); 
		// out.println(boundary); 
		int pos; 
		pos = file.indexOf("filename=\""); 
		pos = file.indexOf("\n", pos) + 1; 
		pos = file.indexOf("\n", pos) + 1; 
		pos = file.indexOf("\n", pos) + 1; 
		int boundaryLocation = file.indexOf(boundary, pos) - 4; 
		int startPos = ((file.substring(0, pos)).getBytes()).length; 
		int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
		
		try 
		{ 
			FileOutputStream fileOut = new FileOutputStream("D://programming//web//tubes2//web//images//"+saveFile); 
			// fileOut.write(dataBytes); 
			fileOut.write(dataBytes, startPos, (endPos - startPos)); 
			fileOut.flush(); 
			fileOut.close(); 
			imageSave="Success"; 
		}
		catch (Exception e) 
		{ 
			System.err.println ("Error writing to file"); 
			imageSave="Failure"; 
		} 
	} 
%> 

<html> 
	<HEAD> 
		<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
		<META name="GENERATOR" content="IBM WebSphere Studio"> 
		<TITLE>TAMBAH BARANG</TITLE> 
	</HEAD> 
	
	<body> 
		<center> 
			<div>
				<h1> TAMBAH BARANG </h1>
			</div>
		
			<div> 
				<p class = "welcomeadmin">Nama Foto : <%=saveFile%></p> 
			</div> 
			
            <div> 
				<p class = "welcomeadmin">Ukuran Foto : <%=dataBytes.length%> bytes</p> 
			</div>
			
			<div> 
				<p class = "welcomeadmin">Hasil : <%=imageSave%></p>  
			</div>  
			
			<div>
				<a href = "tambahbarang.jsp">Kembali ke Halaman Sebelumnya</a>
			</div>
		</center> 
	</body> 
</html>