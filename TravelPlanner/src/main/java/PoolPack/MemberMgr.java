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
		boolean flag = false;
		
		
		
		return true;
	}
}
