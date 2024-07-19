<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regMgr" class="ch07.RegisterMgr" />
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(regMgr.loginRegister(id, pw)) {
		session.setAttribute("idKey", id);
%>
	<script>
		alert("접속완료");
		location.href = "05.3.sessionLoginOk.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert("접속실패");
		location.href = "05.1.sessionLogin.jsp";
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