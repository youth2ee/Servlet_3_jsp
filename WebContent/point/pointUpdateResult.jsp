<%@page import="com.naver.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.naver.point.PointDAO"%>
<%@page import="com.naver.point.PointDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	String name =  request.getParameter("name");
	int kor =  Integer.parseInt(request.getParameter("kor"));
	int eng =  Integer.parseInt(request.getParameter("eng"));
	int math =  Integer.parseInt(request.getParameter("math"));
	
	int total = kor + eng + math;
	double avg = total/3;

	PointDTO pointDTO = new PointDTO();
	pointDTO.setNum(num);
	pointDTO.setName(name);
	pointDTO.setKor(kor);
	pointDTO.setEng(eng);
	pointDTO.setMath(math);
	pointDTO.setTotal(total);
	pointDTO.setAvg(avg);
	
	PointDAO pointDAO = new PointDAO();
	Connection con = DBConnector.getConnection();
	int result = pointDAO.update(con, pointDTO);
	
	con.close();
	
	String msg = "수정 실패";
	
	if(result > 0){
		msg = "수정 성공";
	}
	
	request.setAttribute("msg", msg);
	request.setAttribute("path", "./pointList.jsp");
	
	RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
	view.forward(request, response);
%>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>point update result</title>
</head>
<body>
<h1>Point Update Result</h1>


</body>
</html>