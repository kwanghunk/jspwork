package ch06;

import java.sql.*;
import java.util.ArrayList;

public class UseBeanDBPool6 {
	private DBConnectionMgr pool = null;
	
	public UseBeanDBPool6() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public ArrayList<ExBean> getList() {
		ArrayList<ExBean> alist = new ArrayList<ExBean>();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select emp_id, emp_name, email, phone, job_code from employee");
			
			while(rs.next()) { 
				ExBean exbean = new ExBean();
				exbean.setEmp_id(rs.getString("emp_id"));
				exbean.setEmp_name(rs.getString("emp_name"));
				exbean.setEmail(rs.getString("email"));
				exbean.setPhone(rs.getString("phone"));
				exbean.setJob_code(rs.getString("job_code"));
				alist.add(exbean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
}
