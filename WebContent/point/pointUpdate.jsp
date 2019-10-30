<%@page import="com.naver.point.PointDTO"%>
<%@page import="com.naver.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.naver.point.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	
	PointDAO pointDAO = new PointDAO();
	Connection con = DBConnector.getConnection();
	PointDTO pointDTO = pointDAO.selectOne(con, num);
	
	con.close();
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>point update</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>   

</head>
<body>

	<div class="container">
		<h2>Point Update</h2>
		<form action="./pointUpdateResult.jsp" method="post">
		
			<input type="hidden" name="num"  value="<%=pointDTO.getNum()%>">
		
			<div class="form-group">
				<label for="name">Name:</label> 
				<input type="text" name="name" class="form-control" id="name" value="<%=pointDTO.getName()%>" placeholder="Enter name">
			</div>
			
			<div class="form-group">
				<label for="kor">Kor:</label> 
				<input type="text" name="kor" class="form-control" id="kor" value="<%=pointDTO.getKor()%>" placeholder="Enter kor">
			</div>
			
			<div class="form-group">
				<label for="eng">Eng:</label> 
				<input type="text" name="eng" class="form-control" id="eng" value="<%=pointDTO.getEng()%>" placeholder="Enter eng">
			</div>
			
			<div class="form-group">
				<label for="math">Math:</label> 
				<input type="text" name="math" class="form-control" id="math" value="<%=pointDTO.getMath()%>" placeholder="Enter math">
			</div>
			
			
			<button type="submit" class="btn btn-default">Submit</button>
			
		</form>
	</div>

</body>
</html>