<%@page import="com.naver.join.JoinDTO"%>
<%@page import="com.naver.join.JoinDAO"%>
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

	JoinDTO joinDTO = new JoinDTO();
	joinDTO.setId(id);
	joinDTO.setPw(pw);
	joinDTO.setName(name);
	joinDTO.setPhone(phone);
	joinDTO.setEmail(email);

	Connection con = DBConnector.getConnection();
	JoinDAO joinDAO = new JoinDAO();
	int result = joinDAO.insert(con, joinDTO);

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