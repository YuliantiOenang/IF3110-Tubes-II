<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>RuSerBa</title>
<link rel="stylesheet" href="css/halamanbarang.css" type="text/css" />
<link rel="stylesheet" href="css/imageslider.css" type="text/css" />
</head>
<body id="index" class="home">
	<div style="width:1100px; margin-left:auto; margin-right:auto">
	<%@ include file="header.jsp" %>
	<article id="featured" class="body">
		<h2>Most Wanted Products</h2>
		<div id="slideshow">
				<label class="arrows" id="arrow-1" onclick="autoPlaySlide.slidetoleft();">prev</label>
				<label class="arrows" id="arrow-2" onclick="autoPlaySlide.slidetoright();">next</label>
				<div id="slideshow-inner">
					<ul id="myslide">
		<%
		//mengambil dari database barang
		int slideid = 0;
		try{
			// Register JDBC driver
		    Class.forName("com.mysql.jdbc.Driver");
        	// Open a connection
	        Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
            // Execute SQL query
          	Statement stmt = conn.createStatement();
          	String sql = "select * from barang group by kategori";
          	ResultSet rs = stmt.executeQuery(sql);
          	// Extract data from result set
          	while(rs.next()){
          		int rank=1;
          		Statement stmt2 = conn.createStatement();
    			String sql2 = "select * from barang where kategori='"+rs.getString("kategori")+"' order by terjual desc limit 0,3";
    			ResultSet rs2 = stmt2.executeQuery(sql2);
    			while(rs2.next()){
    				slideid++;
    				out.println("<li id ='slide-"+slideid+"'>");
    				out.println("<img src='"+rs2.getString("gambar")+"'/>");
    				out.println("<div class='description'>");
    				out.println("<input type='checkbox' id='show-description-"+slideid+"'/>");
    				out.println("<label for='show-description-"+slideid+"' class='show-description-label'>");
    				out.println(""+rs.getString("kategori")+" #"+rank+"</label>");
    				out.println("<div class='description-text'><a href='detailbarang.php?id="+rs2.getString("id")+"'>"+rs2.getString("nama")+"</a>");
    				out.println("<p>"+rs2.getString("keterangan")+"</p>");
    				out.println("</div></div></li>"); 
    				rank++;
    			}
          	}
          	// Clean-up environment
          	rs.close();
          	stmt.close();
          	conn.close();
       	}catch(SQLException se){
          	//Handle errors for JDBC
          	out.println(se.toString());
       	}catch(Exception e){
        	//Handle errors for Class.forName
          	out.println(e.toString());
       	}//end try
	%>
		</ul></div></div>
	</article><!-- /#featured -->
	<%@ include file="footer.jsp" %>
	</div>
	<script>
	autoPlaySlide = {
		delay:3000,
		geser:0,
		counter:0,
		i:1,
		init: function(){
			document.getElementById("myslide").style.width="<%= slideid %>00%";
		},
		play: function(){
			document.getElementById("myslide").style.left=autoPlaySlide.geser+"%";
			if(autoPlaySlide.counter==0){
				if(autoPlaySlide.i==<%= slideid %>){ 
					autoPlaySlide.counter=1; 
					autoPlaySlide.geser+=100; 
				}else{ autoPlaySlide.geser-=100; }
			}else{
				if(autoPlaySlide.i==1){ 
					autoPlaySlide.counter=0; 
					autoPlaySlide.geser-=100; 
				}else{ autoPlaySlide.geser+=100; }
			}
			if(autoPlaySlide.counter==0){ autoPlaySlide.i++; }else{ autoPlaySlide.i--; }
			setTimeout("autoPlaySlide.play()",autoPlaySlide.delay);
		},
		slidetoleft: function(){
			autoPlaySlide.geser+=100;
			autoPlaySlide.i--;
			document.getElementById("myslide").style.left=autoPlaySlide.geser+"%";	
		},
		slidetoright: function(){
			autoPlaySlide.geser-=100;
			autoPlaySlide.i++;
			document.getElementById("myslide").style.left=autoPlaySlide.geser+"%";	
		}
	}
	autoPlaySlide.init();
	autoPlaySlide.play();
	</script>
</body>
</html>