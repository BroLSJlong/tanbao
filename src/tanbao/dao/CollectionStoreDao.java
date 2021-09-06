package tanbao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tanbao.entity.entitytable.CollectionStore;
import tanbao.util.JDBCUtil;

public class CollectionStoreDao {
	
	public List<CollectionStore> selectAll() {
		ArrayList<CollectionStore> list = new ArrayList<CollectionStore>();
		try {
		Connection co = JDBCUtil.getConnection();
		Statement stmt =  co.createStatement();
		ResultSet rs =  stmt.executeQuery("select userId,sellerId from collectionstoretable");
		while(rs.next()) {
			String orderId = rs.getString("userId");
			String goodsId = rs.getString("sellerId");
			CollectionStore collection = new CollectionStore(orderId,goodsId);
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
	public List<CollectionStore> selectByUserId(String id){
		ArrayList<CollectionStore> list = new ArrayList<CollectionStore>();
		try {
		Connection co = JDBCUtil.getConnection();
		String sql = "select userId,sellerId from collectionstoretable where userId = ?";
		PreparedStatement stmt =  co.prepareStatement(sql);
		stmt.setString(1, id);
		ResultSet rs =  stmt.executeQuery();
		while(rs.next()) {
			String orderId = rs.getString("userId");
			String sellerId = rs.getString("sellerId");
			CollectionStore collection = new CollectionStore(orderId,sellerId);
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
	public boolean insert(CollectionStore collectionGoods) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement("insert into collectionstoretable(userId,sellerId) values (?,?)");
			stmt.setString(1,collectionGoods.getUserId());
			stmt.setString(2,collectionGoods.getSellerId());
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
	public boolean deleteByIds(CollectionStore collectionStore) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("delete from collectionstoretable where sellerId = ? and userId = ?");
			stmt.setString(1,collectionStore.getSellerId());
			stmt.setString(2,collectionStore.getUserId());
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
	 */
	public boolean deleteByUserId(String userId) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("delete from collectionstoretable where userId = ?");
			stmt.setString(1,userId);
			int rs = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return rs>0;
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
