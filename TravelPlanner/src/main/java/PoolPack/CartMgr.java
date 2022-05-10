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
			sql = "update carttbl set items = (select * from (select concat(ifnull(items,\"\"), ',', ifnull((select items from carttbl where id = 'admin'),\"\")) from carttbl where id = ?) as temp) where id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			System.out.println(sql);
			pstmt.executeUpdate();
			
			// 데이터베이스 등록 후 admin장바구니 초기화
			// sql문 2줄을 한번에 돌릴 수 없기 때문에 한번 더 돌려줌
			sql = "update carttbl set items = null where id = 'admin'";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	// 장바구니가 공백인지 판단하는 함수(더미든 유저든 상관없이)
	public boolean isEmpty(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		
		// 값이 비어있으면 true 뭐라도 있으면 false
		boolean flag = true;
		
		try {
			con = pool.getConnection();
			sql = "select items from carttbl where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
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
