<%@page import="java.util.*"%>
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
	Enumeration name = session.getAttributeNames();
	while(name.hasMoreElements()) {
		String sName = (String) name.nextElement();	//반환형이 Object라 String으로 강제 형변환
		String value = (String) session.getAttribute(sName);
		out.print("session name : " + sName + "<p/>");
		out.print("session value : " + value + "<hr>");
	}
%>
</body>
</html>