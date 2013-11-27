<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.util.ArrayList"%>

<%@include file="header.jsp" %>


<% ArrayList<String> list_kategori = (ArrayList<String>)request.getAttribute("list_kategori"); %>
<% ArrayList<ArrayList<String>> list_nama = (ArrayList<ArrayList<String>> )request.getAttribute("list_nama"); %>
<% ArrayList<ArrayList<String>> list_gambar = (ArrayList<ArrayList<String>> )request.getAttribute("list_gambar"); %>


<script>

var it = 0;

function getScrollXY() {
    var scrOfX = 0, scrOfY = 0;
    if( typeof( window.pageYOffset ) == 'number' ) {
        //Netscape compliant
        scrOfY = window.pageYOffset;
        scrOfX = window.pageXOffset;
    } else if( document.body && ( document.body.scrollLeft || document.body.scrollTop ) ) {
        //DOM compliant
        scrOfY = document.body.scrollTop;
        scrOfX = document.body.scrollLeft;
    } else if( document.documentElement && ( document.documentElement.scrollLeft || document.documentElement.scrollTop ) ) {
        //IE6 standards compliant mode
        scrOfY = document.documentElement.scrollTop;
        scrOfX = document.documentElement.scrollLeft;
    }
    return [ scrOfX, scrOfY ];
}

//taken from http://james.padolsey.com/javascript/get-document-height-cross-browser/
function getDocHeight() {
    var D = document;
    return Math.max(
        D.body.scrollHeight, D.documentElement.scrollHeight,
        D.body.offsetHeight, D.documentElement.offsetHeight,
        D.body.clientHeight, D.documentElement.clientHeight
    );
}


window.onscroll = function scroll()
{
	if (getDocHeight() == getScrollXY()[1] + window.innerHeight) {
		
        	document.getElementById("paginasi").innerHTML = it;
        	
        	it++;
        
		
    }
};

</script>   

<html>
    <body>
    	<!-- CONTENT -->
        <div id="content">
        
            <!-- MAIN CONTENT -->
            <div id="mainContent">
				<!-- BLOG POST --> 
                <article class="blogPost">
                  	<img width="200" align="right" src = "img/buy.gif"/>	
                    <h2> Most Wanted Items! </h2>
                     
                     <div id="paginasi"> </div>
                       
                       
                    <div style="display: table;">
				        <div style="display: table-row;">
				            <div style="display: table-cell;">Name:</div>
					            <div style="display: table-cell;">test1</div>
					        </div>
					        <div style="display: table-row;">
					            <div style="display: table-cell;">Address:</div>
					            <div style="display: table-cell;">test2</div>
					        </div>
					    </div>
					    
					    
					    
					    
            	</article> <!-- END OF BLOG POST -->
            </div> <!-- END OF MAIN CONTENT -->
        </div> <!-- END OF CONTENT -->
        
        <!-- FOOTER -->
        <footer>
        	<p> by Azalea Fisitania 13511028 Dikra Prasetya 13511030 Lukman Hakim </p>
        </footer> 
    </body>  
</html>  