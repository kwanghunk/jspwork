package member;

import java.sql.*;

public class MemberMgr {
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean checkId(String id) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
		
	}



	public boolean insertMember(Member bean) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirthday());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			pstmt.setString(9, bean.getDetailaddress());
			
			// hobby는 배열인데 db는 배열을 안받으므로 문자열로 받아서 넣어주기
			String[] hobby = bean.getHobby(); // ex) {"여행","영화"} => {'0','1','0','1','0'}
			char hb[] = {'0','0','0','0','0'};
			String lists[] = {"인터넷","여행","게임","영화","운동"};
			if(hobby != null) {
				for(int i=0; i<hobby.length; i++) {
					for(int j=0; j<lists.length; j++) {
						if(hobby[i].equals(lists[j])) {
							hb[j] = '1';
							break;
						}
					}
				}
			}
			
			pstmt.setString(10, new String(hb));
			pstmt.setString(11, bean.getJob());
			if(pstmt.executeUpdate() == 1) {//.executeUpdate()는 pstmt가 업데이트 되도록 하는것 / 반환값) 0=>insert X, 1=> insert O
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
			return flag;
	}
	
	public boolean loginMember(String id, String pwd) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from member where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}