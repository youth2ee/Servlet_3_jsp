<%@page import="com.naver.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.naver.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
</head>
<body>

	<%@ include file="../layout/nav.jspf" %>

	<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String id = memberDTO.getId();

		MemberDAO memberDAO = new MemberDAO();
		Connection con = DBConnector.getConnection();

		memberDTO = (MemberDTO)session.getAttribute("member");

		con.close();
	%>


	<section style="background-color: rgb(240, 240, 240); height: auto; padding-bottom: 20px; height: 910px;">
		<div class="container">
			<h2>Member Update</h2>
			<form action="./MemberUpdateResult.jsp" method="post">

				<div class="form-group">
					<label for="id">Id:</label> 
					<input type="text" name="id" class="form-control" id="id" value="<%=memberDTO.getId()%>" readonly="readonly">
				</div>
	
				<div class="form-group">
					<label for="pw">Pw:</label> 
					<input type="password" name="pw" class="form-control" id="pw" value="<%=memberDTO.getPw()%>">
				</div>

				<div class="form-group">
					<label for="name">Name:</label> 
					<input type="text" name="name" class="form-control" id="name" value="<%=memberDTO.getName()%>">
				</div>
				
				<div class="form-group">
					<label for="email">Email:</label> 
					<input type="email" name="email" class="form-control" id="email" value="<%=memberDTO.getEmail()%>">
				</div>				
				
				<div class="form-group">
					<label for="phone">Phone:</label> 
					<input type="tel" name="phone" class="form-control" id="phone" value="<%=memberDTO.getPhone()%>">
				</div>	
				
				<div class="form-group">
					<label for="grade">Grade:</label> 
					<input type="text" name="grade" class="form-control" id="grade" value="<%=memberDTO.getGrade()%>" readonly="readonly">
				</div>					
				
				<button type="submit" class="btn btn-default">Submit</button>

			</form>
		</div>
	</section>

</body>
</html>