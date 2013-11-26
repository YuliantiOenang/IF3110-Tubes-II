<%@ include file="header.jsp" %>
		<script>
			if (localStorage.user!="admin") {
				window.location = "index.jsp"
			}
			alert("<%=request.getParameter("nama")%>");
		</script>
	<link rel="stylesheet" href="layout.css">
	</head>
	<%@ include file="middleadmin.jsp" %>
		<div id="container-left">
		<div id="container">
		<h2>Upload Gambar Barang</h2>
		
		
			Gambar Barang: <br><form action="uploadservlet.jsp?nama=<%=request.getParameter("nama")%>" method="post"
                        enctype="multipart/form-data">
						
						<input type="file" name="file" size="50" /><br />
						<input type="submit" value="Upload File" /><br>
		</form>
		</div>
		</div>
	</body>
</html>