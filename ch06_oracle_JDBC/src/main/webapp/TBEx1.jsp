<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tjoeun","1234");
		st = con.createStatement();
		rs = st.executeQuery("select * from tb_product");
%>
		<table border="1">
			<tr>
				<th>PCODE</th>
				<th>PNAME</th>
				<th>BRAND</th>
				<th>STOCK_QUANT</th>
			</tr>
<% 
		while(rs.next()) {
			String pcode = rs.getString(1);
			String pname = rs.getString(2);
			String brand = rs.getString(3);
			String stock_quant = rs.getString(4);
%>
			<tr>
				<th><%=pcode %></th>
				<th><%=pname %></th>
				<th><%=brand %></th>
				<th><%=stock_quant %></th>
			</tr>		
<%	
		}
%>
	</table>	
<%
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) {
				try {st.close();}
					catch(Exception e) {e.printStackTrace();}
			}
		}
%>

</body>
</html>