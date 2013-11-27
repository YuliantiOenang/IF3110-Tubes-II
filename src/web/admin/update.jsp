<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="koneksi.koneksi"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->
<link rel="stylesheet" type="text/css" href="css/uploader.css"> <!--pemanggilan file css-->
</head>
<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>
<script type="text/javascript">
            function startRead(evt) {  
                var file = document.getElementById('file').files[0];
                if(file){
                    if(file.type.match("image.*"))
                    {
                    getAsImage(file);
                    alert("Name: "+file.name +"\n"+"Last Modified Date :"+file.lastModifiedDate);
                    }
                    else
                    {
                    getAsText(file);
                    alert("Name: "+file.name +"\n"+"Last Modified Date :"+file.lastModifiedDate);
                    }
                }
                evt.stopPropagation();
                evt.preventDefault();
            }

            function startReadFromDrag(evt) {
                var file = evt.dataTransfer.files[0];
                if (file) {
                    if (file.type.match("image.*")) {
                        getAsImage(file);
                        alert("Name: " + file.name + "\n" + "Last Modified Date :" + file.lastModifiedDate);
                    }
                    else {
                        getAsText(file);
                        alert("Name: " + file.name + "\n" + "Last Modified Date :" + file.lastModifiedDate);
                    }
                }
                evt.stopPropagation();
                evt.preventDefault();
            }


            function getAsText(readFile) {

              var reader = new FileReader();

              // Read file into memory as UTF-16      
              reader.readAsText(readFile, "UTF-8");

              // Handle progress, success, and errors
              reader.onprogress = updateProgress;
              reader.onload = loaded;
              reader.onerror = errorHandler;
            }

            function getAsImage(readFile) {

              var reader = new FileReader();

              // Read file into memory as UTF-16      
              reader.readAsDataURL(readFile);

              // Handle progress, success, and errors
              reader.onload = addImg;
            }

            function updateProgress(evt) {
              if (evt.lengthComputable) {
                // evt.loaded and evt.total are ProgressEvent properties
                var loaded = (evt.loaded / evt.total);

                if (loaded < 1) {
                  // Increase the prog bar length
                  // style.width = (loaded * 200) + "px";
                }
              }
            }

            function loaded(evt) {  
              // Obtain the read file data    
              var fileString = evt.target.result;
              $("#op").text(fileString);
              alert("file Loaded successfully");
              // Handle UTF-16 file dump
              if(utils.regexp.isChinese(fileString)) {
                //Chinese Characters + Name validation
              }
              else {
                // run other charset test
              }
              // xhr.send(fileString)     
            }

            function errorHandler(evt) {
              if(evt.target.error.name == "NotReadableError") {
                // The file could not be read
              }
            }
            function domagic(evt){
            $("#draghere").css("background-color","green");
              evt.stopPropagation();
                evt.preventDefault();  
            }

            function addImg(imgsrc){
             var img = document.createElement('img');
              img.setAttribute("src",imgsrc.target.result);
              img.setAttribute("height","300");
              img.setAttribute("width","300");
              document.getElementById("op").insertBefore(img);
            }

              var dropingDiv = document.getElementById('draghere');
              dropingDiv.addEventListener('dragover', domagic, false);
              dropingDiv.addEventListener('drop', startReadFromDrag, false);
        </script>
		
<body>
    <%@include file="header.jsp" %>


