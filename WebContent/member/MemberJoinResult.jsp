<%@page import="com.naver.member.MemberDTO"%>
<%@page import="com.naver.member.MemberDAO"%>
<%@page import="com.naver.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");

	MemberDTO memberDTO = new MemberDTO();
	memberDTO.setId(id);
	memberDTO.setPw(pw);
	memberDTO.setName(name);
	memberDTO.setPhone(phone);
	memberDTO.setEmail(email);

	Connection con = DBConnector.getConnection();
	MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.insert(con, memberDTO);

	String msg = "회원가입 실패";
	if (result > 0) {
		msg = "회원가입 성공";
		request.setAttribute("msg", msg);
		request.setAttribute("path", "../index.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	} else {
		response.sendRedirect("../index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member join result</title>
</head>
<body>
	<%=id%>
	<%=pw%>
	<%=name%>
	<%=email%>
</body>
</html>