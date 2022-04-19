package PoolPack;

public class CartMgr {
	private DBConnectionMgr pool;

	public CartMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
}
