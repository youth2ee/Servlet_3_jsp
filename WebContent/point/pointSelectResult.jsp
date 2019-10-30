<%@page import="com.naver.point.PointDTO"%>
<%@page import="com.naver.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.naver.point.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	PointDTO pointDTO = (PointDTO)request.getAttribute("dto"); //형변환이 필요하다. 
%>
   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>point select</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


</head>
<body>

<div class="container">
  <div class="jumbotron">
    <h1>Point Select</h1>      
	<ul> 
		<li>Num : <%= pointDTO.getNum() %></li>
		<li>Name : <%= pointDTO.getName() %></li>
		<li>Kor : <%= pointDTO.getKor() %></li>
		<li>Eng : <%= pointDTO.getEng() %></li>
		<li>Math : <%= pointDTO.getMath() %></li>
		<li>Total : <%= pointDTO.getTotal() %></li>
		<li>Avg : <%= pointDTO.getAvg() %></li>
	</ul>
  </div>
  
  <div>
  	<a href="./pointUpdate.jsp?num=<%=pointDTO.getNum()%>" class="btn btn-danger">update</a>
  	<a href="./pointDeleteResult.jsp?num=<%=pointDTO.getNum()%>" class="btn btn-primary">delete</a>
  </div>
  
</div>

</body>
</html>
    