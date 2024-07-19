<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regMgr" class="ch07.RegisterMgr" />
    
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	if(regMgr.loginRegister(id, pw)) {
		response.addCookie(new Cookie("idKey", id));
%>
		<script>
			alert("로그인 완료");
			location.href = "04.3.cookieLoginOK.jsp";
		</script>
<%
	} else {
%>
		<script>
			alert("접속실패");
			location.href = "04.1.cookieLogin.jsp";
		</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>