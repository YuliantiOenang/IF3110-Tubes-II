<%@include file="header.jsp" %>
<%@page import="java.io.*" import="java.sql.*" %>

<!-- GET PARAMETER -->
<% Integer id = Integer.parseInt(request.getParameter("id")); %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript">
			function addtocart(pid){
				document.form1.productid.value=pid;
				document.form1.command.value='add';
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
                    <h2> Product Detail </h2>
                    <ol>
	                    <!-- SQL QUERY FOR ID, NAME, PICTURE, DESCRIPTION, PRICE -->
						<%
						Connection conn2 = DriverManager.getConnection(DB_URL,USER,PASS);
					    Statement stmt2 = conn2.createStatement();
					    String sql2;
					    sql2 = "SELECT DISTINCT id, name, picture, description, price, quantity FROM product WHERE id='" + id + "'";
					    ResultSet rs2 = stmt2.executeQuery(sql2);
			
				       	// Extract data from result set
				        while(rs2.next()){ 
				        %>
				        <li> 	        			
					    	<% //Retrieve by column name
					    	String name = rs2.getString("name");
					        String picture = "img/" + rs2.getString("picture");
					        String description = rs2.getString("description");
					        int price = rs2.getInt("price");
					        int available = rs2.getInt("quantity");
					        %>
							<a href=detail_product.jsp?id=<% out.print(id); %>> <% out.print(name); %> </a>
					        <br>
					        <img src=<% out.print(picture); %>>
					        <h3> Product Description: </h3> <% out.println(description); %>
					        <br> Price: <price> Rp<% out.println(price); %>,00 </price>
					        <br> Quantity available: <% out.println(available); %> item
					        <br> <h2> </>I want to buy it! </h2>
					        <form form action="ShoppingCart" method="get">
					        	Quantity: 
					        	<select name="quantity">
					        		<% for (int i=1;i<=available;i++) { %>
						        		<option> <% out.println(i); %></option>
						        	<% } %>
						        </select>
					        	<br> Any Request?
					        	<br> <textarea name="comment"></textarea> 
					        	<br> <input type="submit" />
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

