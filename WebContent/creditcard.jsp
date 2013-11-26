<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="js/validate.js"></script>
</head>
<body>
	<h1>Credit card</h1>
	<hr />
	<form method="post" action="card" onsubmit="return validateCard(num.value, name.value)" name="card">
		<input type="number" placeholder="nomor kartu" id="num" name="num" onkeyup="if (this.value != '') validate('number', this.value, 'valnum')" required /><div id="valnum"></div><br />
		<input type="text" placeholder="nama kartu" id="name" name="name" onkeyup="if (this.value != '') validate('name', this.value, 'valname')" required /><div id="valname"></div><br />
		<input type="date" id="date" name="date" required /><br />
		<input type="hidden" name="return">
		<input type="submit" />
	</form>
</body>
</html>