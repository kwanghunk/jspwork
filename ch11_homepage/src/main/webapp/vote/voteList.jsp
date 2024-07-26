<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vDao" class="vote.VoteDao" />
<%@ page import="java.util.*,vote.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	* {margin: 0 auto;}
	div {width:800px;}
	h2, h5{text-align:center; }
	.m50 {margin-top:50px;}
	.m30 {margin-top:30px;}
	table {margin-top: 30px; width:800px;}
	a {text-decoration:none; color:black; cursor:pointer;}
</style>
</head>
<body>
	<div>
		<h2 class="m50">투표 프로그램</h2>
		<input type="button" value="홈으로" onclick="location.href='../index.jsp'" style="margin-left:700px;">
		<hr>
			
		<jsp:include page="voteForm.jsp" />
		<hr>
		
		
		<h5 class="m30">설문리스트</h5>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>시작일~종료일</th>
			</tr>
			<%
				ArrayList<VoteList> alist = vDao.getList();
				
				for(int i=0; i<alist.size(); i++) {
					VoteList vlist = alist.get(i);
					String sdate = vlist.getSdate().substring(0,10);
					String edate = vlist.getEdate().substring(0,10);
			%>
				<tr>
					<td><%=vlist.getNum() %></td>
					<td><a href="voteList.jsp?num=<%=vlist.getNum()%>"><%=vlist.getQuestion() %></a></td>
					<td class="cen"><%=sdate %> ~ <%=edate %></td>
				</tr>
			<%
				}
			%>
			<tr>
				<td colspan="3" align="right"><a href="voteInsert.jsp">설문 작성하기</a><td>
			</tr>
		</table>
	</div>
</body>
</html>