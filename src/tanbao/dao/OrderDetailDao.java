package tanbao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tanbao.entity.entitytable.OrderDetail;
import tanbao.util.JDBCUtil;

public class OrderDetailDao implements BaseDao<OrderDetail>{

	/**
	 * 全部查询
	 */
	public ArrayList<OrderDetail> selectAll() {
		ArrayList<OrderDetail> list = new ArrayList<OrderDetail>();
		try {
		Connection co = JDBCUtil.getConnection();
		Statement stmt =  co.createStatement();
		ResultSet rs =  stmt.executeQuery("select orderId,goodsId,orderNum from orderdetailtable");
		while(rs.next()) {
			String orderId = rs.getString("orderId");
			String goodsId = rs.getString("goodsId");
			String orderNum = rs.getString("orderNum");
			OrderDetail  orderdetail = new OrderDetail(orderId,goodsId,orderNum);
			 list.add(orderdetail);
		}
		JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 该表没有主键
	 */
	public OrderDetail selectById(String id) {
		return null;
	}

	/**
	 * 根据订单id查询订单详情
	 * @param id
	 * @return
	 */
	public List<OrderDetail> selectByOrderId(String id){
		OrderDetail orderdetail = null;
		List<OrderDetail> list = null;
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("select orderId,goodsId,orderNum from orderdetailtable where orderId = ?");
			stmt.setString(1,id);
			ResultSet rs = stmt.executeQuery();
			list = new ArrayList<OrderDetail>();
			while(rs.next()) {
				String orderId = rs.getString("orderId");
				String goodsId = rs.getString("goodsId");
				String orderNum = rs.getString("orderNum");
				orderdetail = new OrderDetail(orderId,goodsId,orderNum);
				list.add(orderdetail);
			}
			JDBCUtil.closeConnection(co);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return list;
	}
	
	/**
	 * 删除
	 */
	public boolean deleteById(String id) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("delete from orderdetailtable where orderId = ?");
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
	public boolean updateById(OrderDetail orderdetail) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement
("update orderdetailtable set orderNum = ? where orderId = ? and goodsId = ?");
			stmt.setString(1,orderdetail.getOrderNum());
			stmt.setString(2,orderdetail.getOrderId());
			stmt.setString(3, orderdetail.getGoodsId());
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
	public boolean insert(OrderDetail orderdetail) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement
("insert into  orderdetailtable(orderId,goodsId,orderNum) values (?,?,?)");
			stmt.setString(1,orderdetail.getOrderId());
			stmt.setString(2,orderdetail.getGoodsId());
			stmt.setString(3,orderdetail.getOrderNum());
			int r = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return r>0;

		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		return false;
	}
	

}
