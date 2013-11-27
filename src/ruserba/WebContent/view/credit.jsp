<%@page import="javaModel.Credit" %>
<%@page import="java.util.ArrayList" %>

<% Credit C = (Credit) request.getAttribute("credit"); %>
<form method="post" id="form_credit" onsubmit="credit(); return false;">
	<div class='register_div'>
		<h1 class='header'>Registrasi Kartu Kredit</h1>
		<div class='per_form'>
			<label>Card Number</label><input type="text" name="card_number" id="card_number" value="<%= C.card_number.get(0) %>" required>
			<span class='error' id="error-card_number"></span>
		</div>
		
		<div class='per_form'>
			<label>Name of Card</label><input type="text" name="name_of_card" id="name_of_card" value="<%= C.name_of_card.get(0) %>" required>
			<span class='error' id="error-name_of_card"></span>
		</div>
		
		<div class='per_form'>
			<label>Expired Date</label><input type="text" name="expired_date" id="expired_date" value="<%= C.expired_date.get(0) %>" placeholder="2013-12-12" required>
			<span class='error' id="error-expired_date"></span>
		</div>
		<button type="submit" id="btn" class="btn">Register</button>
		<a href="/ruserba/home" class="btn">Skip</a>
	</div>
</form>

<script src="/ruserba/js/credit.js"></script>
<script>
	var server = "";
</script>