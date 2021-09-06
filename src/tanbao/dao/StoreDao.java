package tanbao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tanbao.entity.entitytable.Store;
import tanbao.util.JDBCUtil;

public class StoreDao implements BaseDao<Store>{

	/**
	 * 全部查询
	 */
	public List selectAll() {
		ArrayList<Store> list = new ArrayList<Store>();
		try {
		Connection co = JDBCUtil.getConnection();
		Statement stmt =  co.createStatement();
		ResultSet rs =  stmt.executeQuery("select sellerId,goodsId,storeName from storetable order by n asc");
		while(rs.next()) {
			String sellerId = rs.getString("sellerId");
			String goodsId = rs.getString("goodsId");
			String storeName = rs.getString("storeName");
			String storeDescript = rs.getString("storeDescript");
			Store  store = new Store(sellerId,goodsId,storeName,storeDescript);
			 list.add(store);
		}
		JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return  list;
	}
	
	
	/**查询是否含有店铺*/
	public boolean ifhasstore(String sellerId) {
		try {
		Connection co = JDBCUtil.getConnection();
		Statement stmt =  co.createStatement();
		ResultSet rs =  stmt.executeQuery("select sellerId from storetable");
		while(rs.next()) {
			if(sellerId.equals(rs.getString("sellerId"))) {
				return true;
			}
		}
		JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return  false;
	}

	/**
	 * 没有单值主键
	 */
	public Store selectById(String id) {
		return null;
	}
	
	/**
	 * 查询店铺中的商品
	 */
	public List<String> selectBySellerId(String id){
		List<String> list = null;
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("select goodsId from storetable where sellerId = ?");
			stmt.setString(1,id);
			ResultSet rs = stmt.executeQuery();
			list = new ArrayList<String>();
			while(rs.next()) {
				String goodsId = rs.getString("goodsId");
				list.add(goodsId);
			}
			
			JDBCUtil.closeConnection(co);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return list;
	}
	
	/**
	 * 获取店铺名
	 */
	public String selectNameBySellerId(String id) {
		String storeName = null;
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("select storeName from storetable where sellerId = ?");
			stmt.setString(1,id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				storeName = rs.getString("storeName");
			}
			JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return  storeName;
	}
	
	/**
	 * 获取店铺简介
	 */
	public String selectDescriptBySellerId(String id) {
		String storeDescript = null;
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("select storeDescript from storetable where sellerId = ?");
			stmt.setString(1,id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				storeDescript = rs.getString("storeDescript");
			}
			JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return  storeDescript;
	}
	
	/**
	 * 删除
	 */
	public boolean deleteById(String id) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("delete from storetable where sellerId = ?");
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
	public boolean updateById(Store store) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement
("update storetable set storeName = ? where sellerId = ?");
			stmt.setString(1,store.getStoreName());
			stmt.setString(2,store.getSellerId());
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
	public boolean insert(Store store) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement("insert into storetable(sellerId,goodsId,storeName,storeDescript) values (?,?,?,?)");
			stmt.setString(1,store.getSellerId());
			stmt.setString(2,store.getGoodsId());
			stmt.setString(3,store.getStoreName());
			stmt.setString(4,store.getStoreDescript());
			int r = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			if (r>0) {
				return true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		return false;
	}
	
	/**
	 *多个查询(通过店铺名称) 
	 */
	public List<Store> queryByName(String name) {
		List<Store> storeList = new ArrayList<Store>();
		try {
			Connection co = JDBCUtil.getConnection();
			String sql = "select * from storetable where name like ?";
			PreparedStatement stmt =  co.prepareStatement(sql);
			stmt.setString(1,"%"+name+"%");
			ResultSet rs = stmt.executeQuery();
			    String sellerId = rs.getString("sellerId");
				String goodsId = rs.getString("goodsId");
				String storeName = rs.getString("storeName");
				String storeDescript = rs.getString("storeDescript");
				Store store1 = new Store(sellerId, goodsId, storeName,storeDescript);
				storeList.add(store1);
			JDBCUtil.closeConnection(co);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return storeList;
	}

	/**
	 * 删除商品
	 * @param id
	 * @return
	 */
	public boolean deleteGoodsByGoodsId(String id) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("delete from storetable where goodsId = ?");
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
	 * 获取店铺名称
	 * @param sellerId
	 * @return
	 */
	public String selectStore(String sellerId) {
		String name = null;
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("select storeName from storetable where sellerId = ?");
			stmt.setString(1,sellerId);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				name = rs.getString("storeName");
			}
			JDBCUtil.closeConnection(co);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return name;
	}


	public String selectSellerIdByGoodsId(String id) {
		String sellerId = null;
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("select sellerId from storetable where goodsId = ?");
			stmt.setString(1,id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				sellerId = rs.getString("sellerId");
			}
			JDBCUtil.closeConnection(co);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return sellerId;
	}


	public Store selectStoreById(String id) {
		Store store = null;
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("select distinct storeName, storeDescript from storetable where sellerId = ?");
			stmt.setString(1,id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				String name = rs.getString("storeName");
				String descript = rs.getString("storeDescript");
				store = new Store(id, null, name, descript);
			}
			JDBCUtil.closeConnection(co);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return store;
	}


	public boolean updateStore(Store store) {
		try {
			int ret = 0;
			String sql="update storetable set storeName=?,storeDescript=? where sellerId =?";
			Connection co = JDBCUtil.getConnection();
			if(null == store.getStoreDescript()) {
				sql="update storetable set storeName=? where sellerId =?";
				PreparedStatement stmt =  co.prepareStatement(sql);
				stmt.setString(1,store.getStoreName());
				stmt.setString(2,store.getSellerId());
				ret = stmt.executeUpdate();
				JDBCUtil.closeConnection(co);
			}else {
				PreparedStatement stmt =  co.prepareStatement(sql);
				stmt.setString(1,store.getStoreName());
				stmt.setString(2,store.getStoreDescript());
				stmt.setString(3,store.getSellerId());
				ret = stmt.executeUpdate();
				JDBCUtil.closeConnection(co);
			}
			
			if (ret>0) {
				return true;
			}
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return false;
	}
}
