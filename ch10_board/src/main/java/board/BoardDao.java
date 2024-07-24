package board;

import java.sql.*;
import java.util.*;

public class BoardDao {
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public BoardDao() {
		pool = DBConnectionMgr.getInstance();
	}
	
	// 게시판 리스트
	public ArrayList<Board> getBoardList(String keyField, String keyWord, int start, int end) {
		ArrayList<Board> alist = new ArrayList<Board>();
		
		try {
			con = pool.getConnection();
			if(keyField == null || keyWord.equals("")) {	// 검색 유무에 따라 sql문이 바뀌기 때문에 if문을 사용하여 두가지 경우를 대비
				// 보기쉽게 줄바꿈을 하면 줄바꿈 한 곳 첫 부분은 반드시 띄어쓰기 해야함
				sql = "select * "
					 + " from (select ROWNUM AS RNUM, BT1.* "
					 + "         from (select * from board order by ref desc, pos) BT1 "
				     + " ) where RNUM between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * "
						 + " from (select ROWNUM AS RNUM, BT1.* "
						 + "         from (select * from board order by ref desc, pos) BT1 "
						 + "		where " + keyField + " like ? "
					     + "          ) "
					     + " where RNUM between ? and ? ";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + keyWord + "%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, end);
			}
				rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt("num"));
				board.setSubject(rs.getString("subject"));
				board.setName(rs.getString("name"));
				board.setRegdate(rs.getString("regdate"));
				board.setCount(rs.getInt("count"));
				
				board.setPos(rs.getInt("pos"));
				board.setRef(rs.getInt("ref"));
				board.setDepth(rs.getInt("depth"));
				
				alist.add(board);
			}
			
		} catch(Exception e) { 
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
	
	// 게시물의 총 레코드 수
	public int getTotalCount(String keyField, String keyWord) {
		int totalCount = 0;
		
		try{
			con = pool.getConnection();
			if(keyWord == null || keyWord.equals("")) {
				sql = "select count(num) from board";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(num) from board where " + keyField + " like ?" ;
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalCount = rs.getInt(1);	// 가져온 값 변수에 넣기 (컬럼번호 대신 컬럼명 써줄때는 'count(num)' 그대로 써줘야 함!! 그래서 쉽게 컬럼번호 입력함)
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return totalCount;
	}
	

	// 조회수 증가
	public void upCount(int num) {
		try{
			con = pool.getConnection();
			sql = "update board set count = count+1 where num=" + num;
			con.createStatement().executeUpdate(sql);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
	}
	
	// 게시물 1행 얻어오기
	public Board getOneBoard(int num) {
		Board board = new Board();
		
		try{
			con = pool.getConnection();
			sql = "select * from board where num=" + num;
			rs = con.createStatement().executeQuery(sql);
			
			if(rs.next()) {
				board.setNum(rs.getInt("num"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setPos(rs.getInt("pos"));
				board.setRef(rs.getInt("ref"));
				board.setDepth(rs.getInt("depth"));
				board.setRegdate(rs.getString("regdate"));
				board.setPass(rs.getString("pass"));
				board.setIp(rs.getString("ip"));
				board.setCount(rs.getInt("count"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return board;
	}

}










