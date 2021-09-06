package tanbao.entity.entitytable;

/**
 * 订单
 * @author 何崇宇
 *
 */
public class Order {
	/**订单Id */
	private String orderId;
	/**买家用户 */
	private String buyId;
	/**卖方用户 */
	private String sellerId;
	/**订单总价 */
	private String orderPrice;
	/**订单状态 */
	private String state;
	/**收货地址 */
	private String addressId;
	
	public Order() {}
	
	public Order(String orderId, String buyId, String sellerId, String orderPrice, String state, String addressId) {
		super();
		this.orderId = orderId;
		this.buyId = buyId;
		this.sellerId = sellerId;
		this.orderPrice = orderPrice;
		this.state = state;
		this.addressId = addressId;
	}



	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	public String getOrderId() {
		return orderId;
	}
	
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	public String getBuyId() {
		return buyId;
	}
	
	public void setBuyId(String buyId) {
		this.buyId = buyId;
	}
	
	public String getSellerId() {
		return sellerId;
	}
	
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	
	public String getOrderPrice() {
		return orderPrice;
	}
	
	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}
	
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
}
