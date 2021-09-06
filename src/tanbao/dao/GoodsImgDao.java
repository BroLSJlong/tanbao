package tanbao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tanbao.entity.entitytable.GoodsImg;
import tanbao.util.JDBCUtil;

public class GoodsImgDao implements BaseDao<GoodsImg>{
	
	/**
	 * 获取全部商品的全部图片
	 */
	@Override
	public List<String> selectAll() {
//		ArrayList<GoodsImg> res = new ArrayList<GoodsImg>();
//		ArrayList<String> list = new ArrayList<String>();
//		try {
//		Connection co = JDBCUtil.getConnection();
//		Statement stmt =  co.createStatement();
//		ResultSet rs =  stmt.executeQuery("select goodsimgtable.goodsId,goodsimgtable.imgId,goodsimgnum.num from goodsimgtable,"
//				+ "(select goodsId,count(goodsId) as 'num' from goodsimgtable group by goodsId) goodsimgnum"
//				+ "where goodsimgtable.goodsId = goodsimgnum.goodsId"
//				+ "order by goodsimgtable.goodsId");
//		/**判断是否有下一个商品 */
//		while(rs.next()) {
//			/**i为这个商品的图片数量*/
//			int i = rs.getInt("num");
//			String goodsId = rs.getString("goodsId");
//			while(i-- != 0) {
//				String imgId = rs.getString("imgId");
//				list.add(imgId);
//				/**当i为0时，为此商品的最后一张图片*/
//				if(i != 0)rs.next();
//			}
//			res.add(new GoodsImg(goodsId,list));
//		}
//		JDBCUtil.closeConnection(co);
//		}catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return list;
		return null;
	}
	
	/**
	 * 获取全部图片
	 */
	public List<GoodsImg> selectAllImg() {
		ArrayList<GoodsImg> res = new ArrayList<GoodsImg>();
		try {
		Connection co = JDBCUtil.getConnection();
		Statement stmt =  co.createStatement();
		ResultSet rs =  stmt.executeQuery("select goodsid,imgid from goodsimgtable");
		/**判断是否有下一个商品 */
		while(rs.next()) {
			String goodsId = rs.getString("goodsId");
			String imgId = rs.getString("imgId");
			res.add(new GoodsImg(goodsId,imgId));
			}
		JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 没有主键
	 */
	public GoodsImg selectById(String id){return null;}
	
	/**
	 * 获取一个商品的全部图片
	 */
	public List<String> selectByGoodsId(String id) {
		ArrayList<String> list = new ArrayList<String>();
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("select imgId from goodsimgtable where goodsId = ?");
			stmt.setString(1,id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				String imgId = rs.getString("imgId");
				list.add(imgId);
				while(rs.next()) {
					imgId = rs.getString("imgId");
					list.add(imgId);
				}
			}
			JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 删除一张图片
	 * @Parameter ImgId
	 */
	@Override
	public boolean deleteById(String id) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("delete from goodsimgtable where imgId = ?");
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
	 * id不可修改
	 */
	@Override
	public boolean updateById(GoodsImg goodsImg) {
		return false;
	}

	/**
	 * 添加图片
	 */
	@Override
	public boolean insert(GoodsImg goodsImg) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = null;
			stmt = co.prepareStatement("insert into  goodsimgtable(goodsId,imgId) values (?,?)");
			stmt.setString(1,goodsImg.getGoodsId());
			stmt.setString(2,goodsImg.getImgId());
			int r = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return r > 0;

		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		return false;
	}
	
	/**
	 * 修改（保存）商品图片
	 */
	public boolean updateGoodsImg(GoodsImg goodsImg) {
		Connection co = null;
		try {
			String sql = "update goodsimgtable set imgId = ? where goodsId = ?";
			co = JDBCUtil.getConnection();
			PreparedStatement pst = co.prepareStatement(sql);
			pst.setObject(1, goodsImg.getImgId());
			pst.setObject(2, goodsImg.getGoodsId());
			int ret = pst.executeUpdate();
			
			return ret > 0;
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeConnection(co);
		}
		return false;
	}
	
	/**
	 * 查询商品的一张图片
	 * @return
	 */
	public String selectOneById(String id) {
		String img = null;
		Connection co = null;
		try {
			String sql = "select imgId from goodsimgtable where goodsId = ?";
			co  = JDBCUtil.getConnection();
			PreparedStatement pst = co.prepareStatement(sql);
			pst.setObject(1, id);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				img = rs.getString("imgId");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeConnection(co);
		}
		return img;
	}
}
