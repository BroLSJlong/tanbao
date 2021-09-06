package tanbao.service;

import java.util.List;

import tanbao.dao.GoodsDao;
import tanbao.dao.OrderDao;
import tanbao.dao.OrderDetailDao;
import tanbao.entity.entitytable.Goods;
import tanbao.entity.entitytable.Order;
import tanbao.entity.entitytable.OrderDetail;
import tanbao.util.UUIDUtil;

public class OrderService {
	private OrderDao orderDao = new OrderDao();
	private OrderDetailDao orderDetailDao = new OrderDetailDao();
	
	/**
	 * 添加订单
	 * @param order(卖方id，买方id，地址)，oderDetail(购买商品的id，对应商品购买的数量)
	 * @return
	 */
	public String add(Order order,List<OrderDetail> orderDetail) {
		Double orderPrice = new Double(0);
		String orderId = UUIDUtil.getUUID();
		for(int i = 0; i < orderDetail.size(); i++) {
			orderDetail.get(i).setOrderId(orderId);
			orderDetailDao.insert(orderDetail.get(i));
			Goods g = new GoodsDao().selectById(orderDetail.get(i).getGoodsId());
			orderPrice += Double.parseDouble(g.getGoodsOutPrice());
		}
		order.setOrderId(orderId);
		order.setOrderPrice(orderPrice.toString());
		order.setState("1");
		orderDao.insert(order);
		return orderId;
	}
	
	/**
	 * 订单查询
	 * @param orderId
	 * @return
	 */
	public Order selectOrder(String orderId) {
		return orderDao.selectById(orderId);
	}
	
	/**
	 * 单个订单详情查询
	 */
	public List<OrderDetail> selectOrderDetail(String orderId){
		return orderDetailDao.selectByOrderId(orderId);
	}
	
	/**
	 * 订单删除
	 */
	public boolean deleteOrder(String orderId) {
		boolean b = true;
		if(!orderDao.deleteById(orderId))b = false;
		if(!orderDetailDao.deleteById(orderId))b = false;
		return b;
	}
	
	/**
	 * 更新订单信息
	 * @param order
	 * @param orderDetail
	 * @return
	 */
	public boolean updateOrder(Order order,List<OrderDetail> orderDetail) {
		boolean b = true;
		Double orderPrice = new Double(0);
		for(int i = 0; i < orderDetail.size(); i++) {
			if(!orderDetailDao.updateById(orderDetail.get(i)))return false;
			Goods goods = new GoodsDao().selectById(orderDetail.get(i).getGoodsId());
			Double inPrice = Double.parseDouble(goods.getGoodsInPrice());
			Double outPrice = Double.parseDouble(goods.getGoodsOutPrice());
			orderPrice += (inPrice - outPrice) * Integer.parseInt(orderDetail.get(i).getOrderNum());
		}
		order.setOrderPrice(orderPrice.toString());
		orderDao.updateById(order);
		return b;
	}
	
	public boolean updateOnlyOrder(Order order) {
		return orderDao.updateById(order);
	}
	/**
	 * 全部订单详情查询
	 */
	public List<Order> select(){
		return orderDao.selectAll();
	}
	
}
