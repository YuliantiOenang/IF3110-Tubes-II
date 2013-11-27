<%@include file="header.jsp" %>
<%@page import="java.io.*" import="java.sql.*" %>

<!-- GET PARAMETER -->
<% String category = (String)request.getParameter("category"); %>
<% String sort = (String)request.getParameter("sort"); %>
	
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script >
		function addtocart(pid){
			document.form1.productid.value=pid;
			document.form1.command.value='add';
			document.form1.submit();
		}				
		</script>
	</head>

	<body>
    	<!-- CONTENT -->
    		<form action="products.jsp" method="get">
				Urut berdasarkan : <a href="products.jsp?category=<% out.print(category); %>&sort=price"> Price </a>| <a href="products.jsp?category=<% out.print(category); %>&sort=sold"> Sold </a>| <a href="products.jsp?category=<% out.print(category); %>&sort=quantity"> Stock </a>
            </form>
        <div id="content">
        	
            <!-- MAIN CONTENT -->
            <div id="products">
				<!-- BLOG POST --> 
                <article class="blogPost">	
                    <h2> Products </h2>
                    <ol>
	                    <!-- SQL QUERY FOR ID, NAME, PICTURE, PRICE -->
						<%
						Connection conn2 = DriverManager.getConnection(DB_URL,USER,PASS);
					    Statement stmt2 = conn2.createStatement();
					    String sql2;
					    sql2 = "SELECT DISTINCT id, name, picture, price, quantity FROM product WHERE category='" + category + "' ORDER BY '" + sort + "' DESC";
					    //out.println(sql2);
					    ResultSet rs2 = stmt2.executeQuery(sql2);
			
				       	// Extract data from result set
				        while(rs2.next()){ 
				        %>
				        <li> 	        			
					    	<% //Retrieve by column name
					    	int id = rs2.getInt("id");
					        String name = rs2.getString("name");
					        String picture = "img/" + rs2.getString("picture");
					        int price = rs2.getInt("price");
					        int available = rs2.getInt("quantity");
					        %>
							<a href=detail_product.jsp?id=<% out.print(id); %>> <% out.print(name); %> </a>
					        <br>
					        <img src=<% out.print(picture); %>>
					        <br> Price: <price> Rp<% out.println(price); %>,00 </price>
					        <br> <h2> I want to buy it! </h2>
					        <form>
					        	Quantity: 
					        	<select name="quantity">
					        		<% for (int i=1;i<=available;i++) { %>
						        		<option> <% out.println(i); %></option>
						        	<% } %>
						        	</select>
					        	<br> Any Request?
					        	<br> <textarea name="comment"></textarea> 
								<br> <input type="button" value="Add to Cart" onclick="addtocart(.<% out.print(id); %>.)" />
							</form>
							<hr>
						</li> 
					    <%	
				        }
				       	%>
					</ol>
				</article> <!-- END OF BLOG POST -->
            </div> <!-- END OF MAIN CONTENT -->
        </div> <!-- END OF CONTENT -->
</body>
</html>

