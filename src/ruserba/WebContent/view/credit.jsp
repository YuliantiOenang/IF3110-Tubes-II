<%@page import="javaModel.Credit" %>
<%@page import="java.util.ArrayList" %>


<link rel='stylesheet' type='text/css' href='/ruserba/css/date.css' />
<% Credit C = (Credit) request.getAttribute("credit"); %>
<div class="basiccontent" id="addcreditcardcontent">
		<form id="creditCardForm" action="#" method="POST" onsubmit="credit(); return false;">
			Card Number* : <input type="text" name="card_number" value="<%= C.card_number.get(0) %>" id="card_number"><br>
			Name* : <input type="text" name="name" id="name" value="<%= C.name_of_card.get(0) %>"><br>
			Expired Date (YYYY-MM-DD)* : <input type="text" value="<%= C.expired_date.get(0) %>" name="expired_date" id="expired_date"><br>
			<input type="submit" value="submit" name="submit">
			<input type="button" value="skip" onClick="window.location='http://localhost/wbdf/user';"><br>
			* = Wajib diisi
		</form>
	</div>
<script src="/ruserba/js/date.js" type="text/javascript"></script>
<script src="/ruserba/js/credit.js"></script>
<script>
	var server = "";
</script>