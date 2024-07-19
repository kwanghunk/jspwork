package ch06;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleDBTest1 {

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.OracleDriver");	//어떤 Driver를 쓸지 정함
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tjoeun","1234");// jdbc를 어떤 프로그램으로 쓸지와 해당 db의 localhost, 포트 xid 입
			System.out.println("Success");
		} catch (SQLException e) {
			System.out.println("접속오류");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 오류");
		}
	
		
		
	}
}
