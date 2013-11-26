<%@ include file="header.jsp" %>
		<link rel="stylesheet" href="layout.css">
		<script>
			if (localStorage.user!="admin") {
				window.location = "index.jsp"
			}
		</script>
	</head>
<%@ include file="middleadmin.jsp" %>
		<div id="container-left">
		<div id="container">
		<h2>Home</h2>
		<p>Selamat Datang di Mode Admin</p>
		</div>
		</div>
	</body>
</html>