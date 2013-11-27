<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
</head>
<body>

<!-- CONTENT -->
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
					    sql2 = "SELECT * FROM product";
					    //out.println(sql2);
					    ResultSet rs2 = stmt2.executeQuery(sql2);
			
				       	// Extract data from result set
				        while(rs2.next()){ 
				        %>
				        <li> 	        			
					    	<% //Retrieve by column name
					    	int id = rs2.getInt("id");
					        String name = rs2.getString("name");
					        int price = rs2.getInt("price");
					        int available = rs2.getInt("quantity");
					        int sold = rs2.getInt("sold");
					        String picture = "img/" + rs2.getString("picture");
					        
					        %>
							<a href=detail_product.jsp?id=<% out.print(id); %>> <% out.print(name); %> </a>
					        <br> Sold: <%out.print(sold); %>
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