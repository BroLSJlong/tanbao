package tanbao.entity.entitytable;

/**
 * 订单详情
 * @author 何崇宇
 *
 */
public class OrderDetail {
	/**订单Id */
	private String orderId;
	/**商品Id */
	private String goodsId;
	/**所定商品数量 */
	private String orderNum;
	
	public OrderDetail() {}
	
	public OrderDetail(String orderId, String goodsId, String orderNum) {
		super();
		this.orderId = orderId;
		this.goodsId = goodsId;
		this.orderNum = orderNum;
	}

	public String getOrderId() {
		return orderId;
	}
	
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	public String getGoodsId() {
		return goodsId;
	}
	
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	
	public String getOrderNum() {
		return orderNum;
	}
	
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	
}
