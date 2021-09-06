package tanbao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tanbao.entity.entitytable.CollectionGoods;
import tanbao.util.JDBCUtil;

public class CollectionGoodsDao{

	public List<CollectionGoods> selectAll() {
		ArrayList<CollectionGoods> list = new ArrayList<CollectionGoods>();
		try {
		Connection co = JDBCUtil.getConnection();
		Statement stmt =  co.createStatement();
		ResultSet rs =  stmt.executeQuery("select userId,goodsId,sellerId from collectiongoodstable");
		while(rs.next()) {
			String orderId = rs.getString("userId");
			String goodsId = rs.getString("goodsId");
			CollectionGoods collection = new CollectionGoods(orderId,goodsId);
			list.add(collection);
		}
		JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 获取用户的收藏
	 * @param id
	 * @return
	 */
	public List<CollectionGoods> selectByUserId(String id){
		ArrayList<CollectionGoods> list = new ArrayList<CollectionGoods>();
		try {
		Connection co = JDBCUtil.getConnection();
		String sql = "select userId,goodsId from collectiongoodstable where userId = ?";
		PreparedStatement stmt =  co.prepareStatement(sql);
		stmt.setString(1, id);
		ResultSet rs =  stmt.executeQuery();
		while(rs.next()) {
			String orderId = rs.getString("userId");
			String goodsId = rs.getString("goodsId");
			CollectionGoods collection = new CollectionGoods(orderId,goodsId);
			list.add(collection);
		}
		JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 添加收藏
	 */
	public boolean insert(CollectionGoods collectionGoods) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement("insert into collectiongoodstable(userId,goodsId) values (?,?)");
			stmt.setString(1,collectionGoods.getUserId());
			stmt.setString(2,collectionGoods.getGoodsId());
			int r = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return r>0;

		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		return false;
	}
	
	/**
	 * 删除收藏
	 */
	public boolean deleteByIds(CollectionGoods collectionGoods) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("delete from collectiongoodstable where goodsId = ? and userId = ?");
			stmt.setString(1,collectionGoods.getGoodsId());
			stmt.setString(2,collectionGoods.getUserId());
			int rs = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return rs>0;
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 删除用户全部收藏
	 * @param userId
	 * @return
	 */
	public boolean deleteByUserId(String userId) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("delete from collectiongoodstable where userId = ?");
			stmt.setString(1,userId);
			int rs = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return rs>0;
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean isempty(CollectionGoods collectionGoods) {
		boolean b = false;
		try {
		Connection co = JDBCUtil.getConnection();
		String sql = "select userId from collectiongoodstable where userId = ? and goodsId = ?";
		PreparedStatement stmt =  co.prepareStatement(sql);
		stmt.setString(1, collectionGoods.getUserId());
		stmt.setString(2, collectionGoods.getGoodsId());
		ResultSet rs =  stmt.executeQuery();
		while(rs.next()) {
			b = true;
		}
		JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return b;
	}
}
