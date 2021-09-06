package tanbao.entity;

import java.util.HashMap;
import java.util.List;

import tanbao.entity.entitytable.User;

public class LoginUser{
	/**用户个人信息*/
	User myInfo;
	/**我的店铺 */
	MyStore myStore;
	/**地址详情信息(地址id与详细地址) */
	private HashMap<String,String> myAddress;
	/**我的购物订单 */
	private List<String> myOrderId;
	/**我的购物车(商品Id，数量) */
	private HashMap<String,String> myShopping;
	
	public LoginUser() {}
	
	public LoginUser(User myInfo, MyStore myStore, HashMap<String, String> myAddress, List<String> myOrderId,
			HashMap<String, String> myShopping) {
		super();
		this.myInfo = myInfo;
		this.myStore = myStore;
		this.myAddress = myAddress;
		this.myOrderId = myOrderId;
		this.myShopping = myShopping;
	}
	
	public User getMyInfo() {
		return myInfo;
	}
	
	public void setMyInfo(User myInfo) {
		this.myInfo = myInfo;
	}
	
	public MyStore getMyStore() {
		return myStore;
	}
	
	public void setMyStore(MyStore myStore) {
		this.myStore = myStore;
	}
	
	public HashMap<String, String> getMyAddress() {
		return myAddress;
	}
	
	public void setMyAddress(HashMap<String, String> myAddress) {
		this.myAddress = myAddress;
	}
	
	public List<String> getMyOrderId() {
		return myOrderId;
	}
	
	public void setMyOrderId(List<String> myOrderId) {
		this.myOrderId = myOrderId;
	}
	
	public HashMap<String, String> getMyShopping() {
		return myShopping;
	}
	
	public void setMyShopping(HashMap<String, String> myShopping) {
		this.myShopping = myShopping;
	}
	
}
