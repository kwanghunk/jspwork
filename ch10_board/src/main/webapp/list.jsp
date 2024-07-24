<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
<%
	request.setCharacterEncoding("UTF-8");
	int totalRecord = 0;	// DB의 전체 레코드(행) 수
	int numPerPage = 5;	// 페이지당 출력할 행의 수
	int pagePerBlock = 5;	// 게시글 아래 다음 페이지 가는 블록의 블록당 페이지 수 => [1][2][3][4][5]
	
	int totalPage = 0;		// 전체 페이지 수 ex) 전체 레코드 수가 67개이고 페이지당 출력할 행이 10개이면 전체 페이지 수는 7 => [1][2][3][4][5][6][7]
	int totalBlock = 0;		// 총 블록 수 ex)전체 레코드 수가 11개이고 페이지당 출력할 행이 5개이면 totalBlock=3 => [1][2][3][4][5], [6][7][8][9][10], [11]
	
	int nowPage = 1;		// 현재 해당하는 페이지
	int nowBlock = 1;		// 현재 속해있는 블록
	
	int start = 0;			// board테이블의 select시 시작번호(한페이지에 필요한 만큼 게시물을 가져오려고 할때)
	int end = 0;			// 1page에 보여줄 레코드의 개수(보통은 10개, 맨 마지막 page는 레코드 수에 따라 달라짐)
	int listSize = 0;		// 현재 읽어온 게시물의 수
	
	String keyField = "", keyWord = "";
	if(request.getParameter("keyWord") != null) {
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	
	/* [처음으로]를 누르면 keyField와 keyWord의 값을 지우기 */
	if(request.getParameter("reload") != null) {
		if(request.getParameter("reload").equals("true")) {
			keyField = "";	// 처음 페이지로 가기위해 넣어진 keyField, keyWord값 지우기
			keyWord = "";
		}
	}
	
	if(request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	start = (nowPage * numPerPage) - numPerPage +1;		// 각 페이지당 시작번호
	end = nowPage * numPerPage;							// 해당 페이지에 마지막 레코드 번호
	totalRecord = bDao.getTotalCount(keyField, keyWord);					// BoardDao.java에서 db의 총 레코드 수 가져와서 함수로 만들어서 넣어줌
	totalPage = (int)Math.ceil(totalRecord / (double)numPerPage);	// 0이 나올 수 있어 두 변수 중 하나를 double로 형변환해서 나누고 ceil후 int로 강제형변환 
	nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock);		// 형변환 사유 상동
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);	// 전체 블럭 계산
	
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
	div {width:800px;}
	h2, .cen{text-align:center; }
	.m50 {margin-top:50px;}
	table {margin-top: 30px; width:800px;}
	table th, table td {text-align:center;}
	.a {text-decoration:none; color:black; cursor:pointer;}
	a:link {text-decoration:none; color:rgb(53,53,53);}
	a:hover {text-decoration:yes; color:skyblue;}
	a:visited {text-decoration:none; color:gray;}
</style>
<script>
	function block(value) {
		document.readFrm.nowPage.value=<%=pagePerBlock %>*(value-1)+1;
		document.readFrm.action="list.jsp";
		document.readFrm.submit();
	}
	function pageing(page) {
		document.readFrm.nowPage.value=page;
		document.readFrm.action="list.jsp";
		document.readFrm.submit();
	}
	function list() {
		/*document.listFrm.action = "list.jsp";*/
		document.listFrm.submit();
	}
	function read(num) {
		document.readFrm.num.value=num;
		document.readFrm.action="read.jsp";
		document.readFrm.submit();
	}
