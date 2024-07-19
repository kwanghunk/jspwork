package ch09;

import java.sql.*;
import java.util.*;

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
	
	
	// 설문폼(투표하기)에 넣을 질문 1개 가져오기
	public VoteList getOneVote(int num) {
		VoteList vList = new VoteList();
		
		try {
			con = pool.getConnection();	
			sql = "select * from votelist where num=" + num;
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				vList.setQuestion(rs.getString("question"));
				vList.setType(rs.getInt("Type"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return vList;
	}
	
	// 설문폼에 넣을 아이템들 가져오기
	public ArrayList<String> getItem(int num) {
		ArrayList<String> alist = new ArrayList<String>();
		
		try {
			con = pool.getConnection();	
			sql = "select item from voteitem where listnum=" + num;
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				alist.add(rs.getString(1));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
	
	// 설문리스트 번호에 넣을 num값 가져오기
		public VoteList getListNum(int num) {
			VoteList vList = new VoteList();
			
			try {
				con = pool.getConnection();	
				sql = "select * from votelist where num=" + num;
				rs = con.createStatement().executeQuery(sql);
				if(rs.next()) {
					vList.setNum(rs.getInt("num"));
					vList.setQuestion(rs.getString("question"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con);
			}
			return vList;
		}
	
	
		
		
		
		
		
		
		
		
		
		
}