<div class = "bodymain">
	<%@include file="sidebar.jsp" %>	
	<div class = "boddy">
	        <%@ page import="java.io.*" %> 
        <% 
			 if(request.getParameter("query")!=null)
			{
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
			String[] parseDot=saveFile.split("\\.");
			
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
			koneksi db=new koneksi();
			try
			{
				db.dbopen();
				ResultSet rs=db.stat.executeQuery("select * from peralatan where nama='"+session.getAttribute("nama")+"'");
				rs.last();
				if(rs.getRow()>=1)
				{
					        %>
									<script>
										window.alert("maaf nama sudah dipakai");
									</script>
							<%
				}
				else
				{
					FileOutputStream fileOut = new FileOutputStream("C://xampp//tomcat//webapps//Tugas_Besar2_Web//images//" +session.getAttribute("nama")+"."+parseDot[1]); 
					// fileOut.write(dataBytes); 
					fileOut.write(dataBytes, startPos, (endPos - startPos)); 
					fileOut.flush(); 
					fileOut.close(); 
					imageSave="Success";
					db.stat.executeUpdate(request.getParameter("query")+"`foto`="+"'images/"+session.getAttribute("nama")+"."+parseDot[1]+"',`status`='tersedia' WHERE no_alat='"+session.getAttribute("id")+"'");
					%>
					<script>
						window.alert("berhasil mengubah database");
                                                window.location="index.jsp";
					</script>
					<%
					File hapus=new File("C:/xampp/tomcat/webapps/Tugas_Besar2_Web/images/" +session.getAttribute("oldNama")+"."+parseDot[1]);
						if(hapus.exists())
						{
							hapus.delete();
						}
				}
			}
			catch(Exception e)
			{
				%>
					<script>
						window.alert("<%out.print(request.getParameter("query")+"`foto`="+"'images/"+session.getAttribute("nama")+"."+parseDot[1]+"',`status`='tersedia' WHERE no_alat='"+session.getAttribute("id")+"'");%>");
					</script>
				<%
			}
            
            
			
        
            }catch (Exception e) 
            { 
            System.err.println ("Error writing to file"); 
            imageSave="Failure"; 
            } 
            }
}			
        %>    
		
		
		<% if(request.getParameter("nama")==null)
		{
		session.setAttribute("oldNama", request.getParameter("nama1"));
		session.setAttribute("id", request.getParameter("id"));
		%>
        <form method="get" ACTION="update.jsp?id=<%out.print(request.getParameter("jumlah"));%>" > 
            <label>Nama :</label><input type="text" id='nama' name="nama" value="<%out.print(request.getParameter("nama1"));%>" required> <br>
			<label>Kategori :</label>
			<select name="kategori">
				<option value="Jaket">Jacket</option>
				<option value="TShirt">T-shirt</option>
				<option value="Sweater">Sweater</option>
				<option value="Misc">Misc.</option>
				<option value="Pokemon">Pokemon</option>
			</select><br>
			<label>Jumlah :</label><input type="text" name="jumlah" value="<%out.print(request.getParameter("jumlah"));%>" required> <br>
			<label>Harga :</label><input type="text" name="harga" value="<%out.print(request.getParameter("harga"));%>" required> <br>
			<label>deskripsi :</label> 	<textarea cols="35" name="deskripsi" required><%out.print(request.getParameter("deskripsi"));%></textarea>  <br>
            <input type="submit" id="submit" name="Submit" value="Submit"> 
            <input type="reset" name="Reset" value="Reset"> 
        </form> 
       <%
	   }
	   %>
		<% if(request.getParameter("nama")!=null)
		{
		session.setAttribute("nama", request.getParameter("nama"));
		
		out.print(session.getAttribute("id"));
		%>
		
        <form method="post" ACTION="update.jsp?query=<%out.print("UPDATE `peralatan` SET `nama`='"+request.getParameter("nama")+"',`kategori`='"+request.getParameter("kategori")+"',`jumlah`='"+request.getParameter("jumlah")+"',`harga`='"+request.getParameter("harga")+"',`deskripsi`='"+request.getParameter("deskripsi")+"',");%>" name="uploadForm" ENCTYPE='multipart/form-data'> 
            <div id="op"></div>
            <input type="file" id='file' name="uploadFile" onchange="startRead()"> 
			
            
<input type="submit" id="submit" name="Submit" value="Submit"> 
            <input type="reset" name="Reset" value="Reset"> 
			</form> 
         <%
	   }
	   %>
                </br>
                </br>
                </br>
                </br>
                </br>
                </br>
                               </br>
                </br>
                </br>
                </br>
                </br>
                </br>
		<div class = "mekanisme">
		<p class = "copyrightext"> Mekanisme Pembayaran </br></br>
		1. Pembeli melakukan login atau sign up
		2. Pembeli memesan produk-produk yang ingin dibeli </br>
		3. Pembeli melakukan checkout dengan memilih cart </br>
		4. Pembeli memilih mekanisme pembayaran, yaitu dengan kartu kredit yang dipilih </br>
		</div>
	</div>
	</div>
	<div class = "footer">
		<div class = "info">

		</div>
		
				
		
	</div>
</div>
</body>
</html> 


