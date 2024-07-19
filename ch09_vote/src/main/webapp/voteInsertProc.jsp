<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="vDao" class="ch09.VoteDao" />

<jsp:useBean id="vList" class="ch09.VoteList" />
<jsp:setProperty name="vList" property="*" />

<jsp:useBean id="vItem" class="ch09.VoteItem" />
<jsp:setProperty name="vItem" property="*" />

<%
	String sdate = request.getParameter("sdateY") + "-"
				 + request.getParameter("sdateM") + "-"
				 + request.getParameter("sdateD");
	String edate = request.getParameter("edateY") + "-"
				 + request.getParameter("edateM") + "-"
				 + request.getParameter("edateD");
	vList.setSdate(sdate);
	vList.setEdate(edate);
	
	boolean result = vDao.voteInsert(vList, vItem);
	
	String msg = "설문 추가 실패";
	String location = "voteInsert.jsp";
	if(result) {
		msg = "추가완료";
		location = "voteList.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href = "<%=location %>";
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