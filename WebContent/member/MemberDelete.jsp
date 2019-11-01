<%@page import="com.naver.member.MemberDTO"%>
<%@page import="com.naver.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.naver.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	MemberDAO memberDAO = new MemberDAO();
	Connection con = DBConnector.getConnection();
	MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");

	int result =  memberDAO.memberDelete(con, memberDTO.getId());
	
	con.close();
	
	String msg = "삭제 실패";
	
	if(result > 0){
		msg = "삭제 성공";
		session.removeAttribute("member");
		response.sendRedirect("../index.jsp");
	} else {
		request.setAttribute("msg", msg);
		request.setAttribute("path", "../index.jsp");
		
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}

	
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