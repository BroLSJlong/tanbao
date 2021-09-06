package tanbao.service;

import java.util.List;

import tanbao.dao.GoodsDao;
import tanbao.dao.GoodsImgDao;
import tanbao.entity.entitytable.Goods;
import tanbao.entity.entitytable.GoodsImg;

public class GoodsService {
	private GoodsDao goodsDao = new GoodsDao();
	private GoodsImgDao goodsImgDao = new GoodsImgDao();
	
	/**
	 * 添加商品（不包括图片）
	 * @param goods
	 * @return
	 */
	public boolean add(Goods goods) {
		return goodsDao.insert(goods);
	}
	
	/**
	 * 添加商品图片
	 * @param goodsImg
	 * @return
	 */
	public boolean addImg(GoodsImg goodsImg) {
		return goodsImgDao.insert(goodsImg);
	}
	
	/**
	 *	删除商品
	 * @param goodsId
	 * @return
	 */
	public boolean delete(String goodsId) {
		boolean b = true;
		if(!goodsImgDao.deleteById(goodsId))b = false;
		if(!goodsDao.deleteById(goodsId))b = false;
		return b;
	}
	
	/**
	 * 更新商品信息
	 * @param goods
	 * @return
	 */
	public boolean update(Goods goods) {
		return goodsDao.updateById(goods);
	}
	
	/**
	 * 修改（保存）商品图片
	 * @param goodsImg
	 * @return
	 */
	public boolean updateGoodsImgService(GoodsImg goodsImg) {
		return goodsImgDao.updateGoodsImg(goodsImg);
	}
	
	/**
	 * 添加商品图片
	 * @param goodsImg
	 * @return
	 */
	public boolean insertImg(GoodsImg goodsImg) {
		return goodsImgDao.insert(goodsImg);
	}
	
	/**
	 * 搜索商品
	 * @param keywords
	 * @return
	 */
	public List<Goods> queryByName(String keywords){
		return goodsDao.queryByName(keywords);
	}
	public List<Goods> queryByName_admin(String keywords){
		return goodsDao.queryByName_admin(keywords);
	}
	/**
	 * 查询全部商品
	 */
	public List<Goods> selectAll(){
		return goodsDao.selectAll();
	}
	public List<Goods> selectAll_admin(){
		return goodsDao.selectAll_admin();
	}
	/**
	 * 查询全部图片
	 */
	public List<GoodsImg> selectAllImgs(){
		return goodsImgDao.selectAllImg();
	}
	
	/**
	 * 查询一个商品的（全部）图片
	 */
	public List<String> selectGoodImgs(String id){
		return goodsImgDao.selectByGoodsId(id);
	}
	
	/**
	 * 根据商品id查询商品
	 */
	public Goods select(String goodsId) {
		return goodsDao.selectById(goodsId);
	}
	
	/**
	 * 根据商品类型获取商品
	 */
	public List<Goods> selectByGoodsClass(String type){
		return goodsDao.selectByClass(type);
	}
	
	/**
	 * 获取全部商品类型
	 * @return
	 */
	public List<String> selectClass(){
		return goodsDao.selectClass();
	}
	
	/**
	 * 获取一个商品的一个图片
	 */
	public String selectOneImgById(String id){
		return goodsImgDao.selectOneById(id); 
	}

	public boolean deleteImg(String imgId) {
		return goodsImgDao.deleteById(imgId);
	}
}
