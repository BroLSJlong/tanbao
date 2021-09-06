package tanbao.entity.entitytable;

public class CollectionGoods {
	/**用户Id */
	private String userId;
	/**商品Id */
	private String goodsId;
	
	public CollectionGoods() {}
	
	public CollectionGoods(String userId, String goodsId) {
		super();
		this.userId = userId;
		this.goodsId = goodsId;
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
	
}
