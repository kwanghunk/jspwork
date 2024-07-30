
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mem" class="member.Member" />	<!-- bean 사용문구 -->
<jsp:useBean id="mMgr" class="member.MemberMgr" /> <!-- DB연동 Mgr 문구 -->
<jsp:setProperty name="mem" property="*" />		<!-- 회원가입에 입력한 값 bean을 이용해 각 값 db에 보내는 문구 -->
<%
	boolean  result = mMgr.insertMember(mem);
	String msg = "회원가입에 실패하였습니다";
	String location = "member.jsp";
	if(result) {
		msg = "가입을 축하합니다";
		location = "login.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=location %>";
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