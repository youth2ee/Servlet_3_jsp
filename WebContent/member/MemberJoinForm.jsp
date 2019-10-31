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

<%@ include file="../layout/nav.jsp" %>

	<div class="container">
		<div class="row">
			<form action="./MemberJoinResult.jsp" method="post">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th colspan="2">회원가입</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" placeholder="entet id"
								required="required"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pw" placeholder="entet pw"
								required="required"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" placeholder="entet name"
								required="required"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name="email"
								placeholder="entet email" required="required"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="tel" name="phone" placeholder="entet phone"
								required="required"></td>
						</tr>

					</tbody>
				</table>
				<input type="submit" class="btn btn-primary" value="회원가입">
				&nbsp;<input type="reset" class="btn" value="취소">
			</form>
		</div>
	</div>
</body>
</html>