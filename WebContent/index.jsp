<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.util.ArrayList"%>

<%@include file="header.jsp" %>




<% ArrayList<String> list_kategori = (ArrayList<String>)request.getAttribute("list_kategori"); %>
<% ArrayList<ArrayList<String>> list_nama = (ArrayList<ArrayList<String>> )request.getAttribute("list_nama"); %>
<% ArrayList<ArrayList<String>> list_gambar = (ArrayList<ArrayList<String>> )request.getAttribute("list_gambar"); %>

<script>

var it = 0;
var last = new Date().getSeconds();
var check = 0;

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

function getContent(id)
{			
	var xmlhttp;
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			if (id == it)
			{
				document.getElementById("list_barang").innerHTML += xmlhttp.responseText;	
				document.getElementById("loading").innerHTML = "";
				check = 0;
				it++;
			}
			
		}
	};
	
	xmlhttp.open("GET","GeneratePaginasi?id="+id,true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send();
}

var last = 0;

function onPaginasi()
{
	if (new Date() - last < 1000) return;
	
	last = new Date();
	
	
	if (it >= <%= list_kategori.size()%>) return;
	
	if (check == 1) return;
	
	document.getElementById("loading").innerHTML = "<img src = \"img/ajax-loader.gif\"/>";
	
	setTimeout(function(){
		check = 1;
		getContent(it);
	}, 1000);
}

window.onscroll = function scroll()
{
	if (getDocHeight() == getScrollXY()[1] + window.innerHeight) {
		onPaginasi();                             	
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
                       
                     <ul id="list_barang">
                     </ul>
                     
                     <p id = "loading"></p> 
					    
            	</article> <!-- END OF BLOG POST -->
            </div> <!-- END OF MAIN CONTENT -->
        </div> <!-- END OF CONTENT -->
        
        <!-- FOOTER -->
        <footer>
        	<p> by Azalea Fisitania 13511028 Dikra Prasetya 13511030 Lukman Hakim </p>
        </footer> 
    </body>  
</html>  