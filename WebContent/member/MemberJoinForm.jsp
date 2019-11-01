<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>member Join</title>
</head>
<body>

<%@ include file="../layout/nav.jspf" %>
	<section style="background-color: rgb(240, 240, 240); height: auto; padding-bottom: 20px; height: 910px;">
		<div class="container">
			<h2>Join</h2>

			<form action="./MemberJoinResult.jsp" method="post">

				<div class="form-group">
					<label for="id">Id:</label> 
					<input type="text" name="id" class="form-control" id="title" placeholder="entet id" required="required">
				</div>

				<div class="form-group">
					<label for="pw">Writer:</label>
					<input type="password" name="pw" class="form-control" id="pw" placeholder="entet pw" required="required">
				</div>

				<div class="form-group">
					<label for="name">Name:</label>
					<input type="text" name="name" class="form-control" id="name" placeholder="entet name" required="required">
				</div>
				
				<div class="form-group">
					<label for="email">Email:</label>
					<input type="email" name="email" class="form-control" id="email" placeholder="entet email" required="required">
				</div>
				
				<div class="form-group">
					<label for="phone">Phone:</label>
					<input type="tel" name="phone" class="form-control" id="phone" placeholder="entet phone" required="required">
				</div>
				
				<input type="submit" class="btn btn-default" value="회원가입">
				<input type="reset" class="btn" value="취소">

			</form>
		</div>
	</section>

</body>
</html>