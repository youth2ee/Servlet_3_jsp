<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String n = request.getParameter("n");

	/* Foward */
	//RequestDispatcher view = request.getRequestDispatcher("./testFoward.jsp");
	//view.forward(request, response);
	
	/* Redirect */
	response.sendRedirect("./testFoward.jsp?n=pooh");
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>

	<h1>Test</h1>
	<h1><%= n %> </h1>

</body>
</html>