<%@include file="header.jsp"  %>
<%@page import="java.io.*" import="java.sql.*" %>
<%@page import="java.util.ArrayList"%>

<% 
ArrayList<Integer> list_id = (ArrayList<Integer>)request.getAttribute("list_id");
ArrayList<Integer> list_kuantitas = (ArrayList<Integer>)request.getAttribute("list_kuantitas");
ArrayList<String> list_nama = (ArrayList<String>)request.getAttribute("list_nama");
ArrayList<Integer> list_harga = (ArrayList<Integer>)request.getAttribute("list_harga");
%>

<html>
<head>
	<script language="javascript">
		function del(pid){
			if(confirm('Do you really mean to delete this item')){
				document.form1.pid.value=pid;
				document.form1.command.value='delete';
				document.form1.submit();
			}
		}
		
		function clear_cart(){
			if(confirm('This will empty your shopping cart, continue?')){
				document.form1.command.value='clear';
				document.form1.submit();
			}
		}
		
		function update_cart(){
			document.form1.command.value='update';
			document.form1.submit();
		}
	</script>
</head>

<body>
	<!-- CONTENT -->
    	<div id="content">
        	
            <!-- MAIN CONTENT -->
            <div id="products">
				<!-- BLOG POST --> 
                <article class="blogPost">	
                    <h2> Your Shopping Cart </h2>
					<!-- TABLE -->
					<img height="200"  src="img/dog.gif"/>
					<div class="Table">
				    <div class="Heading">
				        <div class="Cell">
				            <p>Product Name</p>
				        </div>
				        <div class="Cell">
				            <p>Quantity</p>
				        </div>
				        <div class="Cell">
				            <p>Total</p>
				        </div>
				    </div>
				    <%
				    for (int i = 0; i < list_nama.size(); ++i)
				    {
				    %>
				    <div class="Row">
				        <div class="Cell">
				            <p> <% out.println(list_nama.get(i)); %> </p>
				        </div>
				        <div class="Cell">
				            <p> <% out.println(list_kuantitas.get(i)); %> </p>
				        </div>
				        <div class="Cell">
				            <p> <% out.println(list_kuantitas.get(i) * list_harga.get(i)); %> </p>
				        </div>
				    </div>
				    <%
				    }
				    %>
				     <!-- END OF TABLE -->
				</div>
				<br> 
				<form action="registerkartu.jsp" method="get">
					<input type="submit" />
				</form>
				
			</article> <!-- END OF BLOG POST -->
    	</div> <!-- END OF MAIN CONTENT -->
	</div> <!-- END OF CONTENT -->
</body>
</html>

<%@include file="footer.jsp" %>