</script>
</head>
<body>

	<div>
	
		<h3 class="m50">JSPBoard</h3>
		
	    <table class="table">
	    	<tr>
	    		<td colspan="5" style="text-align:left;">Total : <%=totalRecord %> Articles(<font color="red"><%=nowPage %>/<%=totalPage %></font>)</td>
	    	</tr>
	        <tr>
	            <th width ="10%">번&ensp;호</th>
	            <th width ="40%">제&ensp;목</th>
	            <th width ="15%">이&ensp;름</th>
	            <th width ="25%">날&ensp;짜</th>
	            <th width ="10%">조회수</th>
	        </tr>
	        <%
				ArrayList<Board> alist = bDao.getBoardList(keyField, keyWord, start, end);
	        		listSize = alist.size();
				
				for(int i=0; i<listSize; i++) {
					Board board = alist.get(i);
					String wdate = board.getRegdate().substring(0,10);
					int depth = board.getDepth();
			%>
	        <tr>
	            <%-- <td><%=board.getNum() %></td> --%>
	            <td>
	            	<%=totalRecord - (nowPage - 1) * numPerPage %>
	            </td>
	            <td style="text-align:left;">
	            <% /* depth의 값만큼 들여쓰는 조건식 */
	            	if(depth > 0) {
	            		for(int j=0; j<depth; j++) {
	            			out.print("%emsp;");
	            		}
	            		out.print("↳");
	            	}
	            %>
	            	<!-- 상세읽기 -->
	            	<a href="javascript:read('<%=board.getNum() %>')" class="a"><%=board.getSubject() %></a>
            	</td>
	            <td><%=board.getName() %></td>
	            <td><%=wdate %></td>
	            <td><%=board.getCount() %></td>
	        </tr>
	        <%
				}
	        %>
	        
	        <tr> <!-- 페이징 처리 -->
				<td colspan="3">
				<%
					int pageStart = (nowBlock - 1) * pagePerBlock + 1;	// 현재 어디 블록에 속하는지에 따라 첫번째 페이지를 표시 => 1블록=1~, 2블록=6~, 3블록=11~
									//첫 1페이지를 표시하기 위해 위 처럼 식을 변경하였음
					int pageEnd	= pageStart + pagePerBlock <= totalPage ?	// 현재 어디 블록에 속하는지에 따라 마지막 페이지를 표시 => 1블록=~5, 2블록=~10, 3블록=~15
								 							 (pageStart + pagePerBlock) : totalPage + 1;	
					
					if(totalPage != 0) {
						if(nowBlock > 1) {
						%>
							<a href="javascript:block('<%=nowBlock - 1 %>')">prev...</a>&emsp;
						<%
						}
						for(; pageStart<pageEnd; pageStart++) {
							%>
							<a href="javascript:pageing('<%=pageStart %>')" class="a">[<%=pageStart %>]</a> <!-- [1][2][3][4][5] -->
						<%
						}
						if(totalBlock > nowBlock) {
						%>
							<a href="javascript:block('<%=nowBlock + 1 %>')">...next</a>&emsp;
						<%
						}
					}
				%>
				</td>
				<td colspan="2" style="text-align:right;">
					<a href="post.jsp" class="a">[글쓰기]</a>&emsp;
					<a href="javascript:list();" class="a">[처음으로]</a>
				</td>
			</tr>
		</table>
		
		<br><br>
		
		<form name="searchFrm" method="get" action="list.jsp">
			<table align="center" width="700">
				<tr>
					<td align="center">
						<select name="keyField">
							<option value="name">이름</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select>
						<input name="keyWord" required>
						<input type="submit" value="찾기">
					</td>
				</tr>
			</table>
		</form>
		
		<!-- 처음으로 누르면 화면 reload -->
		<form name="listFrm">
			<input type="hidden" name="reload" value="true">
			<input type="hidden" name="nowPage" value="1">
		</form>
		
		<!-- 사용자가 [2]를 누르면 2번째 페이지 보여주기 -->		
		<form name="readFrm">
			<input type="hidden" name="num">
			<input type="hidden" name="nowPage" value="<%=nowPage %>">
			<input type="hidden" name="keyField" value="<%=keyField %>">
			<input type="hidden" name="keyWord" value="<%=keyWord %>">
		</form>
		
	</div>

</body>
</html>