package PoolPack;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
