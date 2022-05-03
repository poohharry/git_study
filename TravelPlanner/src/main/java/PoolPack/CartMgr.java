package PoolPack;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CartMgr {
	private DBConnectionMgr pool;

	public CartMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
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
