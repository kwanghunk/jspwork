<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
<%/*
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	bDao.upCount(num);
	Board board = bDao.getOneBoard(num);
	session.setAttribute("bean", board);*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {background-color: lightyellow;}
	* {margin: 0 auto;}
	table {margin-top: 50px; width:800px;}
	table * {border:1px solid;}
	.title {background-color:lightgreen; text-align:center; width:800px;}
	.subtitle {width:80px;}
	.content {width:350px;}
	a {text-decoration:none; color:black;}
	a:hover {text-decoration:underline; color:coral; cursor:pointer;}
</style>
</head>
<body>
	<div>
		<table>
			<tr>
				<td class="title" colspan="3">글쓰기</td>
			</tr>
			<tr>
				<td class="subtitle">성&ensp;명</td>
				<td class="content"><input name="name"></td>
				<td></td>
			</tr>
			<tr>
				<td class="subtitle">제&ensp;목</td>
				<td class="content"><input name="subject"></td>
				<td></td>
			</tr>
			<tr>
				<td class="subtitle">내&ensp;용</td>
				<td class="content"><input name="content"></td>
				<td></td>
			</tr>
			<tr>
				<td class="subtitle">비밀번호</td>
				<td class="content"><input type="password" name="pass"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3"><hr><br>
					<input type="button" name="submit" value="등록" >
					<input type="reset" value="다시쓰기">
					<input type="button" value="리스트" onclick=location.href="list.jsp">
					
				</td>
		</tr>
		</table>
	</div>
</body>
</html>