package ch09;

import java.sql.*;

public class VoteDao {
		private DBConnectionMgr pool;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		public VoteDao() {
			pool = DBConnectionMgr.getInstance();
		}
		
		// 설문 등록하기
		public boolean voteInsert(VoteList vList, VoteItem vItem) {
			boolean flag = false;
			
			try {
				con = pool.getConnection();
				sql = "insert into votelist values(seq_vote.nextval,?,?,?,sysdate,?,default)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vList.getQuestion());
				pstmt.setString(2, vList.getSdate());
				pstmt.setString(3, vList.getEdate());
				pstmt.setInt(4, vList.getType());
				
				int result = pstmt.executeUpdate();
				int result2 = 0;
				
				if(result == 1) {
					sql = "insert into voteItem values(seq_vote.currval,?,?,default)";
					pstmt = con.prepareStatement(sql);
					
					String item[] = vItem.getItem();
					for(int i=0; i<item.length; i++) {
						if(item[i] == null || item[i].equals("")) {
							break;
						}
							pstmt.setInt(1, i);
							pstmt.setString(2, item[i]);
							result2 = pstmt.executeUpdate();
					}
					if(result2 == 1)
						flag = true;
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				pool.freeConnection(con);
			}
			
			return flag;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
