<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String blood = request.getParameter("blood");
%>

<%=name %>님의 혈액형은 <%=blood %>이고 성격은<br>
	1. 금사빠<br>
	2. 말빨좋음<br>
	3. 착한척<br>

</body>
</html>