<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, ch06.*" %>
<jsp:useBean id="pool" class="ch06.UseBeanDBPool6" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>사번</th>
			<th>사원명</th>
			<th>이메일</th>
			<th>연락처</th>
			<th>직급코드</th>
		</tr>
<%
		ArrayList<ExBean> alist = pool.getList();
		for(int i=0; i<alist.size(); i++) {
			ExBean exbean = alist.get(i);
%>
		<tr>
			<td><%=exbean.getEmp_id() %></td>
			<td><%=exbean.getEmp_name() %></td>
			<td><%=exbean.getEmail() %></td>
			<td><%=exbean.getPhone() %></td>
			<td><%=exbean.getJob_code() %></td>
		</tr>
<%
		}
%>
	</table>
	
</body>
</html>