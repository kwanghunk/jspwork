<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="ch08.MemberMgr" />
<%
	String id = request.getParameter("id");
	boolean result = mMgr.checkId(id);
	
	if(result) {
		out.print("사용중인 아이디입니다.");
	} else {
		out.print("사용가능한 아이디입니다.");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="" onclick="self.close()">닫기</a>
</body>
</html>