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
    	
    	//쿠키
    	String check = request.getParameter("remember");
    	if(check != null){
    		Cookie cookie = new Cookie("id",memberDTO.getId());
    		cookie.setPath(request.getContextPath());
    		cookie.setMaxAge(60*60);
    		response.addCookie(cookie);
    	} else {
    		//쿠키지우기 1 : 있는 값에 key인 id의 value값만 null로 만들어준다. 쿠키자체는 삭제되지 않고 존재함.
/*     		Cookie cookie = new Cookie("id",null);
    		cookie.setPath(request.getContextPath());
    		cookie.setMaxAge(60*60);
    		response.addCookie(cookie); */
    	
    		//쿠키지우기 2 : 쿠키가 아예 삭제
    		Cookie cookie = new Cookie("id",null);
    		cookie.setPath(request.getContextPath());
    		cookie.setMaxAge(0);
    		response.addCookie(cookie);
    	}
    	
    	//DAO호출
     	MemberDAO memberDAO = new MemberDAO();
    	Connection con = DBConnector.getConnection();
    	memberDTO =  memberDAO.memberLogin(con, memberDTO);
    	
    	con.close();
    	
    	if(memberDTO != null){
    		session.setAttribute("member", memberDTO);
    		response.sendRedirect("../index.jsp");
    	}else {
    		request.setAttribute("msg", "로그인 실패");
    		request.setAttribute("path", "../index.jsp");
    		
    		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
    		view.forward(request, response);
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member login result</title>
</head>
<body>

</body>
</html>