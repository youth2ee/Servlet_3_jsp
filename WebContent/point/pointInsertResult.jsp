<%@page import="java.sql.Connection"%>
<%@page import="com.naver.util.DBConnector"%>
<%@page import="com.naver.point.PointDAO"%>
<%@page import="com.naver.point.PointDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	/* 파라미터를 utf로 받아서 인코딩 한번 더 해준다. 맨 위에 항상 습관처럼 씁시당 */
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	
	int total = kor+eng+math;
	double avg = total/3;
	
	PointDTO pointDTO = new PointDTO();
	
	pointDTO.setName(name);
	pointDTO.setKor(kor);
	pointDTO.setEng(eng);
	pointDTO.setMath(math);
	pointDTO.setTotal(total);
	pointDTO.setAvg(avg);
	
	PointDAO pointDAO = new PointDAO();
	Connection con = DBConnector.getConnection();
	
	int result =  pointDAO.insert(con, pointDTO);
	
	con.close(); //close를 여기서한다.
%>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>point insert result</title>
</head>
<body>

<%= pointDTO.getName() %>
<%= result %>

</body>
</html>