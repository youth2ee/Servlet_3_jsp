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
	num = pointDAO.delete(con, num);
	
	con.close();

	String msg = "삭제 실패";	
	//성공하면 삭제성공메시지, list로 돌아가기  // 실패하면 메시지x, list로 돌아가기
	
	if(num>0){
		//성공은 foward
		msg = "삭제 성공";
		
		request.setAttribute("msg", msg);
		request.setAttribute("path", "./pointList.jsp");
		//순서 주의 : 값을 넣어주고 보내는 주소를 써야한다.
		
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	} else {
		//실패는 redirect
		response.sendRedirect("./pointList.jsp");
	}
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>point delete result</title>
</head>
<body>

<h1>point delete result</h1>

</body>
</html>