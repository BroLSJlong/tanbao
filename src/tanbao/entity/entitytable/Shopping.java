package tanbao.entity.entitytable;

/**
 * 购物列表
 * @author 何崇宇
 *
 */
public class Shopping {
	/**用户Id */
	private String userId;
	/**商品Id */
	private String goodsId;
	/**商品数量 */
	private String shopNum;
	
	public Shopping () {}
	
	public Shopping(String userId, String goodsId, String shopNum) {
		super();
		this.userId = userId;
		this.goodsId = goodsId;
		this.shopNum = shopNum;
	}

	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getGoodsId() {
		return goodsId;
	}
	
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	
	public String getShopNum() {
		return shopNum;
	}
	
	public void setShopNum(String shopNum) {
		this.shopNum = shopNum;
	}
	
}
