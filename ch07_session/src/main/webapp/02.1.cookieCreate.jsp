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
	/*
	Cookie cookie = new Cookie("myCookie", "Apple");
	response.addCookie(cookie);
	*/
	
	// 위 내용을 한줄로 입력하기
	response.addCookie(new Cookie("NAME", "John"));
	response.addCookie(new Cookie("GENDER", "Male"));
	response.addCookie(new Cookie("AGE", "25"));
%>
	쿠키생성<p/>
	쿠키의 내용은 <a href="02.2.tasteCookie.jsp">클릭</a>해서 확인하기<p/>
</body>
</html>