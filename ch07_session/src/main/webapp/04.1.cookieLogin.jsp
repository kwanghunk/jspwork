<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Cookie 로그인</h1>
<%
	String id = null;
	/* String id = ""; */
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(int i=0; i<cookies.length; i ++) {
			if(cookies[i].getName().equals("idKey")) {
				id = cookies[i].getValue();
			}
		}
	}
	if(!(id == null)) {
	/* if(!id.equals("")) { */
%>
		<script>
			location.href="04.3.cookieLoginOK.jsp";
		</script>
<%		
	}
%>
	<form action="04.2.cookieLoginProc.jsp" method="post">
		ID : <input name="id"><p/>
		PW : <input type="password" name="pw"><p/>
		<input type="submit" value="login">
		<input type="reset">
	</form>
</body>
</html>