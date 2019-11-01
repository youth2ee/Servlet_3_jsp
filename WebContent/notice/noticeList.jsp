<%@page import="com.naver.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.naver.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.naver.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	NoticeDAO noticeDAO = new NoticeDAO();
	Connection con = DBConnector.getConnection();

	ArrayList<NoticeDTO> ar = noticeDAO.noticeList(con);

	con.close();
	
	//쿠키발행
	//쿠키 생성시 생성자에 키와 밸류를 입력
	Cookie cookie = new Cookie("name","pooh");
	
	//쿠키가 적용되는 path : 보통 context path 적용 ( : 톰캣의 웹앱스 밑에 만들어지는 경로)
	cookie.setPath(request.getContextPath());
	
	//쿠키의 유효시간 : 쿠키가 클라이언트 pc에 저장되는 시간을 설정 
	//단위는 초단위
	//설정을 하지않으면 웹브라우저 종료시 쿠키도 같이 종료된다.
	cookie.setMaxAge(60*60);
	
	//쿠키를 클라이언트로 전송
	response.addCookie(cookie);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice list</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style type="text/css">
.div_t {
	width: 70%;
	height: 910px;
	margin: 0 auto;
	background-color: rgb(240, 240, 240);
}

.t {
	width: 100%;
	margin: 0 auto;
	text-align: center;
	font-size: 13px;
	border-bottom: 5px rgb(240, 240, 240) solid;
	border-spacing: 0px;
	border-collapse: collapse;
}

.notice {
	height: 70px;
	font-size: 30px;
	background-color: rgb(240, 240, 240);
}

.black {
	font-weight: bold;
	height: 50px;
	background-color: #252525;
	text-align: center;
	color: white;
}

.b1 {
	width: 10%;
}

.b2 {
	text-align: left;
	border-bottom: 5px rgb(240, 240, 240) solid;
}

.b3 {
	height: 50px;
	background-color: white;
	border-bottom: 5px rgb(240, 240, 240) solid;
}

.b4 {
	text-align: left;
	font-weight: bold;
}

.a {
	color: black;
	text-decoration: none;
}
</style>

</head>
<body>

<%@ include file="../layout/nav.jspf" %>

	<section
		style="background-color: rgb(240, 240, 240); height: auto; padding-bottom: 20px;">
		<div class="div_t">
			<table class="t">
				<thead>
					<tr class="notice">
						<td colspan="5">NOTICE</td>
					</tr>

					<tr class="black">
						<td class="b1">NO</td>
						<td>TITLE</td>
						<td class="b1">WRITER</td>
						<td class="b1">DATE</td>
						<td class="b1">HIT</td>
					</tr>
				</thead>

				<tbody>
					<%
						for (int i = 0; i < ar.size(); i++) {
							NoticeDTO noticeDTO = ar.get(i);
					%>
					<!-- for문 안쪽 -->
					<tr class="b3">
						<td><%=noticeDTO.getNum()%></td>
						<td class="b4"><a class="a"
							href="./noticeSelect.jsp?num=<%=noticeDTO.getNum()%>"> <%=noticeDTO.getTitle()%></a></td>
						<td><%=noticeDTO.getWriter()%></td>
						<td><%=noticeDTO.getReg_date()%></td>
						<td><%=noticeDTO.getHit()%></td>
					</tr>
					<%
						}
					%>

				</tbody>
			</table>
			<br> 
			
			<%if (memberDTO != null && memberDTO.getGrade()==0){ %>
				<a href="./noticeWrite.jsp" class="btn btn-primary">WRITER</a>
			<%} %>
			

		</div>
	</section>
</body>
</html>