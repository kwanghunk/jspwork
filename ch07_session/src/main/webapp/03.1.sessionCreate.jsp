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
	// session name, value 할당(생성)
	session.setAttribute("idKey", "kim");
	session.setAttribute("pwKey", "1234");
%>
세션이 생성됨<p/>
세션 정보 <a href="03.2.testSession.jsp">확인</a>
</body>
</html>