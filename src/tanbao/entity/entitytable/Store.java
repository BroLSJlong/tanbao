package tanbao.entity.entitytable;

/**
 * 店铺
 * 对应店铺表
 * @author 何崇宇
 *
 */
public class Store {
	/**卖方Id */
	private String sellerId;
	/**商品Id */
	private String goodsId;
	/**店铺名称 */
	private String storeName;
	/**店铺简介*/
	private String storeDescript;
	
	public Store() {}
	
	public Store(String sellerId, String goodsId, String storeName,String storeDescript) {
		super();
		this.sellerId = sellerId;
		this.goodsId = goodsId;
		this.storeName = storeName;
		this.storeDescript = storeDescript;
	}

	public String getSellerId() {
		return sellerId;
	}
	
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	
	public String getGoodsId() {
		return goodsId;
	}
	
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	
	public String getStoreName() {
		return storeName;
	}
	
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreDescript() {
		return storeDescript;
	}

	public void setStoreDescript(String storeDescript) {
		this.storeDescript = storeDescript;
	}

	@Override
	public String toString() {
		return "Store [sellerId=" + sellerId + ", goodsId=" + goodsId + ", storeName=" + storeName + ", storeDescript="
				+ storeDescript + "]";
	}
	
}
