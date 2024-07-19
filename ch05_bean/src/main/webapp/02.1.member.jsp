<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="script.js" charset="utf-8" type="text/javascript"></script>
</head>
<body>
	<table border="1" align="center">
		<form method="post" name="regForm" action="02.2.memberProc.jsp">
			<tr>
				<th colspan="3">회원가입</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input name="id"></td>
				<td>5글자 이상 영문과 숫자로만 기재</td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pwd"></td>
				<td>영문, 숫자, 특수기호가 각 1개 이상씩, 3글자 이상</td>
			</tr>
			<tr>
				<td>패스워드 확인</td>
				<td><input type="password" name="repwd"></td>
				<td>패스워드 확인</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="name"></td>
				<td>이름입력</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input  name="birthday"></td>
				<td>ex)yyyy/mm/dd</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input  name="email"></td>
				<td>이메일 입력</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button" value="회원가입" onclick="inputCheck();">&emsp;
					<input type="reset">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>