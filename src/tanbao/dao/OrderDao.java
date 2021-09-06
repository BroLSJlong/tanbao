package tanbao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tanbao.entity.entitytable.Order;
import tanbao.util.JDBCUtil;

public class OrderDao implements BaseDao<Order>{
	
	/**
	 * 全部查询
	 */
	public List<Order> selectAll() {
		ArrayList<Order> list = new ArrayList<Order>();
		try {
			Connection co = JDBCUtil.getConnection();
			Statement stmt =  co.createStatement();
			ResultSet rs =  stmt.executeQuery("select orderId,buyId,sellerId,orderPrice,state,addressId from ordertable ");
			while(rs.next()) {
				String orderId = rs.getString("orderId");
				String buyId = rs.getString("buyId");
				String sellerId = rs.getString("sellerId");
				String orderPrice = rs.getString("orderPrice");
				String state = rs.getString("state");
				String addressId = rs.getString("addressId");
				Order  order = new Order(orderId,buyId,sellerId,orderPrice,state,addressId);
				 list.add(order);
			}
			JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return  list;
	}

	/**
	 * 单个查询
	 */
	public Order selectById(String id) {
		Order order = null;
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("select orderId,buyId,sellerId,orderPrice,state,addressId from ordertable where orderId = ?");
			stmt.setString(1,id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				String orderId = rs.getString("orderId");
				String buyId = rs.getString("buyId");
				String sellerId = rs.getString("sellerId");
				String orderPrice = rs.getString("orderPrice");
				String state = rs.getString("state");
				String addressId = rs.getString("addressId");
				order = new Order(orderId,buyId,sellerId,orderPrice,state,addressId);
			}
			JDBCUtil.closeConnection(co);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return order;
	}

	/**
	 * 删除
	 */
	public boolean deleteById(String id) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("delete from ordertable where orderId = ?");
			stmt.setString(1,id);
			int rs = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return rs>0;
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return false;
	}

	/**
	 * 更新
	 */
	public boolean updateById(Order order) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement("update ordertable set orderPrice = ?,state = ?,sellerId=? where orderId = ?");
			stmt.setString(1,order.getOrderPrice());
			stmt.setString(2,order.getState());
			stmt.setString(3,order.getSellerId());
			stmt.setString(4,order.getOrderId());
			int r = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return r>0;

		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		return false;
	}

	/**
	 * 增加
	 */
	public boolean insert(Order order) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement("insert into ordertable(orderId,buyId,sellerId,orderPrice,state,addressId) values (?,?,?,?,?,?)");
			stmt.setString(1,order.getOrderId());
			stmt.setString(2,order.getBuyId());
			stmt.setString(3,order.getSellerId());
			stmt.setString(4,order.getOrderPrice());
			stmt.setString(5,order.getState());
			stmt.setString(6,order.getAddressId());
			int r = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return r>0;

		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		return false;
	}

	/**
	 * 根据用户id获取订单id
	 */
	public List<String> selectOrderIdByBuyId(String id,boolean isBuy) {
		ArrayList<String> list = new ArrayList<String>();
		try {
			Connection co = JDBCUtil.getConnection();
			String sql = "select orderId from ordertable where";
			if(isBuy)sql = sql+" buyId = ?";
			else sql = sql + " sellerId = ?";
			PreparedStatement stmt = co.prepareStatement(sql);
			stmt.setString(1, id);
			ResultSet rs =  stmt.executeQuery();
			while(rs.next()) {
				String orderId = rs.getString("orderId");
				list.add(orderId);
			}
			JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return  list;
	}
	
}
