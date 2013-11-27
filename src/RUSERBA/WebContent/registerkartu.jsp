<%@include file="header.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript" src="js/kartu.js"></script>
<script type="text/javascript" src="js/GUICalendar.js"></script>     

 <% String from_register = (String)request.getAttribute("from_register"); %>

<script>
function success()
{
	alert("Register kartu berhasil!");	
}

function skip()
{
	window.location = "IndexController";
}

</script>

<html> 
<head><title>Registrasi Kartu</title></head> 
<body>



<form name="mainform" method="post" action="RegisterKartu">

	<input type="hidden" name="username" id="username">
	<script>
		document.getElementById("username").value = localStorage.wbdusername;
	</script>
</input>  

	<h1>Registrasi Kartu</h1><br>
	<pre><span>(*) Data harus diisi</span></pre> 
	<pre>Nomor Kartu Kredit	<input type="text" name="number" id="number"/><span id="err"></span></pre>
	<pre>Nama Tercantum		<input type="text" name="name" id="name"/></pre>	
	<pre>Tanggal berlaku	<input type=text name='date1' id="date1" size=10 maxlength=10 value='01-12-2013'/>      
        <input style='font-size:11px' type=button value="select" onclick='showCalendar(this, mainform.date1, "dd-mm-yyyy","en",1)'>
      </pre>
		
	<input type="submit" value="submit!" id="submit_btn" disabled="true" onclick=success()>
	
	<%
		if (from_register != null)
		{
		%>
			<button onclick=skip()>skip</button> 			
		<%
		}
	%> 
</form>
</body> 
</html> 

