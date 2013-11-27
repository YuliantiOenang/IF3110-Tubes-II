<%@include file="header.jsp"  %>
<%@page import="java.io.*" import="java.sql.*" %>

<% 
//DUMMY
String name = "Longevity Cheese";
int price = 5000;
int quantity = 10;

String name2 = "Nutrient Yogurt";
int price2 = 5000;
int quantity2 = 5;
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
				    <div class="Row">
				        <div class="Cell">
				            <p> <% out.println(name); %> </p>
				        </div>
				        <div class="Cell">
				            <p> <% out.println(quantity); %> </p>
				        </div>
				        <div class="Cell">
				            <p> <% out.println(price*quantity); %> </p>
				        </div>
				    </div>
				    <div class="Row">
				        <div class="Cell">
				            <p> <% out.println(name2); %> </p>
				        </div>
				        <div class="Cell">
				            <p> <% out.println(quantity2); %> </p>
				        </div>
				        <div class="Cell">
				            <p> <% out.println(price2*quantity2); %> </p>
				        </div>
				    </div> <!-- END OF TABLE -->
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