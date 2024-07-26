package ajaxReply;

import java.sql.*;
import java.util.*;

import ajax01.DBConnectionMgr;

public class ReplyDao {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public ArrayList<Reply> getReplyList(int ref) {
		ArrayList<Reply> alist = new ArrayList<Reply>();
		
		
		try {
			con = pool.getConnection();
			sql = "select * from reply where ref=? order by no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			/*
				Reply re = new Reply();
				re.setNo(rs.getInt("no"));
				re.setContent(rs.getString("content"));
				re.setRef(rs.getInt("ref"));
				re.setName(rs.getString("name"));
				re.setRedate(rs.getString("redate"));
			*/	
				alist.add(new Reply(rs.getInt(1),
									rs.getString(2),
									rs.getInt(3),
									rs.getString(4),
									rs.getString(5)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
}
