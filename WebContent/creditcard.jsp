<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/validate.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="layout.jsp" />
	<!-- new! -->
		
	<form method="post" id="form_credit" action="card" onsubmit="return validateCard(num.value, name.value)" name="card">
	<div class='register_div'>
		<h1 class='header'>Registrasi Kartu Kredit</h1>
		
		<div class='per_form'>
			<label>Card Number</label><input type="text" name="num" id="num" value="" onkeypress="if (this.value != '') validate('number', this.value, 'valnum')" required>
			<span class='error' id="valnum"></span>
		</div>
		
		<div class='per_form'>
			<label>Name of Card</label><input type="text" name="name" id="name" onkeypress="if (this.value != '') validate('name', this.value, 'valname')" value="" required>
			<span class='error' id="valname"></span>
		</div>
			
		<div class='per_form'>
			<label>Expired Date</label><input onfocus="loadCalendar()" type="text" name="date" id="date" value="" required>
			<span class='error' id="error-expired_date"></span>
		</div>
		<input type="hidden" name="return">
		<button type="submit" id="btn" class="btn">Register</button>

 		<?php if (!$sudahSet): ?>
			<a href="<?php echo $this->makeUrl('index/home') ?>" class="btn">Skip</a>
		<?php endif; ?>
		
	</div>
</form>

<script src="<?php echo $this->getBaseUrl() ?>/js/credit.js"></script>
<script>
	var server = "<?php echo $this->getBaseUrl() ?>";
</script>
	
	<!-- new! -->
	<jsp:include page="footer.jsp" />

</body>
</html>