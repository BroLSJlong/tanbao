package tanbao.entity;

import java.util.HashMap;
import java.util.List;

public class MyStore {
	/**店铺名称 */
	private String storeName;
	/**店铺商品与商品图片（商品id，商品图片） */
	private HashMap<String,List<String>> myGoods;
	/**店铺订单 */
	private List<String> storeOrderIds;
	/**店铺简介*/
	private String storeDescript;
	
	public MyStore() {};
	
	public MyStore(String storeName, HashMap<String, List<String>> myGoods, List<String> storeOrderId,String storeDescript) {
		super();
		this.storeName = storeName;
		this.myGoods = myGoods;
		this.storeOrderIds = storeOrderId;
		this.storeDescript = storeDescript;
	}

	public String getStoreName() {
		return storeName;
	}
	
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	
	public HashMap<String, List<String>> getMyGoods() {
		return myGoods;
	}
	
	public void setMyGoods(HashMap<String, List<String>> myGoods) {
		this.myGoods = myGoods;
	}
	
	public List<String> getStoreOrderId() {
		return storeOrderIds;
	}
	
	public void setStoreOrderId(List<String> storeOrderIds) {
		this.storeOrderIds = storeOrderIds;
	}
	
	public String getStoreDescript() {
		return storeDescript;
	}

	public void setStoreDescript(String storeDescript) {
		this.storeDescript = storeDescript;
	}
}
