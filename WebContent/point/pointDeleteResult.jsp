<%@page import="com.naver.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.naver.point.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	PointDAO pointDAO = new PointDAO();
	Connection con = DBConnector.getConnection();
	int num = Integer.parseInt(request.getParameter("num"));

	int result = pointDAO.delete(con, num);

	String msg = "";

	if (result > 0) {
		msg = "삭제 성공";
	} else {
		msg = "삭제 실패";
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

<script type="text/javascript">
	alert('<%= msg %>');
	location.href="./pointList.jsp";
</script>


</body>
</html>