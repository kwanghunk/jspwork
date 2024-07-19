package ch06;

import java.sql.*;
public class OracleDBTest2 {

	public static void main(String[] args) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tjoeun","1234");
			st = con.createStatement();
			rs = st.executeQuery("select * from department");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) {
				try {st.close();}
					catch(SQLException e) {e.printStackTrace();}
			}
		}
			
		
	
		
		
	}
}
