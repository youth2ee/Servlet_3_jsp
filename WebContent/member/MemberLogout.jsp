<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	//1번 직접 값에 null넣어주기
	//session.setAttribute("member", null);
	
	//2번 속성 지우기
	//session.removeAttribute("member");
	
	//3번 강제로 시간을 0으로 맞추기 
	session.invalidate();
	
	response.sendRedirect("../index.jsp");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>