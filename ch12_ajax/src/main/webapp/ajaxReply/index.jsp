<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style type="text/css">
	body {text-align:center;}
	img {width: 500px;}
	table * {margin: 0 auto;}
</style>
</head>
<body>
	<img src="../resources/img1.JPG"><br>
	<table>
		<thead>
			<tr>
				<th>댓글작성</th>
				<td>
					<textarea row="3" cols="50"></textarea>
				</td>
				<td>
					<button id="btn1">댓글등록</button>
				</td>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	
	<script type="text/javascript">
		$(() => {
			selectReplyList();
		})
		
		function selectReplyList() {
			$.ajax({
				url : "rlist.bo",
				data : {bnum : 1},
				success : function(result) {
					console.log(result);
					let value = "";
						for(let i=0; i<result.length; i++) {
							value += 
								"<tr>"
								+"	<td>" + result[i].name + "</td>"
								+"	<td>" + result[i].content + "</td>"
								+"	<td>" + result[i].redate.substring(0,10) + "</td>"
								+"</tr>";
						}
						$("table tbody").html(value);
				},
				error : function() {
					console.log("ajax 통신 실패");
				}
			})
		}
	</script>
</body>
</html>