package ch06;

import java.sql.*;
import java.util.ArrayList;


public class UseBeanDB4 {
	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String User = "tjoeun";
	private final String PASS = "1234";
	
	
	public UseBeanDB4() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Bean> getList() {
		ArrayList<Bean> alist = new ArrayList<Bean>();
		try {
		Connection con = DriverManager.getConnection(JDBC_URL,User,PASS);
		Statement st = con.createStatement();
		String query = "select * from emp_01";
		ResultSet rs = st.executeQuery(query);
		
		while(rs.next()) {
			Bean bean = new Bean();
			bean.setEmp_id(rs.getString("emp_id"));
			bean.setEmp_name(rs.getString("emp_name"));
			bean.setDept_name(rs.getString("dept_name"));
			alist.add(bean);
		}
		
		} catch(SQLException e) {
			e.printStackTrace();
		} 
		return alist;
	}
}
