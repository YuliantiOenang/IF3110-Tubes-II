<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.util.ArrayList"%>

<%@include file="header.jsp" %>

<% ArrayList<Integer> list_id = (ArrayList<Integer>)request.getAttribute("list_id"); %>
<% ArrayList<String> list_nama = (ArrayList<String>)request.getAttribute("list_nama"); %>
<% ArrayList<String> list_gambar = (ArrayList<String>)request.getAttribute("list_gambar"); %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Searching</title>
</head>
<body>
    	<!-- CONTENT -->
        <div id="content">
        
            <!-- MAIN CONTENT -->
            <div id="mainContent">
				<!-- BLOG POST --> 
                <article class="blogPost">
                  	<img width="200" align="right" src = "img/buy.gif"/>	
                    <h2> Hasil Pencarian</h2>
                    <ul>
                		<!-- SQL QUERY FOR CATEGORY -->
                    	
						<li>
							<% //Retrieve by column name
			        		String category = request.getParameter("kategori"); %>
			        		<h1> <a href=products.jsp?category=<% out.print(category); %>> <% out.print(category); %> </a> </h3>
				        	<h3> <ol>
					        	<!-- SQL QUERY FOR NAME, PICTURE -->
					        	<%
					        	
					        	if (list_nama.size() == 0)
					        	{
					        		%>
					        		<h1><pre><span><strong> 0 hasil pencarian </strong></span></pre></h1>
					        		<%
					        	}
					        	else
					        	for (int i = 0; i < list_nama.size(); ++i)
					        	{
					        	%>
			        				<li> 	        			
				        				<% //Retrieve by column name
				        				int id = list_id.get(i);
				        				String name = list_nama.get(i);
				        				String picture = "img/" + list_gambar.get(i);
				        				%> 
				        				<a href=detail_product.jsp?id=<% out.print(id); %>> <% out.print(name); %> </a>
				        				<br>
				        				<img src=<% out.print(picture); %>>
				        			</li> <%	
			        			}
			       				%>	
				        	</ol> </h3>
				        </li>
				       	 <!-- END OF SQL QUERY -->
			        </ul>  
            	</article> <!-- END OF BLOG POST -->
            </div> <!-- END OF MAIN CONTENT -->
        </div> <!-- END OF CONTENT -->
        
        <!-- FOOTER -->
        <footer>
        	<p> by Azalea Fisitania 13511028 Dikra Prasetya 13511030 Lukman Hakim </p>
        </footer> 
    </body>  
</html>