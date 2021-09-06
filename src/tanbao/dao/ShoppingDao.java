package tanbao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import tanbao.entity.entitytable.Shopping;
import tanbao.util.JDBCUtil;

public class ShoppingDao implements BaseDao<Shopping>{

	/**
	 * 全部查询
	 */
	public ArrayList<Shopping> selectAll() {
		ArrayList<Shopping> list = new ArrayList<Shopping>();
		try {
		Connection co = JDBCUtil.getConnection();
		Statement stmt =  co.createStatement();
		ResultSet rs =  stmt.executeQuery("select userId,goodsId,shopNum from shoppingtable");
		while(rs.next()) {
			String userId = rs.getString("userId");
			String goodsId = rs.getString("goodsId");
			String shopNum = rs.getString("shopNum");
			Shopping  shopping = new Shopping(userId,goodsId,shopNum);
			 list.add(shopping);
		}
		JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return  list;
	}

	/**
	 * 没有单个查询(没有主键)
	 */
	public Shopping selectById(String id) {
		return null;
	}

	/**
	 * 删除
	 */
	public boolean deleteById(String id) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("delete from shoppingtable where goodsId = ?");
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
	public boolean updateById(Shopping shopping) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement
("update shoppingtable set shopNum = ?where userId = ?");
			stmt.setString(1,shopping.getShopNum());
			stmt.setString(2,shopping.getUserId());
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
	public boolean insert(Shopping shopping) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement("insert into shoppingtable(userId,goodsId,shopNum) values (?,?,?)");
			stmt.setString(1,shopping.getUserId());
			stmt.setString(2,shopping.getGoodsId());
			stmt.setString(3,shopping.getShopNum());
			int r = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return r>0;

		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		return false;
	}
	
	/**
	 * 
	 * @param id 用户id
	 * @return 商品id和数量
	 */
	public HashMap<String,String> selectByUserId(String id){
		HashMap<String,String> map = new HashMap<String,String>();
		try {
		Connection co = JDBCUtil.getConnection();
		String sql = "select goodsId,shopNum from shoppingtable where userId = ?";
		PreparedStatement stmt =  co.prepareStatement(sql);
		stmt.setString(1, id);
		ResultSet rs =  stmt.executeQuery();
		while(rs.next()) {
			String goodsId = rs.getString("goodsId");
			String shopNum = rs.getString("shopNum");
			map.put(goodsId, shopNum);
		}
		JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return  map;
	}
}
