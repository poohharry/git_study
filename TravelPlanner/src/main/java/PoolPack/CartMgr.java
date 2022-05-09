package PoolPack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CartMgr {
	private DBConnectionMgr pool;

	public CartMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 더미 계정(admin)에 장바구니 임시 등록
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
	
	// 더미 계정의 장바구니와 로그인된 회원 장바구니 병합
	public void mergeCart(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			// 변수명 설정과 concat으로 회원계정 장바구니와 더미 장바구니를 병합
			// 변수 못씀
			sql = "update carttbl set items = concat(items, ',', '함안') where id = ?;";
					// 병합이후 더미 장바구니 삭제(공백으로 update)
//					+ "update carttbl set items = null where id = 'admin';";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			System.out.println(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	// 더미 장바구니가 공백인지 판단하는 함수
	public boolean isEmpty() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		
		// 값이 비어있으면 true 뭐라도 있으면 false
		boolean flag = true;
		
		try {
			con = pool.getConnection();
			sql = "select items from carttbl where id = 'admin'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// rs의 다음값이 있다는 것은 null이 아니라는 것
				flag = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return flag;
	}

}
