package PoolPack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberMgr {
	
	private DBConnectionMgr pool;

	public MemberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	// 회원가입
	public boolean insertMember(MemberBean bean) {
		Connection con = null;				// 데이터베이스와의 연결
		PreparedStatement pstmt = null;		// 사전에 컴파일 된 SQL문을 실행
		String sql = null;					// SQL문
//		StringBuffer sql1 = new StringBuffer();
		
		boolean flag = false;				// 회원가입 성공여부 반환용
		
		try {
			con = pool.getConnection();
			sql = "insert members(id, pw, name, email, phone) values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPw());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getEmail());
			pstmt.setString(5, bean.getPhone());
			
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt);
		}
		
		
		return flag;
	}
	
	//로그인
	public int login(String id, String pw) {
		
		Connection con = null;				// 데이터베이스와의 연결
		PreparedStatement pstmt = null;		// 사전에 컴파일 된 SQL문을 실행
		String sql = null;
		ResultSet rs = null;
		
		// 1 : 아이디가 존재하지 않음
		// 2 : 비밀번호가 일치하지 않음
		// 3 : 로그인 성공
		int flag = 0;
		
		
		try {
			con = pool.getConnection();
			// 입력받은 id가 데이터베이스에 존재하는지 확인
			sql = "select id, pw from members where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			// id가 없으니 1을 반환
			if(!rs.next()) {
				flag = 1;
				return flag;
			}
			// sql문을 돌려 나온 비밀번호가 입력받은 비밀번호와 일치하는지 확인
			// 일치하지 않으면 2를 반환
			if(!(rs.getString(2).equals(pw))) {
				flag = 2;
				return flag;
			}
			// 아무것도 걸리지 않으면 3을 반환
			flag = 3;
			
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return flag;
	}
	
	// 더미 계정에 장바구니 임시 등록
	public void insertTempCart(String items) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			
			sql = "update carttbl set items = ? where id = 'admin'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, items);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt);
		}
	}
}


