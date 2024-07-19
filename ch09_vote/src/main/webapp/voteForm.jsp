<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch09.*, java.util.*" %>
<jsp:useBean id="vDao" class="ch09.VoteDao" />
<%
	VoteList vList = vDao.getOneVote(1);
	ArrayList<String> vItem = vDao.getItem(1);
	
	int type = vList.getType();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
	* {margin: 0 auto;}
	.voteFrom {width:400px;}
	h2, h5{text-align:center; }
	.m50 {margin-top:50px;}
	table {margin-top: 30px;}
	#voteListDiv {width:600px;}
</style>

</head>
<body>
	
	<div class="voteFrom">
		<h5 class="m50">설문폼</h5>
		<form action="voteInsertProc.jsp" method="post">
			<table class="table">
				<tr>
					<td>Q : <%=vList.getQuestion() %></td>
				</tr>
				<tr>
					<td style="padding-left:30px;">
					<%
						for(int i=0; i<vItem.size(); i++) {
							String itemList = vItem.get(i);
							if(type == 1) {
								out.print("<input type='checkbox' name='itemnum' value='" + i + "'>&ensp;");
							}else {
								out.print("<input type='radio' name='itemnum' value='" + i + "'>&ensp;");
							}
							out.print(itemList + "<p/>");
						}
					%>
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="submit" value="투 표">&emsp;&emsp;
						<input type="submit" value="결 과">
					</td>					
				</tr>
			</table>			
		</form>
	</div>
	
	<!-- 월요일 삭제 예정 -->
	<div id="voteListDiv">
		<h5>설문리스트</h5>
			<table class="table">
				<tr align="center">
					<th>번호</th>
					<th>제목</th>
					<th>시작일-종료일</th>
				</tr>
				<%
					for(int i=0; i<=vList.getNum(); i++) {
						out.print("<td>" + (i+1) + "</td>");
						/* out.print("<td>" + vList.getQuestion(i) + "</td>"); */
						out.print("<td>" + vList.getSdate() + "-" + vList.getEdate() + "</td>");
						out.print("</tr>");
						if(i<4)
							out.print("<tr>");
					}
				%>
			</table>		
	</div>
</body>
</html>