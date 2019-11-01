<%@page import="com.naver.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.naver.member.MemberDAO"%>
<%@page import="com.naver.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	MemberDTO memberDTO = new MemberDTO();

	memberDTO.setId(request.getParameter("id"));
	memberDTO.setPw(request.getParameter("pw"));
	memberDTO.setName(request.getParameter("name"));
	memberDTO.setEmail(request.getParameter("email"));
	memberDTO.setPhone(request.getParameter("phone"));
	memberDTO.setGrade(Integer.parseInt(request.getParameter("grade")));

	MemberDAO memberDAO = new MemberDAO();
	Connection con = DBConnector.getConnection();

	int result = memberDAO.memberUpdate(con, memberDTO);

	con.close();

	String msg = "수정 실패";

	if (result > 0) {
		msg = "수정 성공";
		session.setAttribute("member", memberDTO);
		response.sendRedirect("./MemberMypage.jsp");
	} else {
		request.setAttribute("msg", msg);
		request.setAttribute("path", "./MemberMypage.jsp");

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