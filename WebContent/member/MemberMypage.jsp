<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<%@ include file="../layout/nav.jsp" %>


	<%if (memberDTO == null) {%>
		<% 
	 	request.setAttribute("msg", "로그인을 해주세요");
	 	request.setAttribute("path", "../index.jsp"); 
	 	RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
	 	view.forward(request, response);
		%>
	<%} else {%>
		<% session.getAttribute("member"); %>
		<section style="background-color: rgb(240, 240, 240); height: auto; padding-bottom: 20px; height: 910px;">
		<div class="container">
			<h2>My page</h2>
			<form action="#" method="post">

				<div class="form-group">
					<label for="id">Id:</label> 
					<input type="text" name="id" class="form-control" id="id" value="<%=memberDTO.getId()%>" readonly="readonly">
				</div>
	
				<div class="form-group">
					<label for="pw">Pw:</label> 
					<input type="password" name="pw" class="form-control" id="pw" value="<%=memberDTO.getPw()%>" readonly="readonly">
				</div>

				<div class="form-group">
					<label for="name">Name:</label> 
					<input type="text" name="name" class="form-control" id="name" value="<%=memberDTO.getName()%>" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="email">Email:</label> 
					<input type="email" name="email" class="form-control" id="email" value="<%=memberDTO.getEmail()%>" readonly="readonly">
				</div>				
				
				<div class="form-group">
					<label for="phone">Phone:</label> 
					<input type="tel" name="phone" class="form-control" id="phone" value="<%=memberDTO.getPhone()%>" readonly="readonly">
				</div>	
				
				<div class="form-group">
					<label for="grade">Grade:</label> 
					<input type="text" name="grade" class="form-control" id="grade" value="<%=memberDTO.getGrade()%>" readonly="readonly">
				</div>					
				
				
				<a href="./MemberUpdateForm.jsp" class="btn btn-danger">update</a>
				<a href="./MemberDelete.jsp" class="btn btn-danger">delete</a>

			</form>
		</div>
	</section>

	<%}%>
		
</body>
</html>