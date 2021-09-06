package tanbao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tanbao.entity.entitytable.Goods;
import tanbao.util.JDBCUtil;

public class GoodsDao implements BaseDao<Goods>{
	/**
	 * 全部查询
	 */
	public List<Goods> selectAll() {
		ArrayList<Goods> list = new ArrayList<Goods>();
		try {
		Connection co = JDBCUtil.getConnection();
		Statement stmt =  co.createStatement();
		ResultSet rs =  stmt.executeQuery("select goodsId,goodsName,goodsOutPrice,goodsInPrice,goodsDescript,goodsNum,goodsClass from goodstable");
		while(rs.next()) {
			String goodsid = rs.getString("goodsId");
			String goodsname = rs.getString("goodsName");
			String goodsoutprice = rs.getString("goodsOutPrice");
			String goodsinprice = rs.getString("goodsInPrice");
			String goodsdescript = rs.getString("goodsDescript");
			String goodsnum = rs.getString("goodsNum");
			String goodsclass = rs.getString("goodsClass");
			Goods goods = new Goods(goodsid,goodsname,goodsoutprice,goodsinprice,goodsdescript,goodsnum,goodsclass);
			list.add(goods);
		}
		JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Goods> selectAll_admin() {
		ArrayList<Goods> list = new ArrayList<Goods>();
		try {
		Connection co = JDBCUtil.getConnection();
		Statement stmt =  co.createStatement();
		ResultSet rs =  stmt.executeQuery("select goodsId,goodsName,goodsOutPrice,goodsInPrice,goodsDescript,goodsNum,goodsClass from goodstable  ");
		while(rs.next()) {
			String goodsid = rs.getString("goodsId");
			String goodsname = rs.getString("goodsName");
			String goodsoutprice = rs.getString("goodsOutPrice");
			String goodsinprice = rs.getString("goodsInPrice");
			String goodsdescript = rs.getString("goodsDescript");
			String goodsnum = rs.getString("goodsNum");
			String goodsclass = rs.getString("goodsClass");
			 Goods goods = new Goods(goodsid,goodsname,goodsoutprice,goodsinprice,goodsdescript,goodsnum,goodsclass);
			 list.add(goods);
		}
		JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 单个查询 
	 */
	public Goods selectById(String id) {
		Goods goods = null;
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("select goodsId,goodsName,goodsOutPrice,goodsInPrice,goodsDescript,goodsNum,goodsClass from goodstable where goodsId = ?");
			stmt.setString(1,id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				String goodsid = rs.getString("goodsId");
				String goodsname = rs.getString("goodsName");
				String goodsoutprice = rs.getString("goodsOutPrice");
				String goodsinprice = rs.getString("goodsInPrice");
				String goodsdescript = rs.getString("goodsDescript");
				String goodsnum = rs.getString("goodsNum");
				String goodsclass = rs.getString("goodsClass");
				goods = new Goods(goodsid,goodsname,goodsoutprice,goodsinprice,goodsdescript,goodsnum,goodsclass);
			}
			JDBCUtil.closeConnection(co);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return goods;
	}

	/**
	 * 删除
	 */
	public boolean deleteById(String id) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("delete from goodstable where goodsId = ?");
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
	public boolean updateById(Goods goods) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement
("update goodstable set goodsId = ?,goodsName = ?,goodsOutPrice = ?,goodsInPrice = ?,goodsDescript = ? ,goodsNum = ? ,goodsClass = ?  where goodsId = ?");
			stmt.setString(1,goods.getGoodsId());
			stmt.setString(2,goods.getGoodsName());
			stmt.setString(3,goods.getGoodsOutPrice());
			stmt.setString(4,goods.getGoodsInPrice());
			stmt.setString(5,goods.getGoodsDescript());
			stmt.setString(6,goods.getGoodsNum());
			stmt.setString(7,goods.getGoodsClass());
			stmt.setString(8,goods.getGoodsId());
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
	public boolean insert(Goods goods) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement
("insert into  goodstable(goodsId,goodsName,goodsOutPrice,goodsInPrice,goodsDescript,goodsNum,goodsClass) values (?,?,?,?,?,?,?)");
			stmt.setString(1,goods.getGoodsId());
			stmt.setString(2,goods.getGoodsName());
			stmt.setString(3,goods.getGoodsOutPrice());
			stmt.setString(4,goods.getGoodsInPrice());
			stmt.setString(5,goods.getGoodsDescript());
			stmt.setString(6,goods.getGoodsNum());
			stmt.setString(7,goods.getGoodsClass());
			int r = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return r>0;

		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		return false;
	}

	/**
	 *多个查询(通过商品名称) 
	 */
	public List<Goods> queryByName(String name) {
		List<Goods> goodsList = new ArrayList<Goods>();
		try {
			Connection co = JDBCUtil.getConnection();
			String sql = "select goodsId,goodsName,goodsOutPrice,goodsInPrice,goodsDescript,goodsNum,goodsClass from goodstable where goodsName like ?";
			PreparedStatement stmt =  co.prepareStatement(sql);
			stmt.setString(1,"%"+name+"%");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				String goodsid = rs.getString("goodsId");
				String goodsname = rs.getString("goodsName");
				String goodsoutprice = rs.getString("goodsOutPrice");
				String goodsinprice = rs.getString("goodsInPrice");
				String goodsdescript = rs.getString("goodsDescript");
				String goodsnum = rs.getString("goodsNum");
				String goodsclass = rs.getString("goodsClass");
				Goods goods1 = new Goods(goodsid,goodsname,goodsoutprice,goodsinprice,goodsdescript,goodsnum,goodsclass);
				goodsList.add(goods1); 
			}
			JDBCUtil.closeConnection(co);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return goodsList;
	}
	public List<Goods> queryByName_admin(String name) {
		List<Goods> goodsList = new ArrayList<Goods>();
		try {
			Connection co = JDBCUtil.getConnection();
			String sql = "select goodsId,goodsName,goodsOutPrice,goodsInPrice,goodsDescript,goodsNum,goodsClass from goodstable where goodsName like ?";
			PreparedStatement stmt =  co.prepareStatement(sql);
			stmt.setString(1,"%"+name+"%");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				String goodsid = rs.getString("goodsId");
				String goodsname = rs.getString("goodsName");
				String goodsoutprice = rs.getString("goodsOutPrice");
				String goodsinprice = rs.getString("goodsInPrice");
				String goodsdescript = rs.getString("goodsDescript");
				String goodsnum = rs.getString("goodsNum");
				String goodsclass = rs.getString("goodsClass");
				Goods goods1 = new Goods(goodsid,goodsname,goodsoutprice,goodsinprice,goodsdescript,goodsnum,goodsclass);
				goodsList.add(goods1); 
			}
			JDBCUtil.closeConnection(co);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return goodsList;
	}
	/**
	 *  查询商品类型
	 * @param id
	 * @return
	 */
	public String selectClass(String id) {
		String goodsName = null;
		try {
			Connection co = JDBCUtil.getConnection();
			String sql = "select goodsClass from goodstable where goodsId = ?";
			PreparedStatement stmt =  co.prepareStatement(sql);
			stmt.setString(1,id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				goodsName = rs.getString("goodsClass");
			}
			JDBCUtil.closeConnection(co);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return goodsName;
	}
	
	/**
	 * 根据商品类型获取商品
	 */
	public List<Goods> selectByClass(String type){
		ArrayList<Goods> list = new ArrayList<Goods>();
		try {
		Connection co = JDBCUtil.getConnection();
		String sql = "select goodsId,goodsName,goodsOutPrice,goodsInPrice,goodsDescript,goodsNum,goodsClass from goodstable where goodsClass = ?";
		PreparedStatement stmt =  co.prepareStatement(sql);
		stmt.setObject(1, type);
		ResultSet rs =  stmt.executeQuery();
		while(rs.next()) {
			String goodsid = rs.getString("goodsId");
			String goodsname = rs.getString("goodsName");
			String goodsoutprice = rs.getString("goodsOutPrice");
			String goodsinprice = rs.getString("goodsInPrice");
			String goodsdescript = rs.getString("goodsDescript");
			String goodsnum = rs.getString("goodsNum");
			String goodsclass = rs.getString("goodsClass");
			Goods goods = new Goods(goodsid,goodsname,goodsoutprice,goodsinprice,goodsdescript,goodsnum,goodsclass);
			list.add(goods);
		}
		JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 获取全部商品的类型
	 */
	public List<String> selectClass() {
		ArrayList<String> list = new ArrayList<String>();
		try {
		Connection co = JDBCUtil.getConnection();
		Statement stmt =  co.createStatement();
		ResultSet rs =  stmt.executeQuery("select distinct goodsClass from goodstable");
		while(rs.next()) {
			String goodsClass = rs.getString("goodsClass");
			list.add(goodsClass);
		}
		JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
