package tanbao.entity.entitytable;

public class CollectionStore {
	/**用户Id */
	private String userId;
	/**店家Id */
	private String sellerId;
	
	public CollectionStore() {}
	
	public CollectionStore(String userId, String sellerId) {
		super();
		this.userId = userId;
		this.sellerId = sellerId;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getSellerId() {
		return sellerId;
	}
	
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	
}
