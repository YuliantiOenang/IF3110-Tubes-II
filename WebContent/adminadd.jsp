<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Add new item</h1>
<hr />
<form action="admin" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="add"/>
<label>Name: </label><input type="text" id="name" name="name"/>
<label>Category: </label>
<select name="category">
<% 
int i;
String[] categories = {"Ladies Dress", "Ladies Shoes", "Men Shirt", "Men Shoes", "Men Hat"};
for (i = 0; i < 5; i++) { 
%>
	<option value="<%= i+1 %>"><%= categories[i] %></option>
<%
}
%>
</select>
<label>Price: </label><input type="number" id="price" name="price"/>
<label>Description: </label><textarea id="description" name="description"></textarea>
<label>Amount: </label><input type="number" id="amount" name="amount"/>
<label>Image: </label><input type="file" id="photo" name="photo"/>
<input type="submit">
</form>
</body>
</html>