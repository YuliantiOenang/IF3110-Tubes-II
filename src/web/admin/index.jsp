<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="koneksi.koneksi"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->

</head>
<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>

<body>
    <%@include file="header.jsp" %>


<div class = "bodymain">
	<%@include file="sidebar.jsp" %>	
	<div class = "boddy">
            <% if(found)
            
           {%>
                <a href="input.jsp"><p id="welcome2"><%if(found) out.print("input data");%></p></a>
              <%  
}%>
                
                
	</div>
	</div>
	<div class = "footer">
		<div class = "info">

		</div>
		
				
		
	</div>
</div>
</body>
</html> 


