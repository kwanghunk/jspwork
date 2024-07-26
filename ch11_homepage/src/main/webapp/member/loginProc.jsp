<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr" />
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	boolean result = mMgr.loginMember(id, pwd);
	
	String msg = "접속실패";
	if(result) {
		session.setAttribute("idKey", id);
		msg = "방문을 환영합니다";
	}
%>
<script>
	alert("<%=msg %>");
	location.href = "../index.jsp";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>