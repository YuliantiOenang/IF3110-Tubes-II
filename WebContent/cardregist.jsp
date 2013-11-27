<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<!-- TODO : read SESSION -->

<jsp:include page="header.jsp" />


<html>
<script type="text/javascript">
		function checkCard(fld){
			var button = document.getElementById("regcard");
			var cardNum = fld.value;
			var isValid = false;
			var luhnArr = [0,2,4,6,8,1,3,5,7,9];
			var counter = 0;
			var incNum;
			var odd = false;
			var temp = String(cardNum).replace(/[^\d]/g, "");
			var credit_error = document.getElementById('credit_error');
			if( temp.length == 0){
				isValid = false;
			}
			else{
				for(var i = temp.length-1;i>=0; --i){
				incNum = parseInt(temp.charAt(i),10);
				counter += (odd = !odd)? incNum : luhnArr[incNum];
				}
				isValid = (counter%10==0);
			}
			if(!isValid){
				credit_error.innerHTML = 'The Credit Card Number is not valid';
			}
			else{
				credit_error.innerHTML = '';
				button.disabled = false;
			}
		}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% if (session.getAttribute("username") != null) { %>
	<p>Welcome <% out.println(request.getParameter("username")); %></p>
	<form name="login" action="Card" method="post">
		Card Number: <input type="text" name="cardnum" onkeyup="checkCard(this)"><br>
		Name on Card: <input type="text" name="namecard"><br>
		Expired Date: <input type="date" name="expdate"><br>
		<input type="hidden" name="owner" value="<% out.println(request.getParameter("username")); %>">
		<div id="credit_error"></div>
		<a href="index.jsp">Skip card registration</a> Or 
		<input type="submit" id="regcard" value="Register Card" disabled>
	</form>
<%
} else {
	out.println("<h3>Login dulu bos</h3>");
}
%>
</body>
</html>
<jsp:include page="footer.jsp" />