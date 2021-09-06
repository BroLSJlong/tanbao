package tanbao.service;

import java.util.HashMap;
import java.util.List;

import tanbao.dao.GoodsDao;
import tanbao.dao.StoreDao;
import tanbao.entity.entitytable.Goods;
import tanbao.entity.entitytable.Store;

public class StoreService {
	private StoreDao storeDao = new StoreDao();
	
	/**
	 * 获取店铺商品id
	 * @param sellerId
	 * @return
	 */
	public List<String> select(String sellerId){
		return storeDao.selectBySellerId(sellerId);
	}
	
	/**
	 * 更新店铺信息
	 */
	
	
	/**
	 * 删除店铺商品
	 * @param goodsId
	 * @return
	 */
	public boolean delete(String goodsId) {
		return storeDao.deleteGoodsByGoodsId(goodsId);
	}
	
	/**
	 * 添加商品
	 * @param store
	 * @return
	 */
	public boolean addGoods(Store store,Goods goods) {
		boolean b = true;
		if(!storeDao.insert(store))b = false;
		if(!new GoodsService().add(goods))b = false;
		return b;
	}
	
	/**
	 * 添加店铺
	 * @param store
	 * @return
	 */
	public boolean addStore(Store store) {
		return storeDao.insert(store);
	}
	
	/**
	 * 获取商店名称
	 * @param sellerId
	 * @return
	 */
	public String selectStore(String sellerId){
		return storeDao.selectStore(sellerId);
	}
	
	/**
	 * 获取店铺
	 * @return
	 */
	public Store selectStoreById(String id) {
		return storeDao.selectStoreById(id);
	}
	
	/**
	 * 获取店铺主要商品类型
	 */
	public String selectStoreClass(String sellerId) {
		List<String> goodsId = storeDao.selectBySellerId(sellerId);
		GoodsDao dao = new GoodsDao();
		HashMap<String,Integer> count = new HashMap<String,Integer>();
		Integer temp;
		for(String id : goodsId) {
			String goodsClass = dao.selectClass(id);
			temp = count.get(goodsClass);
			if(temp == null) {
				temp = 1;
			}else {
				temp++;
			}
			count.put(goodsClass, temp);
		}
		int max = 0;
		String res = null;
		for(String goodsClass : count.keySet()) {
			if(max < count.get(goodsClass)) {
				max = count.get(goodsClass);
				res = goodsClass;
			}
		}
		return res;
	}
	
	/**查看是否拥有店铺*/
	public boolean ifhasstore(String sellerId){
		return storeDao.ifhasstore(sellerId);
	}
	
	/**
	 * 根据商品id获取店铺id
	 */
	public String selectSellerIdByGoodsId(String id) {
		return storeDao.selectSellerIdByGoodsId(id);
	}

	public boolean updateStore(Store store) {
		return storeDao.updateStore(store);
	}
}
