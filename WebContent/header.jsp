<%@page import="java.io.*" import="java.sql.*;" %>

<!-- PREPARING SQL DATABASE -->
<%
//JDBC driver name and database URL
final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
final String DB_URL="jdbc:mysql://localhost/ruserba";

//  Database credentials
final String USER = "root";
final String PASS = "";

// Set response content type
response.setContentType("text/html");
%>

<html>

    <!-- TITLE -->
    <head>
    	<link type="text/css" rel="stylesheet" href="style.css"/>
    	<title>Ruko Serba Ada</title>     
    	
    	<!-- SCRIPT -->
    <script>
    
    function daydiff(first, second) {
        return (second-first)/(1000*60*60*24)
    }
    
    if (typeof(Storage) !== "undefined") {
        var d = new Date();
        var curtime = d.getTime();
        
        if (daydiff(localStorage.wbddate, curtime) >= 30)
        {
        	localStorage.removeItem("wbdusername");
            localStorage.removeItem("wbddate");
        }
    }
        
        function login() {
            var person = prompt("Username : ");
            var password = prompt("Password : ");

            var xmlhttp;
            if (window.XMLHttpRequest) {
                xmlhttp = new XMLHttpRequest();
            }
            else {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function() {
                if (xmlhttp.readyState==4 && xmlhttp.status==200) {
                    var temp = xmlhttp.responseText;
                    
                    if (temp == "OK") {
                    	
                        // Kode kalau berhasil Login
                        if (typeof(Storage) !== "undefined") {
                        	alert("Login succeed");
                            localStorage.wbdusername = person;
                            
                            var d = new Date();
                            localStorage.wbddate = d.getTime();   
                        }
                        location.reload(true);
                    } else {
                        alert("Login failed");
                    }
                }
            }
            xmlhttp.open("GET","CheckLogin?username="+person+"&pass="+password,true);
            xmlhttp.send();
        }
        
        function logout() {
            if (typeof(Storage) !== "undefined") {
                localStorage.removeItem("wbdusername");
                localStorage.removeItem("wbddate");
            }
            location.reload(true);
        }
    </script> <!-- END OF SCRIPT -->
    </head>
    
    

	<!-- BODY -->
    <body>
	    <!-- HEADER -->
	    <div id="header" onload="javascript:welcomeuser()">
	        <a href="shoppingcart.jsp"> <img align="left" height="100" src="img/shoppingcart.png"/> </a>
	        <a href="IndexController"> <img align="center" height="100"  src="img/ruserba.png"/> </a>
	           
	        <div align="right" id="welcome">
				<script>
	 				if (typeof(Storage) !== "undefined") {
	 					
	                	if(!localStorage.wbdusername) {
	                    	document.getElementById("welcome").innerHTML = "<button onclick='login()'>Login</button> &nbsp; Belum punya akun? &nbsp; <a href='registrasi.jsp'>Daftar</a>";
						} else {
	                    	document.getElementById("welcome").innerHTML = "Welcome, <a href='Profile?username="+ localStorage.wbdusername + "'>"+localStorage.wbdusername+"</a>! <button onclick='logout()'>Logout</button>";
	                    }
	                }
	            </script>
	        </div>    
	    </div> <!-- END OF HEADER -->

    	<!-- NAVIGATION -->
        <nav>
            <ul>
                <li> <a href="#">All Categories</a>
                	<ul>
                		<!-- SQL QUERY FOR CATEGORY -->
                    	<% try {
			        		// Register JDBC driver
			        		Class.forName("com.mysql.jdbc.Driver");
			      			// Open a connection
			      			Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
		        			// Execute SQL query
		        			Statement stmt = conn.createStatement();
		        			String sql;
		        			sql = "SELECT DISTINCT category FROM product";
		        			ResultSet rs = stmt.executeQuery(sql);
		
		        			// Extract data from result set
		        			while(rs.next()){ 
		       			%>
						<li>	        			
			        		<%
			        		//Retrieve by column name
			        		String category = rs.getString("category");
			        			
			        		//Display category
			        		%> 
			        		<a href=products.php?category=<% out.print(category); %>> <% out.print(category); %> </a>
			        	</li>
			       		<%	}
		
			        		// Clean-up environment
			        		rs.close();
			        		stmt.close();
			        		conn.close();
			        	} catch(SQLException se) {
			        		//Handle errors for JDBC
			        		out.println("Not connected to SQL database");
			        		se.printStackTrace();
			        	} catch(Exception e) {
			        		//Handle errors for Class.forName
			        		out.println("Exception");
			        		e.printStackTrace();
			        	} %> <!-- END OF SQL QUERY -->
			        </ul>
                </li>
            </ul>
        </nav> <!-- END OF NAVIGATION -->
        
        <!-- SEARCH -->
		<div id="intro">
        	<h1> Search</h1>
			<form action="Searching" method="get">
				Nama barang: 
                <input type="text" name="nama_barang"/>
                Kategori barang: 
                <select name="kategori">
                  	<% try {
			       		// Register JDBC driver
			       		Class.forName("com.mysql.jdbc.Driver");
			    		// Open a connection
			    		Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
			
	        			// Execute SQL query
	        			Statement stmt = conn.createStatement();
	        			String sql;
	        			sql = "SELECT DISTINCT category FROM product";
	        			ResultSet rs = stmt.executeQuery(sql);
		
	        			// Extract data from result set
	        			while(rs.next()){ 
	       			
	       			 String category = rs.getString("category"); %>
					<option value= <%= category %>>	        			
		        		<%
		        		//Retrieve by column name
		        		
		        			
			        	//Display values
			        	out.print(category); %>
			        </option>
			       		<%	}
		
			        	// Clean-up environment
			        	rs.close();
			        	stmt.close();
			        	conn.close();
			        } catch(SQLException se) {
			        	//Handle errors for JDBC
			        	out.println("Not connected to SQL database");
			        	se.printStackTrace();
			        } catch(Exception e) {
			        	//Handle errors for Class.forName
			        	out.println("Exception");
			        	e.printStackTrace();
			        } %>
				</select>
                Harga:
                <select name="harga">
                	<option value=0>kurang dari Rp50.000,00</option>
                   	<option value=1>lebih dari sama dengan 50.000</option>
                </select>
                <input type="submit" />
			</form>
		</div> <!-- END OF SEARCH -->
    </body> <!-- END OF BODY -->
</html> 