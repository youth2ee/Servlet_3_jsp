<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String n = request.getParameter("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test foward</title>
</head>
<body>
	<h1>Test Foward</h1>
	<h1><%= n %> </h1>

</body>
</html>